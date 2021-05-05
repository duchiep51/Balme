import 'package:flutter/material.dart';
import 'package:swd_project/src/widgets/appbar.dart';
import '../widgets/line.dart';
import '../screens/restaurant_detail_screen.dart';

class ConfirmScreen extends StatelessWidget {
  bool showSnackBar = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                      text: 'Xác nhận đơn hàng',
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
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey[300],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  height: height * 0.27,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Giao hàng',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: <Widget>[
                          Image(
                            height: 100.0,
                            width: 100.0,
                            image: AssetImage('assets/location.png'),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              _showMyDialog(context);
                            },
                            child: Container(
                              width: width * 0.6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Trần Đức Hiệp - 077 958 0909',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _showMyDialog(context);
                                    },
                                    child: Text(
                                        'Lô E2a-7, Đường D1, Khu Công Nghệ Cao, Long Thạnh Mỹ, Quận 9, Hồ Chí Minh 700000, Việt Nam',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text('10 km',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Line(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Giao vào tuần sau - T2 20/7 - 07:00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: height * 0.30,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Text('FitFoodVn',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image(
                            // width: 100.0,
                            height: 70.0,
                            image: AssetImage('assets/fit3.jpg'),
                          ),
                          Text('Gói Fit 3',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold)),
                          Text('750.000đ',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Line(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Phí vận chuyển (10km - 5 ngày)',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold)),
                          Text('150.000đ',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Tổng cộng',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold)),
                          Text('900.000đ',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    padding: EdgeInsets.all(10.0),
                    height: height * 0.28,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Nhập mã khuyến mãi',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                            Container(
                              width: 200.0,
                              height: 40,
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: TextField(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                decoration: InputDecoration(
                                  labelStyle:
                                      TextStyle(color: Colors.grey[200]),
                                  hintText: "abcd",
                                  hintStyle: TextStyle(color: Colors.grey[350]),
                                  fillColor: Colors.black,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Text('Ghi chú',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold)),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Thêm ghi chú'),
                          maxLines: 10,
                          minLines: 3,
                        ),
                        SizedBox(height: 30.0),
                        Line(),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Phương thức thanh toán',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/Payment',
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    height: height * 0.09,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.attach_money),
                                Text('Tiền mặt',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            MaterialButton(
                              color: Colors.lightGreen[900],
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/Payment',
                                );
                              },
                              child: Text(
                                'Thay đổi',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 50.0,
                    disabledElevation: 5,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/Home',
                      );
                    },
                    child: Text(
                      "Đặt hàng",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    color: Colors.orange[900],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        side: BorderSide(color: Colors.orange[900])),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> _showMyDialog(context) async {
    String detail = 'Giỏ hàng đã có gói Fit 1 \n Bạn có muốn thay gói ';
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thay đổi địa chỉ nhận hàng'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text('Nhập địa chỉ mới'), TextField()],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Thay đổi'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Hủy'),
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
