import 'package:flutter/material.dart';
import '../widgets/line.dart';
import '../widgets/appbar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../screens/restaurant_detail_screen.dart';
import 'combo_detail.dart';
import 'info.dart';

class ListComboScreen extends StatelessWidget {
  final categoryName;
  final imgUrl;
  final storeName;
  final List<String> names = <String>[
    'Diet Daily - Gói fit 3',
    'FitFood VN - Gói cả ngày',
    'Diet Check - Gói Diet Full',
    'Balme - Gói rrưa - chiều',
    'HealRes - Gói 3 bữa',
    'HealRes - Gói sáng - tối'
  ];
  final List<String> comboNames = <String>[
    'Gói Fit 1',
    'Gói Fit 2',
    'Gói Diet Full',
    'Gói trưa - chiều',
    'Gói 3 bữa',
    'Gói Fit 3'
  ];
  final List<String> storeNames = <String>[
    'Diet Daily',
    'FitFood VN',
    'Diet Check ',
    'Balme',
    'HealRes',
    'HealRes'
  ];
  final List<String> address = <String>[
    '269 Liên Phường, q9',
    '17 Võ Văn Tần, q10',
    '183 Trần Nhật Duật, q1',
    '200 Nguyễn Thị Minh Khai, q1',
    '500 Hai Bà Trưng, q1',
    '500 Hai Bà Trưng, q1'
  ];
  final List<String> img = <String>[
    'assets/restaurant1.jpg',
    'assets/restaurant2.jpg',
    'assets/restaurant3.jpg',
    'assets/fitfoodvn.png',
    'assets/low-carb.jpg',
    'assets/low-carb.jpg'
  ];
  final List<String> imgCombo = <String>[
    'assets/fit1.jpg',
    'assets/fit2.jpg',
    'assets/food-set.png',
    'assets/food1.png',
    'assets/food22.png',
    'assets/fit3.jpg'
  ];
  final List<String> prices = <String>[
    '500.000 vnđ',
    '700.000 vnđ',
    '700.000 vnđ',
    '900.000 vnđ',
    '700.000 vnđ',
    '700.000 vnđ'
  ];
  final List<String> distances = <String>[
    '2 km',
    '15 km',
    '14 km',
    '16 km',
    '13 km',
    '13 km'
  ];
  final List<String> comboDetail = <String>[
    'Combo 2 bữa sáng và chiều',
    'Combo 3 bữa sáng, trưa và chiều',
    'Combo 2 bữa sáng và chiều',
    'Combo 3 bữa sáng, trưa và chiều',
    'Combo 2 bữa chiều và tối',
    'Combo 2 bữa sáng và tối',
    'Combo 3 bữa sáng, chiều và tối'
  ];
  final List<String> calories = <String>[
    '2000 calories',
    '2100 calories',
    '2300 calories',
    '1995 calories',
    '1996 calories',
    '2100 calories',
  ];
  final List<double> rates = [5, 4.5, 4.5, 4, 4, 4];

  ListComboScreen({Key key, this.categoryName, this.imgUrl, this.storeName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: HomeAppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context, true),
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: categoryName ?? 'Chế độ',
                    style: TextStyle(color: Colors.lightGreen[900])),
              ],
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Container(
              //     height: size.height * 0.3,
              //     decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage(imgUrl), fit: BoxFit.cover),
              //       color: Colors.lightGreen[300],
              //       borderRadius: BorderRadius.circular(10),
              //       boxShadow: [
              //         BoxShadow(
              //           offset: Offset(0, 4),
              //           blurRadius: 20,
              //           color: Colors.black.withOpacity(0.2),
              //         )
              //       ],
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
              //       child: Align(
              //         alignment: Alignment.bottomLeft,
              //         child: Text(
              //           'Learn from ',
              //           style: TextStyle(color: Colors.white, fontSize: 24.0),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   height: 200.0,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage(imgUrl), fit: BoxFit.cover),
              //   ),
              // ),
              // MaterialButton(
              //   height: 50.0,
              //   minWidth: double.infinity,
              //   color: Colors.green[800],
              //   onPressed: () {
              //     _showMyDialog(context);
              //   },
              //   child: Text(
              //     'Chi tiết',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              // buildSharingCard(size),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10.0),
              //   child: Line(),
              // ),
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    Text(" Danh sách Combo",
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.lightGreen[900],
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              Container(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 10.0, right: 5.0, left: 10.0),
                  itemCount: Combo.titles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildSharingCard(
                        size,
                        Combo.imgCombos[index],
                        Combo.titles[index],
                        Combo.calories[index],
                        Combo.prices[index],
                        () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ComboDetail(
                                          category: Combo.categories[index],
                                          calo: Combo.calories[index],
                                          name: Combo.titles[index],
                                        )),
                              ),
                            },
                        storeNames[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSharingCard(size, url, title, subtitle, price, press, detail) {
    return InkWell(
      onTap: press ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          // height: size.height * 0.15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 0.12 * size.height,
                width: 0.12 * size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(url), fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  top: 5.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title ?? 'title',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      detail ?? 'detail',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Padding(
                      padding: EdgeInsets.only(top: 0.0),
                      child: Text(
                        // address[index],
                        price ?? 'price',
                        style: TextStyle(color: Colors.orange[900]),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          subtitle ?? 'subtitle',
                          style: TextStyle(color: Colors.lightGreen[900]),
                        ),
                        Text('', style: TextStyle(color: Colors.orange[900])),
                        Text(
                          '',
                          style: TextStyle(color: Colors.lightGreen[900]),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                // borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.black12,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 20,
                                    color: Color(0xFFB0CCE1).withOpacity(0.32),
                                  )
                                ],
                              ),
                              child: Text(
                                "Free ship",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                // borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.black12,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 20,
                                    color: Color(0xFFB0CCE1).withOpacity(0.32),
                                  )
                                ],
                              ),
                              child: Text(
                                "Discount 20%",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(context) async {
    String detail = '- Ít muối, chất béo bão hoà, cholestorol và các chất béo khác. \n' +
        '- Nhiều trái cây, rau củ, sữa và các chế phẩm từ sữa không béo hoặc hàm lượng béo \n ' +
        '- Thực đơn cũng bao gồm ngũ cốc nguyên hạt, cá, thịt gia cầm và các loại hạt. \n' +
        '- Hạn chế lượng thịt đỏ, đồ ngọt, các thực phẩm có chứa đường. \n' +
        '- Giàu kali, magie, canxi, protein và chất xơ.';
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Chi tiết'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(detail),
              ],
            ),
          ),
          actions: <Widget>[
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
}
