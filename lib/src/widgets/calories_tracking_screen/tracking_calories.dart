import 'package:flutter/material.dart';
import 'package:swd_project/src/screens/info.dart';
import 'package:translator/translator.dart';
import 'dart:async';
import 'package:vector_math/vector_math.dart' as math;
import '../translator.dart';

class CaloriesTracking extends StatefulWidget {
  @override
  _CaloriesTrackingState createState() {
    return _CaloriesTrackingState();
  }
}

class _CaloriesTrackingState extends State<CaloriesTracking> {
  double currentCalories = 500;
  final myController = TextEditingController();
  FoodBloc _bloc = new FoodBloc();
  List<int> mealInDay = [2, 1, 1, 1, 1];
  List<String> food = [
    '300g thịt heo, 2 quả trứng gà, 200g khoai tây',
    '300g thịt bò, 2 quả trứng gà',
    '500g thịt bò',
    '500g thịt bò',
    '500g thịt bò',
    '500g thịt bò',
  ];

  @override
  void dispose() {
    myController.dispose();
    _bloc.dispose();
    super.dispose();
  }

  void trackCalories(int calories) {
    setState(() {
      currentCalories += calories;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: bodyBuild(height, width),
    );
  }

  Widget bodyBuild(double height, double width) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: height * 0.38,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: const Radius.circular(0),
            ),
            child: Container(
              color: Colors.limeAccent[300],
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
                      "Hello, " + Info.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                    trailing: ClipOval(child: Image.asset('assets/pic2.jpg')),
                  ),
                  Row(
                    children: <Widget>[
                      // StreamBuilder(
                      //   stream: _bloc.result,
                      //   builder: (context, AsyncSnapshot<Result> snapshot) {
                      //     if (snapshot.hasData) {
                      //       return _RadialProgress(
                      //         width: height * 0.2,
                      //         height: height * 0.2,
                      //         progress: currentCalories +
                      //             double.parse(snapshot.data.calories),
                      //         target: Info.kcalCalculate().toDouble(),
                      //       );
                      //     } else if (snapshot.hasError) {
                      //       return _RadialProgress(
                      //         width: height * 0.2,
                      //         height: height * 0.2,
                      //         progress: currentCalories,
                      //         target: Info.kcalCalculate().toDouble(),
                      //       );
                      //     }
                      //     return _RadialProgress(
                      //       width: height * 0.2,
                      //       height: height * 0.2,
                      //       progress: currentCalories,
                      //       target: Info.kcalCalculate().toDouble(),
                      //     );
                      //   },
                      // ),
                      _RadialProgress(
                        width: height * 0.2,
                        height: height * 0.2,
                        progress: currentCalories,
                        target: Info.target,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Mục tiêu tháng: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF200087),
                                  ),
                                ),
                                TextSpan(text: "\n"),
                                TextSpan(
                                  text: "- Giảm 2 - 4 kg",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF200087),
                                  ),
                                ),
                                TextSpan(text: "\n"),
                                TextSpan(
                                  text: "Mục tiêu ngày: ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF200087),
                                  ),
                                ),
                                TextSpan(text: "\n"),
                                TextSpan(
                                  text: "- giảm 500 lượng \n calories ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF200087),
                                  ),
                                ),
                                TextSpan(text: "\n"),
                              ],
                            ),
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
          top: height * 0.35,
          left: 10.0,
          right: 10.0,
          child: MaterialButton(
            height: 50,
            minWidth: 100.0,
            color: Colors.lightGreen[900],
            onPressed: () {
              _showMyDialog(context);
            },
            child: Text(
              'Thêm bữa ăn',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        ),
        Positioned(
          top: height * 0.45,
          left: 10.0,
          right: 10.0,
          child: buildPageView(height),
        ),
      ],
    );
  }

  final controller = PageController(
    initialPage: 1,
  );

  Widget buildPageView(double height) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.red,
        width: 500.0,
        height: 380.0,
        child: PageView(
          // physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: <Widget>[
            monthTracking(height, 6),
            monthTracking(height, 7),
            monthTracking(height, 8),
          ],
        ),
      ),
    );
  }

  Container monthTracking(double height, int month) {
    List<String> day = [
      // 'Chủ nhật',
      // 'Thứ 7',
      'Thứ 6',
      'Thứ 5',
      'Thứ 4',
      'Thứ 3',
      'Thứ 2'
    ];

    return Container(
      color: Colors.grey[100],
      height: height,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Tháng trước',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '$month/2020',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen[900]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Tháng sau',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400]),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, i) {
                return dateTracking(day[i], 17 - i, mealInDay[i]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding dateTracking(String day, int date, int i) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 70.0,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    '$date',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(' $day \n tháng 7 2020'),
                ),
              ],
            ),
          ),
          Column(
            children: getMeal(i, "500g thịt bò, 2 quả trứng gà"),
          ),
        ],
      ),
    );
  }

  List<Widget> getMeal(int quantity, text) {
    List<Widget> result = List();
    for (int i = 0; i < quantity; i++) {
      result.add(
        GestureDetector(
          onTap: () {},
          child: new Container(
            width: double.infinity,
            height: 70.0,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 30.0,
                    // child: Icon(Icons.),
                    child: ClipOval(
                      child: Image.asset('assets/pic2.jpg'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Container(
                      //   width: 100.0,
                      //   child: Text(
                      //     ' Ăn sáng',
                      //     style: TextStyle(fontSize: 16.0),
                      //     overflow: TextOverflow.ellipsis,
                      //   ),
                      // ),
                      Container(
                        width: 170.0,
                        child: Text(
                          '${food[i]}',
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    ' 400 calories',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.orange[900],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return result;
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thêm món ăn'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Nhập tên món ăn và số lượng.'),
                TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "  vd: 200g thịt bò",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 14.0),
                    fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Thêm'),
              onPressed: () {
                print(myController.text);
                // trackCalories(int.parse(myController.text));
                // print(currentCalories);
                // translate(text)
                //     .then((value) => _bloc.fetchResult(getFoodList(text)));
                // _bloc.fetchResult(getFoodList(myController.text));
                setState(() {
                  mealInDay[0]++;
                  food.insert(0, myController.text);
                });
                trackCalories(260);

                myController.clear();

                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Thoát'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Future<void> _showEditDialog(index) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: true, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Thêm món ăn'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               // Text('Nhập bữa ăn của bạn'),
  //               myController.
  //               TextField(

  //                 controller: myController,
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('Thêm'),
  //             onPressed: () {
  //               print(myController.text);
  //               // trackCalories(int.parse(myController.text));
  //               // print(currentCalories);
  //               // translate(text)
  //               //     .then((value) => _bloc.fetchResult(getFoodList(text)));
  //               // _bloc.fetchResult(getFoodList(myController.text));
  //               setState(() {
  //                 food.insert(0, myController.text);
  //               });
  //               trackCalories(260);

  //               myController.clear();

  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           FlatButton(
  //             child: Text('Thoát'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}

List<String> getFoodList(String text) {
  List<String> result = [];
  result = text.split(',');
  print(result);
  return result;
}

Future<String> translate(String text) {
  GoogleTranslator _translator = GoogleTranslator();
  return _translator.translate(text, to: "en");
}

class _RadialProgress extends StatelessWidget {
  final double height, width, progress, target;

  const _RadialProgress(
      {Key key, this.height, this.width, this.progress, this.target})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(
        progress: progress / 2500,
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
                  text: (target.toInt() - progress.toInt()).toString(),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF200087),
                  ),
                ),
                TextSpan(text: "\n"),
                TextSpan(
                  text: "Calories còn lại",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF200087),
                  ),
                ),
                TextSpan(text: "\n"),
                TextSpan(
                  text: progress.toInt().toString() +
                      "/" +
                      target.toInt().toString(),
                  style: TextStyle(
                    fontSize: 12,
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
      ..color = const Color(0xFF200087)
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
