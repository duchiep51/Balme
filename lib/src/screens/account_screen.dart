import 'package:flutter/material.dart';
import 'package:swd_project/src/screens/info.dart';
import 'package:swd_project/src/widgets/calories_tracking_screen/tracking_calories.dart';

import 'AboutUs_srceen.dart';
import 'Address_srceen.dart';
import 'Policy_sreen.dart';
import 'InvFriend_sreen.dart';

// class AccountScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: PreferredSize(
//               preferredSize: Size.fromHeight(30),
//               child: AppBar(
//                 backgroundColor: Colors.green,
//                 title: Center(child: Text('Me')),
//               ),
//             ),
//             body: MyApp()));
//   }
// }

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 180,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Row(
                    children: [
                      Container(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            backgroundImage: AssetImage('assets/pic2.jpg'),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Info.name,
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.w500),
                            ),
                            Container(
                                // color: Colors.red,
                                width: 220,
                                child: Row(
                                  children: [
                                    Text(
                                      "Ch???nh s???a t??i kho???n",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey[700]),
                                    ),
                                    Spacer(flex: 4),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 26, 0),
                                      child: Icon(Icons.chevron_right,
                                          color: Colors.grey),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 20,
          ),
          listWidget(Icons.turned_in, "Theo d??i", context, CaloriesTracking()),
          listWidget(Icons.payment, "Thanh to??n", context, InvFriendWidget()),
          listWidget(Icons.location_on, "?????a ch???", context, AddressWidget()),
          Container(
            height: 10,
          ),
          listWidget(Icons.supervised_user_circle, "M???i b???n", context,
              InvFriendWidget()),
          listWidget(
              Icons.mail_outline, "Ph???n h???i", context, InvFriendWidget()),
          Container(
            height: 10,
          ),
          listWidget(Icons.receipt, "Ch??nh s??ch", context, PolicyWidget()),
          listWidget(Icons.settings, "C??i ?????t", context, InvFriendWidget()),
          listWidget(Icons.notification_important, "V??? Balme", context,
              AboutUsWidget()),
          Container(
            height: 20,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 40,
                child: SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    disabledElevation: 5,
                    onPressed: login,
                    child: Text(
                      "Log out",
                      style: TextStyle(color: Colors.green),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        side: BorderSide(color: Colors.green)),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 30,
          ),
          Center(
              child: Text(
            "Version 1.0.1",
            style: TextStyle(color: Colors.grey),
          )),
          Center(
              child: Text(
            "Spring mike Corporation",
            style: TextStyle(color: Colors.grey),
          )),
          Container(
            height: 20,
          ),
        ],
      ),
    );
  }
}

Widget listWidget(
    IconData icon, String name, BuildContext context, Widget widet) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => widet));
    },
    child: Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: 50,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name),
            ),
            Spacer(flex: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
              child: Icon(Icons.chevron_right),
            )
          ],
        ),
      ),
    ),
  );
}

void login() {}
