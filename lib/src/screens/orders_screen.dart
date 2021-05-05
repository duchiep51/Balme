import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../widgets/appbar.dart';

class OrderScreen extends StatelessWidget {
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
                    text: "Balme",
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
      body: Column(
        children: <Widget>[
          DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.lightGreen[900],
            selectedTextColor: Colors.white,
            dateTextStyle: TextStyle(color: Colors.orange[900], fontSize: 20.0),
            dayTextStyle: TextStyle(color: Colors.orange[900], fontSize: 12.0),
            monthTextStyle:
                TextStyle(color: Colors.orange[900], fontSize: 12.0),
            onDateChange: (date) {},
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buildRow(size),
            ),
          ),
        ],
      ),
    );
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
      list.add(Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
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
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              width: 1.0,
                              color: Colors.orange[900],
                            ),
                          ),
                        ),
                        child: Text(
                          '437 Kcal ',
                          style: TextStyle(color: Colors.orange[900]),
                        ),
                      ),
                      Container(
                        child: Text(
                          ' 42, 17, 26',
                          style: TextStyle(color: Colors.orange[900]),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ));
    }
    return list;
  }
}
