import 'package:flutter/material.dart';
import 'package:swd_project/src/screens/orders_screen.dart';
import '../widgets/appbar.dart';
import '../widgets/home_components/home_content.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: HomeAppBar(
          leading: IconButton(
              icon: Icon(Icons.location_on),
              color: Colors.lightGreen[300],
              onPressed: () => {}),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Balme",
                    style: TextStyle(color: Colors.lightGreen[900])),
              ],
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          action: <Widget>[
            IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.lightGreen[900],
              ),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderScreen(),
                  ),
                )
              },
            ),
          ],
        ),
      ),
      body: HomeContent(),
    );
  }
}
