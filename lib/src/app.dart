import 'package:flutter/material.dart';
import 'package:swd_project/src/screens/booking.dart';
import 'package:swd_project/src/screens/thanhtoan.dart';
import './screens/combo_detail.dart';
import './screens/confirm_screen.dart';
import './screens/input_age_screen.dart';
import './screens/list_combo_screen.dart';
import './screens/list_store_screen.dart';
// import './widgets/bottom_nav_screen.dart';
// import './widgets/login.dart';
// import './blocs/login_bloc.dart';
import './screens/input_name_screen.dart';
import './screens/welcome_srceen.dart';
import './screens/input_height_screen.dart';
import './screens/input_width_screen.dart';
import './widgets/bottom_nav_screen.dart';
import './screens/input_gender_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeSrceen(),
        '/InputName': (context) => InputNameInfo(),
        '/InputHeight': (context) => InputHeightInfo(),
        '/InputWeight': (context) => InputWidthInfo(),
        '/InputAge': (context) => InputAgeInfo(),
        '/InputGender': (context) => InputGender(),
        '/Home': (context) => BottomNavBar(),
        '/Confirm': (context) => ConfirmScreen(),
        '/ComboDetail': (context) => ComboDetail(),
        '/Combos': (context) => ListComboScreen(),
        '/RestaurantList': (context) => ListStoreScreen(),
        '/Payment': (context) => Payment(),
      },
    );
  }
}
