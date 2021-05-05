import 'package:flutter/material.dart';
import 'package:swd_project/src/screens/booked_detail.dart';
import '../widgets/appbar.dart';
import 'info.dart';

class Payment extends StatefulWidget {
  @override
  PaymentState createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  final List<String> img = [
    'assets/restaurant1.jpg',
    'assets/restaurant2.jpg',
    'assets/restaurant3.jpg',
    'assets/restaurant3.jpg',
  ];

  final List<String> name = [
    " Nhà hàng Hải sản Rivia",
    " Quán ăn đường phố Wall",
    " Nhà hàng ka lộ lộ",
    " Quán ăn phát biết liền",
    " Nhà hàng đệ nhất gấu đỏ",
    " Nhà hàng Hảo Hảo"
  ];

  final List<String> add = [
    " 18 nguyễn cư trinh,p.bình thợ",
    " 195 nguyễn chi phương,p.tân hiệp",
    " 652 Lê Đức Hiệp,p.Duck Kip,Quận 1",
    " 12 Lê Thánh Tôn ,p.tân bình ,Quận 3",
    " 84 Trần Công Đoàn,p.bến tre, Quận Gò...",
    " 111 Lê Quang Định,p.20, Quận BT"
  ];

  final List<IconData> orderImg = [
    Icons.attach_money,
    Icons.card_membership,
    Icons.atm
  ];

  final List<String> time = [
    "Tiền mặt",
    "Momo",
    "Thẻ ngân hàng",
  ];

  final List<String> isDone = [
    "true",
    "false",
    "false",
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
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
                      text: 'Chọn phương thức thanh toán',
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
        // body is the majority of the screen.
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: 450,
                height: 600,
                child: ListView.builder(
                  // reverse: true,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: isDone.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          getPayment(index, isDone);
                        });
                      },
                      child: Card(
                        child: ListTile(
                          leading: Container(
                            width: 100.0,
                            height: 100.0,
                            child: Icon(
                              orderImg[index],
                              size: 30.0,
                            ),
                          ),
                          title: Text('${time[index]}'),
                          trailing: isDone[index] == 'true'
                              ? Icon(
                                  Icons.check,
                                  color: Colors.green[400],
                                )
                              : Container(
                                  width: 20.0,
                                ),
                          // isThreeLine: true,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
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
          title: Text('Xác nhận hủy gói'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bạn có chắc muốn hủy gói Fit 3'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Đồng ý'),
              onPressed: () {
                setState(() {
                  isDone.removeAt(0);
                });
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
}

void getPayment(int index, state) {
  print('pay');
  for (var i = 0; i < state.length; i++) {
    state[i] = "false";
  }
  state[index] = "true";
}
