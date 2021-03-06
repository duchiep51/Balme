import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../screens/list_store_screen.dart';

class CarouselDemo extends StatefulWidget {
  CarouselDemo() : super();

  final String title = "Carousel Demo";

  @override
  CarouselDemoState createState() => CarouselDemoState();
}

class CarouselDemoState extends State<CarouselDemo> {
  List list = [
    "assets/p4.jpg",
    "assets/fit1.jpg",
    "assets/fit3.jpg",
    "assets/food1.png",
    "assets/food22.png",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 200.0),
      items: [0, 1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListStoreScreen(
                            categoryName: 'Dash Diet',
                            imageUrl: 'assets/Dash-Diet.jpg',
                          )),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image(
                  image: AssetImage(list[i]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class MonthlyTracking extends StatefulWidget {
  MonthlyTracking() : super();

  @override
  MonthlyTrackingState createState() => MonthlyTrackingState();
}

class MonthlyTrackingState extends State<MonthlyTracking> {
  List list = [
    "assets/p4.jpg",
    "assets/fit1.jpg",
    "assets/fit3.jpg",
    "assets/food1.png",
    "assets/food22.png",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 200.0),
      items: [0, 1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                color: Colors.lightGreen[900],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class ComboCarouselDemo extends StatefulWidget {
  ComboCarouselDemo() : super();

  final String title = "Carousel Demo";

  @override
  _ComboCarouselDemoState createState() => _ComboCarouselDemoState();
}

class _ComboCarouselDemoState extends State<ComboCarouselDemo> {
  List list = [
    "assets/p4.jpg",
    "assets/fit1.jpg",
    "assets/fit3.jpg",
    "assets/food1.png",
    "assets/food22.png",
  ];
  List title = [
    "G??i Fit Full",
    "G??i Fit 1",
    "G??i Fit 3",
    "G??i Fit 4",
    "G??i Fit 5",
  ];
  List prices = [
    "600.000 ??",
    "700.000 ??",
    "750.000 ??",
    "650.000 ??",
    "800.000 ??",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 350.0),
      items: [0, 1, 2, 3, 4].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              // height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.7,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image(
                    image: AssetImage(list[i]),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(Icons.remove_circle_outline),
                  //     ),
                  //     Text('1'),
                  //     IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(Icons.add_circle_outline),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title[i] ?? 'G??i FIT 3',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Text('600,000??',
                          style: TextStyle(
                              color: Colors.orange[900],
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'G??i S??NG - TR??A - T???I. ??n c??? ng??y ph?? h???p cho ng?????i b???n r???n',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
