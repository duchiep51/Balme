import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final Widget leading, title;
  final List<Widget> action;
  const HomeAppBar({this.leading, this.title, this.action});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: leading,
      title: title,
      actions: action,
    );
  }
}
