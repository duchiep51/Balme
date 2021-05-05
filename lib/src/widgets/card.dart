import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swd_project/src/screens/restaurant_detail_screen.dart';
import '../screens/list_store_screen.dart';

class MyCard extends StatelessWidget {
  final String title, detail, url;
  const MyCard({
    Key key,
    this.title,
    this.detail,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        Container(
          // width: double.infinity,
          margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 20,
                color: Color(0xFFB0CCE1).withOpacity(0.64),
              )
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        // color: kPrimaryCol
                        shape: BoxShape.circle),
                    child: Image(
                      image: AssetImage("assets/p4.jpg"),
                      width: size.width * 0.36,
                    ),
                  ),
                  Text("Mèo Seo Phì"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Thần Deal Đại Hiệp",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          // width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 20,
                color: Colors.black.withOpacity(0.2),
              )
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        // color: kPrimaryCol
                        shape: BoxShape.circle),
                    child: Image(
                      image: AssetImage("assets/p4.jpg"),
                      width: size.width * 0.36,
                    ),
                  ),
                  Text("Mèo Seo Phì"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Thần Deal Đại Hiệp",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title, detail, url;
  final Function press;
  const CategoryCard({Key key, this.title, this.detail, this.url, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      // width: double.infinity,
      margin: EdgeInsets.only(left: 10.0, bottom: 20.0),
      padding: EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.lightGreen[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                width: size.width * 0.36,
                height: size.height * 0.18,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(url), fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title ?? "Dash Diet",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StoreCard extends StatelessWidget {
  final String title, detail, url, sub;
  final double rate;
  final Function press;
  const StoreCard(
      {Key key,
      this.title,
      this.detail,
      this.url,
      this.press,
      this.sub,
      this.rate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      // height: size.height * 0.42,
      width: size.width * 0.6,
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      // padding: EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press != null ? press : () {},
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: size.height * 0.26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  image: DecorationImage(
                      image: AssetImage(url), fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  top: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title ?? "FitFood VN",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 10.0),
                    //   child: Text(
                    //     sub ?? "Mentor name",
                    //     overflow: TextOverflow.ellipsis,
                    //     style: TextStyle(color: Colors.orange[900]),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        detail ?? "269 Liên Phường, quận 9",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: SmoothStarRating(
                              allowHalfRating: false,
                              onRated: (v) {},
                              starCount: 5,
                              rating: rate,
                              color: Colors.yellow,
                              borderColor: Colors.yellow,
                              spacing: 0.0),
                        ),
                        Text('$rate')
                      ],
                    ),
                    Container(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                // borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.black12,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 20,
                                    color: Color(0xFFB0CCE1).withOpacity(0.32),
                                  )
                                ],
                              ),
                              child: Text(
                                "Free ship",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                // borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.black12,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 20,
                                    color: Color(0xFFB0CCE1).withOpacity(0.32),
                                  )
                                ],
                              ),
                              child: Text(
                                "Discount 20%",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmentorCard extends StatelessWidget {
  final String title, detail, url, subtitle, secondDetail, promo;
  final double rate;
  final Function press;
  const EmentorCard(
      {Key key,
      this.title,
      this.detail,
      this.url,
      this.press,
      this.rate,
      this.subtitle,
      this.secondDetail,
      this.promo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      // height: size.height * 0.42,
      width: size.width * 0.7,
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      // padding: EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press != null ? press : () {},
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: size.height * 0.26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  image: DecorationImage(
                      image: AssetImage(url), fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  top: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title ?? "title",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      subtitle ?? "subtitle",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            detail ?? "detail",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey[400],
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            " - ",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.orange[900],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            promo ?? "detail",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.orange[900]),
                          ),
                        ),
                        // Text(' - '),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        secondDetail ?? "detail",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.orange[900]),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: SmoothStarRating(
                              allowHalfRating: false,
                              onRated: (v) {},
                              starCount: 5,
                              rating: rate,
                              color: Colors.yellow,
                              borderColor: Colors.yellow,
                              spacing: 0.0),
                        ),
                        Text('$rate'),
                      ],
                    ),
                    Container(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                // borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.black12,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 20,
                                    color: Color(0xFFB0CCE1).withOpacity(0.32),
                                  )
                                ],
                              ),
                              child: Text(
                                "Best choice",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                // borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.black12,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 20,
                                    color: Color(0xFFB0CCE1).withOpacity(0.32),
                                  )
                                ],
                              ),
                              child: Text(
                                "Discount 20%",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MatchingCard extends StatelessWidget {
  final String title, description, url, price, kcal;
  final Function press;
  const MatchingCard(
      {Key key,
      this.title,
      this.description,
      this.url,
      this.press,
      this.price,
      this.kcal})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.37,
      width: double.infinity,
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.lightGreen[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press ?? () {},
          child: Column(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.all(10),
                width: double.infinity,
                height: size.height * 0.26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  image: DecorationImage(
                      image: AssetImage(url), fit: BoxFit.cover),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Container(
                            child: Text(
                              kcal,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.lightGreen[900]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Container(
                            width: 200.0,
                            child: Text(
                              description,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.orange[900]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                            child: Text(
                              price,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.orange[900],
                              ),
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryDetailCard extends StatelessWidget {
  final String title, description, url, price, kcal;
  final Function press;
  const CategoryDetailCard(
      {Key key,
      this.title,
      this.description,
      this.url,
      this.press,
      this.price,
      this.kcal})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.37,
      width: double.infinity,
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.lightGreen[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press ?? () {},
          child: Column(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.all(10),
                width: double.infinity,
                height: size.height * 0.26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  image: DecorationImage(
                      image: AssetImage(url), fit: BoxFit.cover),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Container(
                        child: Text(
                          kcal,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.lightGreen[900]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Container(
                        width: 200.0,
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14.0, color: Colors.brown[400]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Container(
                        child: Text(
                          price,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.orange[900],
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(),
                        MaterialButton(
                          height: 50,
                          minWidth: 100.0,
                          color: Colors.green[800],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListStoreScreen()),
                            );
                          },
                          child: Text(
                            'Đặt ngay',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20.0, top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Deal hot mỗi tuần",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange[900],
                fontSize: 20.0),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              hoverColor: Colors.transparent,
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestaurantDetail(
                      address: '17 võ văn tần, 10',
                      distance: '15km',
                      img: 'assets/fitfoodvn.png',
                      rate: 4.5,
                      name: 'FitFood VN',
                    ),
                  ),
                ),
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 166,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/fitfood1.jpg"),
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFF961F).withOpacity(0.7),
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: Image(
                              image: AssetImage("assets/logo-fitfood.png")),
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.white),
                              children: [
                                TextSpan(
                                  text: "Get Discount of \n",
                                  style: TextStyle(fontSize: 16),
                                ),
                                TextSpan(
                                  text: "30% \n",
                                  style: TextStyle(
                                    fontSize: 43,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "at FitFoodVN on your first order & Instant cashback",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
