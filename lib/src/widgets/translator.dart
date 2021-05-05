import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:http/http.dart' show Client;
import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:vector_math/vector_math.dart' as math;

class FoodBloc {
  final _resultFetcher = PublishSubject<Result>();

  Observable<Result> get result => _resultFetcher.stream;

  fetchResult(List<String> foodName) async {
    print('fetch result');
    Result result = await fetchFoodDetail(foodName);
    _resultFetcher.sink.add(result);
  }

  dispose() {
    _resultFetcher.close();
  }

  Client client = Client();

  // String api =
  //     'https://api.edamam.com/api/nutrition-data?app_id=7d5ee400&app_key=eb1f50b1892e9742dd51a9b371ef9721&ingr=';
  String api =
      'https://api.edamam.com/api/nutrition-details?app_id=7d5ee400&app_key=eb1f50b1892e9742dd51a9b371ef9721';

  static List<String> listfood = [
    "1 fresh ham, about 18 pounds, prepared by your butcher",
    "7 cloves garlic, minced",
    "1 tablespoon caraway seeds, crushed",
    "4 teaspoons salt",
    "Freshly ground pepper to taste",
    "1 teaspoon olive oil",
    "1 medium onion, peeled and chopped",
    "3 cups sourdough rye bread, cut into 1/2-inch cubes",
    "1 1/4 cups coarsely chopped pitted prunes",
    "1 1/4 cups coarsely chopped dried apricots",
    "1 large tart apple, peeled, cored and cut into 1/2-inch cubes",
    "2 teaspoons chopped fresh rosemary",
    "1 egg, lightly beaten",
    "1 cup chicken broth, homemade or low-sodium canned"
  ];

  Future<Result> fetchFoodDetail(List<String> foodName) async {
    print('fetch food');
    String title = ' Fresh Ham Roasted With Rye Bread and Dried Fruit Stuffing';
    String prep =
        'Have your butcher bone and butterfly the ham and score the fat in a diamond pattern.';
    String yield1 = 'About 15 servings';

    Recipe recipe = new Recipe(title, prep, yield1, foodName);

    var recipe1 = jsonEncode(recipe);

    Map<String, String> headers = {"Content-type": "application/json"};

    final response = await client.post(api, headers: headers, body: recipe1);

    if (response.statusCode == 200) {
      return Result.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}

// class Nutrient

class Recipe {
  final String title;
  final String prep;
  final String yield1;
  final List<String> ingr;

  Recipe(this.title, this.prep, this.yield1, this.ingr);
  Map<String, dynamic> toJson() =>
      {'title': title, 'prep': title, 'yield': yield1, 'ingr': ingr};
}

class Result {
  String _calories;
  Map<String, dynamic> _totalNutrients;

  Result.fromJson(Map<String, dynamic> parsedJson) {
    String calories = parsedJson['calories'].toString();
    Map<String, dynamic> totalNutrients = parsedJson['totalNutrients'];

    totalNutrients.forEach((key, value) {
      // print('$key');
      // print('$value');
      value.remove("label");
      value["amount"] = value["quantity"];
      value.remove("quantity");
    });
    print('calories: ' + calories);
    print('total: $totalNutrients');
    _calories = calories;
    _totalNutrients = totalNutrients;
  }

  String get calories => _calories;
}

class Translator extends StatefulWidget {
  @override
  _TranslatorState createState() {
    return _TranslatorState();
  }
}

class _TranslatorState extends State<Translator> {
  FoodBloc _bloc = new FoodBloc();

  GoogleTranslator _translator = GoogleTranslator();
  String text = '1 large apple';

  void translate() {
    _translator.translate(text, to: "en").then(
          (ouput) => {
            setState(() {
              text = ouput;
            })
          },
        );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: getBody(height, width),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     Center(
      //       child: Column(
      //         children: <Widget>[
      //           Text(text),
      //           StreamBuilder(
      //             stream: _bloc.result,
      //             builder: (context, AsyncSnapshot<Result> snapshot) {
      //               if (snapshot.hasData) {
      //                 return Text(snapshot.data._calories);
      //               } else if (snapshot.hasError) {
      //                 return Text(snapshot.error.toString());
      //               }
      //               return Text('nothing');
      //             },
      //           )
      //         ],
      //       ),
      //     ),
      //     RaisedButton(
      //       child: Text('Press'),
      //       onPressed: () {
      //         _bloc.fetchResult(text);
      //         translate();
      //       },
      //     ),
      //   ],
      // ),
    );
  }

  Widget getBody(double height, double width) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: height * 0.38,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: const Radius.circular(40),
            ),
            child: Container(
              color: Colors.white,
              padding:
                  EdgeInsets.only(top: 30, left: 32, right: 16, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Date, Year',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    subtitle: Text(
                      "Hello, Hiep",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                    trailing: ClipOval(child: Image.asset('assets/pic2.jpg')),
                  ),
                  Row(
                    children: <Widget>[
                      _RadialProgress(
                          width: height * 0.2, height: height * 0.2),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _IngredientProgress(
                            ingredient: "Protein",
                            progress: 0.3,
                            progressColor: Colors.green,
                            leftAmount: 72,
                            width: width * 0.28,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _IngredientProgress(
                            ingredient: "Carbs",
                            progress: 0.2,
                            progressColor: Colors.red,
                            leftAmount: 252,
                            width: width * 0.28,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _IngredientProgress(
                            ingredient: "Fat",
                            progress: 0.1,
                            progressColor: Colors.yellow,
                            leftAmount: 61,
                            width: width * 0.28,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: height * 0.38,
          left: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: const Radius.circular(40),
            ),
            child: Container(
              color: Colors.grey,
              height: height,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text('Meals for today'),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _RadialProgress extends StatelessWidget {
  final double height, width, progress;

  const _RadialProgress({Key key, this.height, this.width, this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(
        progress: 0.7,
      ),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "1731",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF200087),
                  ),
                ),
                TextSpan(text: "\n"),
                TextSpan(
                  text: "kcal left",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF200087),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Color(0xFF200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width / 2),
      math.radians(-90),
      math.radians(-relativeProgress),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;

  const _IngredientProgress(
      {Key key,
      this.ingredient,
      this.leftAmount,
      this.progress,
      this.progressColor,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredient.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text("${leftAmount}g left"),
          ],
        ),
      ],
    );
  }
}
