import 'package:flutter/material.dart';
import './info.dart';

class InputAgeInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Info info = ModalRoute.of(context).settings.arguments;
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
                child: Container(
                  child: Image.asset(
                    "assets/ruler.png",
                    fit: BoxFit.cover,
                  ),
                  width: 180,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                " Nhập tuổi",
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
                  keyboardType: TextInputType.number,
                  showCursor: true,
                  onSubmitted: (text) {
                    Info.age = int.parse(text);

                    Navigator.pushNamed(
                      context,
                      '/InputGender',
                    );
                  },
                  autofocus: true,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: " vd: 25",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 14.0),
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

  void ontapTextfield(String text) {
    print(text);
  }
}
