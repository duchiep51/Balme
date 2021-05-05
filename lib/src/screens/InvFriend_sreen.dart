import 'package:flutter/material.dart';
import 'package:swd_project/src/widgets/appbar.dart';

class InvFriendWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    text: "Mời bạn bè", style: TextStyle(color: Colors.black)),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 20,
            ),
            listWidget("Gửi SMS", context),
            listWidget("Gửi Email", context),
            listWidget("Copy link tải app", context),
            Container(
              height: 20,
            ),
            Container(
              height: 350,
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
      ),
    );
  }
}

Widget listWidget(String name, BuildContext context) {
  return GestureDetector(
    child: Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: 50,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
              child: Text(name ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
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
