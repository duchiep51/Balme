import 'package:flutter/material.dart';
import 'package:swd_project/src/screens/info.dart';

class SettingsWidget extends StatefulWidget {
  final Info gender;
  SettingsWidget({Key key, this.gender}) : super(key: key);

  @override
  _SettingsWidgetState createState() =>
      new _SettingsWidgetState(gender: gender);
}

class _SettingsWidgetState extends State<SettingsWidget> {
  final Info gender;
  List _cities = [
    "Nữ",
    "Nam",
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  _SettingsWidgetState({this.gender});

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
          child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "Giới tính: ",
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          new Container(
            padding: new EdgeInsets.all(16.0),
          ),
          Container(
            child: new DropdownButton(
              iconSize: 40.0,
              dropdownColor: Colors.grey[50],
              value: _currentCity,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem,
            ),
          )
        ],
      )),
    );
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
    Gender.gender = selectedCity;
  }
}

class TargetSettingsWidget extends StatefulWidget {
  final List list;
  final String text;

  TargetSettingsWidget({Key key, this.list, this.text}) : super(key: key);

  @override
  _TargetSettingsWidgetState createState() => new _TargetSettingsWidgetState();
}

class _TargetSettingsWidgetState extends State<TargetSettingsWidget> {
  List _cities = [
    "Giữ cân",
    "Tăng cân",
    "Giảm cân",
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in widget.list) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
          child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text(
            widget.text ?? "",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          new Container(
            padding: new EdgeInsets.all(0.0),
          ),
          Container(
            child: new DropdownButton(
              iconSize: 40.0,
              dropdownColor: Colors.grey[50],
              value: _currentCity,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem,
            ),
          )
        ],
      )),
    );
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
    selectedCity.contains('Giữ cân')
        ? Info.targetName = 0
        : selectedCity.contains('Tăng cân')
            ? Info.targetName = 1
            : Info.targetName = 2;
  }
}
