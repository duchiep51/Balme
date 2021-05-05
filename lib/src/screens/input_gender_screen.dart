import 'package:flutter/material.dart';
import '../widgets/drop_down_box.dart';

import './info.dart';

class InputGender extends StatelessWidget {
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
              padding: const EdgeInsets.all(16.0),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: <Widget>[
                    SettingsWidget(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 0),
                      child: SizedBox(
                        height: 40,
                        width: 320,
                        child: RaisedButton(
                          onPressed: () {
                            Info.gender = Gender.gender;
                            Navigator.pushNamed(
                              context,
                              '/Home',
                            );
                          },
                          child: Text(
                            "Xong",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
