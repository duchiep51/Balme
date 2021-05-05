import 'dart:async';

import 'package:rxdart/rxdart.dart';
import '../validators/login_validator.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passwordStream => _passwordController.stream;

  bool isValidInfo(String username, String password) {
    // if (!Validations.isValidUser(username)) {
    //   _userController.sink.addError("Invalid username!");
    //   return false;
    // }
    // _userController.sink.add("OK!");
    // if (!Validations.isValidPassword(password)) {
    //   _passwordController.sink.addError(("Invalid password!"));
    //   return false;
    // }
    // _passwordController.sink.add("OK!");
    // return true;

    return true;
  }

  void dispose() {
    _userController.close();
    _passwordController.close();
  }
}
