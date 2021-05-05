import 'package:flutter/material.dart';
import '../widgets/menu_components/tab_menu.dart';
import '../widgets/appbar.dart';

class Detail extends StatelessWidget {
  final category;
  final calo;
  final name;

  bool showSnackBar = false;
  String description =
      '- Ít muối, chất béo bão hoà, cholestorol và các chất béo khác. \n' +
          '- Nhiều trái cây, rau củ, sữa và các chế phẩm từ sữa không béo hoặc hàm lượng béo \n ' +
          '- Thực đơn cũng bao gồm ngũ cốc nguyên hạt, cá, thịt gia cầm và các loại hạt. \n' +
          '- Hạn chế lượng thịt đỏ, đồ ngọt, các thực phẩm có chứa đường. \n' +
          '- Giàu kali, magie, canxi, protein và chất xơ.';

  Detail({Key key, this.category, this.calo, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      leading: IconButton(
                        onPressed: () => Navigator.pop(context, true),
                        icon: Icon(Icons.arrow_back),
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.lightGreen[300],
                      expandedHeight: 200,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Hero(
                          tag: 'dash',
                          child: Image(
                            image: AssetImage('assets/fit3.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 0.0),
                            // height: 280.0,
                            color: Colors.grey[300],
                            // color: Colors.red,
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  color: Colors.white,
                                  // height: 260.0,
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text('${name ?? 'Gói fit 3'}',
                                              style: TextStyle(
                                                  color: Colors.orange[900],
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.w400)),
                                          Text('750.000đ',
                                              style: TextStyle(
                                                  color: Colors.orange[900],
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(),
                                          Text('$calo',
                                              style: TextStyle(
                                                  color: Colors.orange[900],
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      MaterialButton(
                                        height: 35.0,
                                        minWidth: double.infinity,
                                        color: Colors.green[800],
                                        onPressed: () {
                                          _showMyDialog(context);
                                        },
                                        child: Text(
                                          'Chi tiết',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10.0,
                                      // ),
                                      // Text('Gói 2 bữa TRƯA - TỐI (Best Seller)',
                                      //     style: TextStyle(
                                      //         fontSize: 18.0,
                                      //         fontWeight: FontWeight.w400)),
                                      // SizedBox(
                                      //   height: 10.0,
                                      // ),
                                      // Text(
                                      //     '- Giao 02 phần ăn tận nơi mỗi ngày, từ thứ 2 đến thứ 6.',
                                      //     style: TextStyle(
                                      //         fontSize: 18.0,
                                      //         fontWeight: FontWeight.w400)),
                                      // SizedBox(
                                      //   height: 10.0,
                                      // ),
                                      // Text(
                                      //     '- Calories khoảng ${calo ?? '2200/ngày'}',
                                      //     style: TextStyle(
                                      //         fontSize: 18.0,
                                      //         fontWeight: FontWeight.w400)),
                                      // SizedBox(
                                      //   height: 10.0,
                                      // ),
                                      // Text(
                                      //     '- Kèm tinh bột phức, ít đường, đảm bảo ko bột ngọt, nhiều rau củ và chất đạm',
                                      //     style: TextStyle(
                                      //         fontSize: 18.0,
                                      //         fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       top: 10.0, bottom: 10.0),
                                //   child: Container(
                                //     padding: EdgeInsets.all(20.0),
                                //     color: Colors.white,
                                //     width: double.infinity,
                                //     child: Row(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.spaceBetween,
                                //       children: <Widget>[
                                //         Column(
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: <Widget>[
                                //             Text(
                                //               'Chế độ dinh dưỡng: ',
                                //               style: TextStyle(
                                //                   color: Colors.lightGreen[900],
                                //                   fontSize: 14.0),
                                //             ),
                                //             Text(
                                //               category ?? 'Dash Diet',
                                //               style: TextStyle(
                                //                   color: Colors.lightGreen[900],
                                //                   fontSize: 24.0),
                                //             ),
                                //           ],
                                //         ),
                                //         MaterialButton(
                                //           height: 50.0,
                                //           minWidth: 100.0,
                                //           color: Colors.green[800],
                                //           onPressed: () {
                                //             _showMyDialog(context);
                                //           },
                                //           child: Text(
                                //             'Tìm hiểu',
                                //             style:
                                //                 TextStyle(color: Colors.white),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          TabMenu(),
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

  Widget snackBar(title, context) {
    return SnackBar(
      duration: Duration(hours: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.lightGreen[300],
      content: Container(
        height: 50.0,
        child: Row(
          children: <Widget>[
            Container(
              // child: Icon(
              //   Icons.fastfood,
              //   size: 40.0,
              // ),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/Confirm',
                    );
                  },
                  child: Text(
                    'Đặt ngay',
                    style: TextStyle(
                        color: Colors.orange[900],
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              width: 30.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.0),
              child: Column(
                children: <Widget>[
                  Container(
                    // height: 30.0,
                    child: Text(
                      title ?? 'Gói Fit 3',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[900],
                      ),
                    ),
                  ),
                  Container(
                    // height: 30.0,
                    child: Text(
                      '750,000 đ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[900],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      action: SnackBarAction(
        label: 'Hủy',
        textColor: Colors.orange[900],
        onPressed: () {
          showSnackBar = false;
        },
      ),
    );
  }

  Future<void> _showMyDialog(context) async {
    String detail = '- Gói 3 bữa SÁNG - TRƯA - TỐI (Best Seller) \n' +
        '- Giao 03 phần ăn tận nơi mỗi ngày, từ thứ 2 đến thứ 6. \n ' +
        '- Calories khoảng ${calo ?? '2200/ngày'}';

    String cateDetail =
        '- Hạn chế lượng thịt đỏ, đồ ngọt, các thực phẩm có chứa đường. \n' +
            '- Kèm tinh bột phức, ít đường, đảm bảo ko bột ngọt, nhiều rau củ và chất đạm';
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
                '$name',
                style: TextStyle(color: Colors.lightGreen[900]),
              )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(detail),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text('Chế độ: '),
                    Text(
                      '$category',
                      style: TextStyle(color: Colors.orange[900]),
                    )
                  ],
                ),
                Text(cateDetail)
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



