import 'package:flutter/material.dart';
import '../blocs/login_bloc.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  LoginBloc _loginBloc = new LoginBloc();

  bool isSignin;

  LoginPage({Key key, this.isSignin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        child:
                            Image(image: AssetImage('assets/Balme-logo.png')),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Text('Welcome to Balme',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        makeInput(label: 'Email'),
                        makeInput(label: 'Password', obscureText: true)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          onSignInClicked();
                        },
                        color: Colors.red[600],
                        // elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Container(
              // ),
            ],
          )),
    );
  }

  void onSignInClicked() {
    if (_loginBloc.isValidInfo(
        _userController.text, _passwordController.text)) {
      isSignin = true;
      print('Sign in successfully!');
    }
  }

  Widget makeInput({label, obscureText = false}) {
    return StreamBuilder(
      stream:
          label == 'Email' ? _loginBloc.userStream : _loginBloc.passwordStream,
      builder: (context, snapshot) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black87),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller:
                label == 'Email' ? _userController : _passwordController,
            style: TextStyle(color: Colors.black),
            obscureText: obscureText,
            decoration: InputDecoration(
              errorText: snapshot.hasError ? snapshot.error : null,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[400],
                ),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.grey[400],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
