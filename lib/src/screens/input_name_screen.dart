import 'package:flutter/material.dart';

import './info.dart';

class InputNameInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green[400],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 45, 10, 20),
              child: Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.green,
                  backgroundImage: AssetImage('assets/input-name.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Xin chào! \nHãy nhập tên của bạn",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                child: TextField(
                  showCursor: true,
                  onSubmitted: (text) {
                    Info.name = text;

                    Navigator.pushNamed(
                      context,
                      '/InputHeight',
                    );
                  },
                  autofocus: true,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: " vd: hiep",
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
