import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  // final String title, description, buttonText;
  // final Image image;

  // CustomDialog({
  //   @required this.title,
  //   @required this.description,
  //   @required this.buttonText,
  //   this.image,
  // });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
          child: Container(
            color: Colors.white,
            height: 600,
            width: 600,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(child: Text("Hi ! We need more infomation about you")),
                  Text("YOUR NAME"),
                  Container(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "your name",
                          fillColor: Colors.green,
                          hoverColor: Colors.green),
                    ),
                  ),
                  Text("GENDER"),
                  Container(),
                  Text("HEIGHT"),
                  Container(),
                  Text("WIDTH"),
                  Container(),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 515,
            right: 115,
            child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green,
                backgroundImage: NetworkImage(
                    'https://image.flaticon.com/icons/png/512/1424/1424093.png'))),
      ],
    );
  }
}
