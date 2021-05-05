import 'package:flutter/material.dart';
import 'package:swd_project/src/screens/combo_detail.dart';
import '../../screens/list_combo_screen.dart';
import '../../widgets/drop_down_box.dart';
import '../../screens/info.dart';
import '../../screens/restaurant_detail_screen.dart';
import './slideshow.dart';
import '../card.dart';
import '../../screens/list_store_screen.dart';
import '../line.dart';
import '../../screens/info.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool showResult = true;
  var TDEE = Info.kcalCalculate().round();

  final List<String> names = <String>[
    'Diet Daily',
    'FitFood VN',
    'Diet Check',
    'Balme',
    'HealRes'
  ];

  final List<String> address = <String>[
    '269 Liên Phường, q9',
    '17 Võ Văn Tần, q10',
    '183 Trần Nhật Duật, q1',
    '200 Nguyễn Thị Minh Khai, q1',
    '500 Hai Bà Trưng, q1'
  ];

  final List<String> img = <String>[
    'assets/restaurant1.jpg',
    'assets/restaurant2.jpg',
    'assets/restaurant3.jpg',
    'assets/fitfoodvn.png',
    'assets/low-carb.jpg'
  ];

  final List<String> prices = <String>[
    '500k-700k',
    '700-1100k',
    '700k-900k',
    '900k-1300k',
    '700k-1300k'
  ];

  final List<String> distances = <String>[
    '2km',
    '15km',
    '14km',
    '16km',
    '13km'
  ];

  final List<String> titles = <String>[
    'Gói trưa - chiều',
    'Gói 3 bữa',
    'Gói fit 3',
    'Gói cả ngày',
    'Gói Diet',
  ];

  final List<String> calories = <String>[
    '2000 calories',
    '2100 calories',
    '2300 calories',
    '1995 calories',
    '1996 calories',
  ];
  void initState() {
    super.initState();
    if (Info.showResult)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Info.showResult = false;
        _showResultDialog(context);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lightGreen[300],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 20,
                      color: Colors.black.withOpacity(0.2),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            backgroundImage: AssetImage('assets/pic2.jpg'),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Xin chào, ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          Info.name ?? '',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Calories cần nạp trong ngày: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.lightGreen[900],
                              ),
                            ),
                            TextSpan(
                              text: TDEE.toString() ?? '',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: RichText(
                        text: Info.target != 0
                            ? TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Mục tiêu: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.lightGreen[900],
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        (Info.kcalCalculate() - 500).toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              )
                            : TextSpan(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Line(),
            Line(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Chế độ ăn",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.orange[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "Xem tất cả",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.lightGreen[900],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CategoryCard(
                    title: 'Tăng huyết áp',
                    url: "assets/Dash-Diet.jpg",
                    press: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListComboScreen(
                                  categoryName: 'Dash Diet',
                                  imgUrl: 'assets/Dash-Diet.jpg',
                                )),
                      ),
                    },
                  ),
                  CategoryCard(
                    title: 'Suy tim',
                    url: "assets/eat-clean.jpg",
                    press: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListComboScreen(
                                  categoryName: 'Eat Clean',
                                  imgUrl: 'assets/eat-clean.jpg',
                                )),
                      ),
                    },
                  ),
                  CategoryCard(
                    title: 'Low Cab',
                    url: "assets/low-carb.jpg",
                    press: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListComboScreen(
                                  categoryName: 'Low Carb',
                                  imgUrl: 'assets/low-carb.jpg',
                                )),
                      ),
                    },
                  ),
                ],
              ),
            ),
            Line(),
            Line(),
            Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
              padding: EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Top Đánh Giá",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[900],
                    ),
                  ),
                  Text(
                    "Xem tất cả",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.lightGreen[900],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: getRatings(context),
                ),
              ),
            ),
            Line(),
            Line(),
            DiscountCard(),
            Line(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Danh sách cửa hàng",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.orange[900]),
                      ),
                    ],
                  ),
                  Text(
                    "Xem tất cả",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.lightGreen[900],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: getStores(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getRatings(BuildContext context) {
    List<Widget> results = [];
    final List<double> rates = [5, 4.5, 4.5, 4, 4];
    final List<String> prices = <String>[
      '500.000 vnđ',
      '700.000 vnđ',
      '700.000 vnđ',
      '900.000 vnđ',
      '700.000 vnđ',
    ];
    final List<String> promos = <String>[
      '400.000 vnđ',
      '560.000 vnđ',
      '560.000 vnđ',
      '720.000 vnđ',
      '560.000 vnđ',
    ];

    final List<String> imgCombos = <String>[
      'assets/fit3.jpg',
      'assets/food-set.png',
      'assets/fit2.jpg',
      'assets/food1.png',
      'assets/fit1.jpg'
    ];

    [0, 1, 2, 3, 4].forEach(
      (i) => results.add(EmentorCard(
        title: '${titles[i]}',
        subtitle: '${names[i]} ',
        detail: '${prices[i]}/tuần',
        secondDetail: '${calories[i]}/ngày',
        promo: '${promos[i]}/tuần',
        url: imgCombos[i],
        rate: rates[i],
        press: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantDetail(
                name: names[i],
                address: address[i],
                rate: rates[i],
                img: img[i],
                distance: distances[i],
              ),
            ),
          ),
        },
      )),
    );
    return results;
  }

  List<Widget> getPromos(BuildContext context) {
    List<Widget> results = [];
    final List<double> rates = [5, 4.5, 4.5, 4, 4];

    final List<String> prices = <String>[
      '500.000 vnđ',
      '700.000 vnđ',
      '700.000 vnđ',
      '900.000 vnđ',
      '700.000 vnđ',
    ];

    final List<String> imgCombos = <String>[
      'assets/fit1.jpg',
      'assets/fit2.jpg',
      'assets/fit3.jpg',
      'assets/food-set.png',
      'assets/food1.png',
    ];

    final List<String> promos = <String>[
      '400.000 vnđ',
      '560.000 vnđ',
      '560.000 vnđ',
      '720.000 vnđ',
      '560.000 vnđ',
    ];
    [0, 1, 2, 3, 4].forEach(
      (i) => results.add(EmentorCard(
        title: '${titles[i]}',
        subtitle: '${names[i]}',
        detail: '${prices[i]}/tuần',
        secondDetail: '${calories[i]}/ngày',
        promo: '${promos[i]}/tuần',
        url: imgCombos[i],
        rate: rates[i],
        press: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantDetail(
                name: names[i],
                address: address[i],
                rate: rates[i],
                img: img[i],
                distance: distances[i],
              ),
            ),
          ),
        },
      )),
    );
    return results;
  }

  List<Widget> getStores(BuildContext context) {
    List<Widget> results = [];
    final List<double> rates = [5, 4.5, 4.5, 4, 4];
    [0, 1, 2, 3, 4].forEach(
      (i) => results.add(
        StoreCard(
          rate: rates[i],
          url: img[i],
          title: names[i],
          detail: address[i],
          press: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantDetail(
                  name: names[i],
                  address: address[i],
                  rate: rates[i],
                  img: img[i],
                  distance: distances[i],
                ),
              ),
            ),
          },
        ),
      ),
    );
    return results;
  }

  Future<void> _showSetUpTargetDialog(context) async {
    Size size = MediaQuery.of(context).size;

    List targets = [
      "Giữ cân",
      "Tăng cân",
      "Giảm cân",
    ];

    List periods = [
      "1 tháng",
      "2 tháng",
      "6 tháng",
      "1 năm",
    ];

    final controller = PageController(
      initialPage: 0,
    );

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Colors.lightGreen[900],
                  ),
                ),
              ),
              child: Text(
                'Đặt mục tiêu',
                style: TextStyle(color: Colors.lightGreen[900]),
              )),
          content: SingleChildScrollView(
            child: Container(
              height: size.height * 0.44,
              width: size.width * 0.7,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Chỉ số BMI của bạn là: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.lightGreen[900],
                              ),
                            ),
                            TextSpan(
                              text: Info.bmiCalculate().toStringAsPrecision(3),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Thể trạng: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.lightGreen[900],
                              ),
                            ),
                            TextSpan(
                              text: Info.bmiClassify(Info.bmiCalculate()),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TargetSettingsWidget(
                        text: 'Bạn muốn:',
                        list: targets,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text('Nhập số kg bạn muốn:'),
                      ),
                      Container(
                        width: 100.0,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          showCursor: true,
                          // autofocus: true,
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "  xx KG",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                            fillColor: Colors.grey,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TargetSettingsWidget(
                        text: "Trong vòng:",
                        list: periods,
                      ),
                      SizedBox(
                        height: 27.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            child: Text('Hủy'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('Tiếp theo'),
                            onPressed: () {
                              controller.nextPage(
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.easeInOut,
                              );
                              controller.jumpToPage(1);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Số calories cần để duy trì hàng ngày: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.lightGreen[900],
                              ),
                            ),
                            TextSpan(
                              text: Info.kcalCalculate().toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange[900],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                          'Bạn cần giảm 500 calories mỗi ngày để hoàn thành mục tiêu.',
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.lightGreen[900])),
                      SizedBox(
                        height: 20.0,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Mục tiêu hàng ngày: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.lightGreen[900],
                              ),
                            ),
                            TextSpan(
                              text: (Info.kcalCalculate() - 500).toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ),
                            ),
                            TextSpan(
                              text: ' Calories',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.lightGreen[900],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            child: Text('Quay lại'),
                            onPressed: () {
                              controller.jumpToPage(0);
                            },
                          ),
                          FlatButton(
                            child: Text('Hủy'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('Thiết lập'),
                            onPressed: () {
                              setState(() {
                                Info.target = (Info.kcalCalculate() +
                                    Info.kcalCalculate() / 10);
                              });

                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showResultDialog(context) async {
    String detail = 'Giỏ hàng đã có gói Fit 1 Bạn có muốn thay gói ';
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Colors.lightGreen[900],
                  ),
                ),
              ),
              child: Text(
                'Chỉ số của bạn',
                style: TextStyle(color: Colors.lightGreen[900]),
              )),
          content: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Chỉ số BMI của bạn là: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.lightGreen[900],
                      ),
                    ),
                    TextSpan(
                      text: Info.bmiCalculate().toStringAsPrecision(3),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Thể trạng: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.lightGreen[900],
                      ),
                    ),
                    TextSpan(
                      text: Info.bmiClassify(Info.bmiCalculate()),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  child: Text(
                      'Chỉ số BMI (chỉ số khối cơ thể) là điểm số tiêu chuẩn để xác định mức cân nặng của một người dựa trên chiều cao, cân nặng của cơ thể.')),
              SizedBox(
                height: 20.0,
              ),
              Info.bmiClassify(Info.bmiCalculate()).contains("Gầy")
                  ? Container(
                      child: Text(
                        'Bạn cần tăng cân.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.lightGreen[900],
                        ),
                      ),
                    )
                  : Info.bmiClassify(Info.bmiCalculate()).contains("Thừa cân")
                      ? Container(
                          child: Text(
                            'Bạn cần giảm cân.',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.lightGreen[900],
                            ),
                          ),
                        )
                      : Info.bmiClassify(Info.bmiCalculate())
                              .contains("Béo phì")
                          ? Container(
                              child: Text(
                                'Bạn cần giảm cân.',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.lightGreen[900],
                                ),
                              ),
                            )
                          : Container()
            ],
          )),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class InfoWidget extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String address;

  const InfoWidget({Key key, this.imgUrl, this.name, this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(seconds: 1),
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Container(
            width: 300,
            height: 330,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Image.network(
                        imgUrl,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      width: 300,
                      height: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            width: 250,
                            height: 34,
                            child: Text(name, style: TextStyle(fontSize: 20))),
                        Text(address,
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 15)),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ])),
      ),
    );
  }
}
