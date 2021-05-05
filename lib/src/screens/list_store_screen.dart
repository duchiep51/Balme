import 'package:flutter/material.dart';
import 'package:swd_project/src/widgets/card.dart';
import '../widgets/appbar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../screens/restaurant_detail_screen.dart';

class ListStoreScreen extends StatelessWidget {
  final String categoryName;
  final String imageUrl;
  final List<String> names = <String>[
    'Diet Daily',
    'FitFood VN',
    'Diet Check',
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
  final List<String> prices = <String>[
    '500k - 700k vnđ',
    '700-1100k vnđ',
    '700k-900k vnđ',
    '900k-1300k vnđ',
    '700k-1300k vnđ',
    '700k-1300k vnđ'
  ];
  final List<String> distances = <String>[
    '2 km',
    '15 km',
    '14 km',
    '16 km',
    '13 km',
    '13 km'
  ];
  final List<double> rates = [5, 4.5, 4.5, 4, 4, 4];

  ListStoreScreen({Key key, this.categoryName, this.imageUrl})
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
                    text: 'Danh sách cửa hàng',
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
              Container(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 10.0, right: 5.0, left: 20.0),
                  itemCount: names.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RestaurantDetail(
                                name: names[index],
                                address: address[index],
                                rate: rates[index],
                                img: img[index],
                                distance: distances[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 0.14 * size.height,
                          child: Center(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 0.12 * size.height,
                                  width: 0.12 * size.height,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(img[index]),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.0,
                                    top: 10.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        names[index],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          address[index],
                                          style: TextStyle(
                                              color: Colors.grey[600]),
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.0, bottom: 5.0),
                                            child: SmoothStarRating(
                                                allowHalfRating: false,
                                                onRated: (v) {},
                                                starCount: 5,
                                                rating: rates[index],
                                                color: Colors.yellow,
                                                borderColor: Colors.yellow,
                                                spacing: 0.0),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 20.0),
                                            child: Text(
                                              prices[index],
                                              style: TextStyle(
                                                  color: Colors.orange[900]),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        child: Row(
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(0, 4),
                                                      blurRadius: 20,
                                                      color: Color(0xFFB0CCE1)
                                                          .withOpacity(0.32),
                                                    )
                                                  ],
                                                ),
                                                child: Text(
                                                  "Free ship",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(0, 4),
                                                      blurRadius: 20,
                                                      color: Color(0xFFB0CCE1)
                                                          .withOpacity(0.32),
                                                    )
                                                  ],
                                                ),
                                                child: Text(
                                                  "Discount 20%",
                                                  style: TextStyle(
                                                      color: Colors.red),
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
                      ),
                    );
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
