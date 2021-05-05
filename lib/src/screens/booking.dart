import 'package:flutter/material.dart';
import 'package:swd_project/src/screens/booked_detail.dart';
import '../widgets/appbar.dart';
import 'info.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
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

  final List<String> orderImg = [
    'assets/fit1.jpg',
    'assets/fit2.jpg',
    'assets/fit3.jpg',
    'assets/fitfood1.jpg'
  ];

  final List<String> time = [
    "6h sáng",
    "6h sáng",
    "6h sáng",
    "6h sáng",
  ];

  final List<String> isDone = [
    "false",
    "false",
    "false",
    "false",
  ];

  final List<String> reason = [
    "true",
    "false",
    "false",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightGreen[300],
              centerTitle: true,
              title: Text(
                "Đơn Hàng",
                style: TextStyle(fontSize: 20),
              ),
              bottom: TabBar(
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
                labelColor: Colors.orange[900],
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Đang giao hàng",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Lịch sử",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // body is the majority of the screen.
            body: TabBarView(
              children: [
                SingleChildScrollView(
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
                            return Card(
                              child: ListTile(
                                leading: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Detail(
                                                category: Combo.categories[2],
                                                calo: Combo.calories[2],
                                                name: Combo.titles[2],
                                              )),
                                    );
                                  },
                                  child: Container(
                                    width: 80,
                                    height: 120,
                                    child: Image(
                                      height: 120,
                                      width: 90,
                                      image: AssetImage(orderImg[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Detail(
                                                  category: Combo.categories[2],
                                                  calo: Combo.calories[2],
                                                  name: Combo.titles[2],
                                                )),
                                      );
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                      child: Text(
                                        'Gói Fit 3',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                                subtitle: isDone[0].contains('false')
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Detail(
                                                      category:
                                                          Combo.categories[2],
                                                      calo: Combo.calories[2],
                                                      name: Combo.titles[2],
                                                    )),
                                          );
                                        },
                                        child: Container(
                                          width: 300,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: 25,
                                                  width: 300,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(Icons.home),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 4, 0, 0),
                                                        child: Container(
                                                          height: 40,
                                                          width: 145,
                                                          child: Text(
                                                            ':18 đường số 2 Phường phạm ngũ lão',
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 10),
                                                child: Container(
                                                  child: Text(
                                                    'Thời gian giao :17h30',
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Text('Đã hoàn thành'),
                                trailing: MaterialButton(
                                  onPressed: isDone[index].contains('false')
                                      ? () {
                                          _showMyDialog(context);
                                        }
                                      : () {},
                                  color: isDone[index].contains('false')
                                      ? Colors.red
                                      : Colors.grey[300],
                                  child: Text(
                                    'Hủy gói',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                isThreeLine: true,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // tab lich su
                SingleChildScrollView(
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
                            return Card(
                              child: ListTile(
                                leading: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Detail(
                                                category: Combo.categories[2],
                                                calo: Combo.calories[2],
                                                name: Combo.titles[2],
                                              )),
                                    );
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    child: Image(
                                      image: AssetImage(orderImg[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Detail(
                                                  category: Combo.categories[2],
                                                  calo: Combo.calories[2],
                                                  name: Combo.titles[2],
                                                )),
                                      );
                                    },
                                    child: Text('Gói eat clean 2')),
                                subtitle: isDone[index].contains('false')
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Detail(
                                                      category:
                                                          Combo.categories[2],
                                                      calo: Combo.calories[2],
                                                      name: Combo.titles[2],
                                                    )),
                                          );
                                        },
                                        child: Text(
                                          'Đã hoàn thành  23/09/19',
                                          style: TextStyle(
                                              color: Colors.orange[900]),
                                        ),
                                      )
                                    : Text('Đã hoàn thành'),
                                trailing: MaterialButton(
                                  onPressed: isDone[index].contains('false')
                                      ? () {
                                          _showMyDialog(context);
                                        }
                                      : () {},
                                  color: isDone[index].contains('false')
                                      ? Colors.green
                                      : Colors.grey[300],
                                  child: Text(
                                    'Đặt lại',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                isThreeLine: true,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
    // Scaffold is a layout for the major Material Components.
  }

  Future<void> _showMyDialog(context) async {
    String detail = 'Giỏ hàng đã có gói Fit 1 \n Bạn có muốn thay gói ';
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận hủy gói'),
          content: BuildDialog(reason: reason),
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

class BuildDialog extends StatefulWidget {
  const BuildDialog({
    Key key,
    @required this.reason,
  }) : super(key: key);

  final List<String> reason;

  @override
  _BuildDialogState createState() => _BuildDialogState();
}

class _BuildDialogState extends State<BuildDialog> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Text('Bạn có chắc muốn hủy gói Fit 3'),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                getPayment(0, widget.reason);
              });
            },
            child: Card(
              child: ListTile(
                title: Text('Tôi muốn chọn gói khác'),
                trailing: widget.reason[0] == 'true'
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
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                getPayment(1, widget.reason);
              });
            },
            child: Card(
              child: ListTile(
                title: Text('Tôi không thể nhận hàng'),
                trailing: widget.reason[1] == 'true'
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
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                getPayment(2, widget.reason);
              });
            },
            child: Card(
              child: ListTile(
                title: Text('Khác'),
                trailing: widget.reason[2] == 'true'
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
          ),
        ],
      ),
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
