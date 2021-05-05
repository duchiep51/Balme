import 'package:flutter/material.dart';

class TabMenu extends StatelessWidget {
  // String menu
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 400.0,
      // padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              // leading: IconButton(
              //   icon: Text(""),
              // ),
              actions: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'tuần sau',
                          style: TextStyle(color: Colors.orange[900]),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12.0,
                          color: Colors.orange[900],
                        ),
                      ],
                    ),
                  ),
                )
              ],
              centerTitle: true,
              title: Column(
                children: <Widget>[
                  Text(
                    'Thực đơn tuần này',
                    style: TextStyle(
                      color: Colors.lightGreen[900],
                    ),
                  ),
                  Text(
                    'Từ 20.7 đến 26.7',
                    style: TextStyle(
                      color: Colors.lightGreen[900],
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.lightGreen[300],
              elevation: 0,
              bottom: TabBar(
                  labelColor: Colors.orange[900],
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.white),
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("T2"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("T3"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("T4"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("T5"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("T6"),
                      ),
                    ),
                  ]),
            ),
            body: Container(
              width: 500,
              height: 300,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TabBarView(children: buildMenuContent(size)),
            ),
          )),
    );
  }

  List<Widget> buildMenuContent(Size size) {
    List<Widget> list = new List();

    for (int i = 0; i < 5; i++) {
      list.add(
        Container(
          padding: EdgeInsets.only(left: 10.0, top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: buildRow(size),
          ),
        ),
      );
    }

    return list;
  }

  List<Widget> buildRow(Size size) {
    List<Widget> list = new List();
    List<String> time = ['Sáng', 'Trưa', 'Tối'];
    List<String> meal = [
      'BÒ KHOAI TÂY ĐÚT LÒ',
      'HEO SỐT NƯỚC MẮM + GẠO LỨC',
      'GÀ NƯỚNG PAPRIKA + NUI RAU CỦ'
    ];
    for (int i = 0; i < 3; i++) {
      list.add(new Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 0.0),
            width: size.width * 0.3,
            height: size.height * 0.1,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 1.0,
                  color: Colors.lightGreen[900],
                ),
              ),
            ),
            child: Center(
                child: Text(
              time[i],
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          Container(
            padding: EdgeInsets.only(top: 0.0),
            width: size.width * 0.6,
            height: size.height * 0.1,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Container(
                    child: Text(
                      meal[i],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Loaded Baked Potatoes',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      // decoration: BoxDecoration(
                      //   border: Border(
                      //     right: BorderSide(
                      //       width: 1.0,
                      //       color: Colors.orange[900],
                      //     ),
                      //   ),
                      // ),
                      child: Text(
                        '700 Kcal ',
                        style: TextStyle(color: Colors.orange[900]),
                      ),
                    ),
                    Container(
                      child: Text(
                        ' ',
                        style: TextStyle(color: Colors.orange[900]),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ));
    }
    return list;
  }
}
