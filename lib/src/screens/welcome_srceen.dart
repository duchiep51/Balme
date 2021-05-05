import 'package:flutter/material.dart';

class WelcomeSrceen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(
                'https://scontent.fsgn2-4.fna.fbcdn.net/v/t1.15752-9/100323871_880388772480069_4516742631023181824_n.png?_nc_cat=109&_nc_sid=b96e70&_nc_oc=AQngnvlNTpNoGLMWGfILRMp1Oi-qVrCdtHzKhoRTa60c-9Lc9zqcRv7DlfqnVBapuVRuX_CDaVNqgXwBvuicoDmM&_nc_ht=scontent.fsgn2-4.fna&oh=0236666e53a3cc187a1a22445902a23c&oe=5F0B13A3',
                width: 150,
              ),
              // Container(child: ),
              Container(
                // color: Colors.red,
                width: 400,
                height: 400,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 370,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 40),
                                  child: Image(
                                    image: AssetImage('assets/welcome1.jpg'),
                                    fit: BoxFit.cover,
                                    width: 300,
                                  ),
                                ),
                                Text(
                                  "Heath & wellness without\nrestriction",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30),
                                ),
                                Text(
                                  "turns out, you don't have to give up your favorite food to look and feel amazing. We'll show you how",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ]),
                        ),
                        Container(
                          width: 370,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 40),
                                  child: Image(
                                    image: AssetImage('assets/welcome1.jpg'),
                                    width: 300,
                                  ),
                                ),
                                Text(
                                  "Heath & wellness without\nrestriction",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30),
                                ),
                                Text(
                                  "turns out, you don't have to give up your favorite food to look and feel amazing. We'll show you how",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ]),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  height: 40,
                  width: 320,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/InputName');
                    },
                    child: Text(
                      "GET STARTED ",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text(""), Text("")],
              ),
            ],
          ),
        ));
  }
}
