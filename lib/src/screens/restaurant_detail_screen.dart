import 'package:flutter/material.dart';
import 'package:swd_project/src/widgets/line.dart';
import '../screens/combo_detail.dart';
import '../widgets/card.dart';
import '../widgets/menu_components/tab_menu.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../widgets/home_components/slideshow.dart';
import './list_combo_screen.dart';
import 'info.dart';

class RestaurantDetail extends StatefulWidget {
  final String name;
  final String address;
  final double rate;
  final String img;
  final String distance;
  final bool showBottomSheet;
  final bool routeToComboDetail;
  bool showSnackBar = false;

  RestaurantDetail({
    Key key,
    this.name,
    this.address,
    this.rate,
    this.img,
    this.distance,
    this.showBottomSheet = false,
    this.routeToComboDetail = false,
  }) : super(key: key);

  // bool get getSnackBar => showSnackBar;

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    if (widget.showBottomSheet) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _orderBottomSheet(context);
      });
    }

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (widget.routeToComboDetail) {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => ComboDetail()),
    //     );
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: Builder(
        builder: (context) => Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      leading: IconButton(
                        onPressed: () => Navigator.pop(context, true),
                        icon: Icon(Icons.arrow_back),
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.red,
                      expandedHeight: 200,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Hero(
                          tag: 'dash',
                          child: Image(
                            image: AssetImage(widget.img),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, left: 20.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.check_circle,
                                                color: Colors.lightBlue[300],
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                'Quán ưa thích',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colors.lightBlue[300]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            widget.name,
                                            style: TextStyle(
                                                fontSize: 26,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 20.0),
                                    child: Container(
                                      child: Text('Địa chỉ: ' +
                                          widget.address +
                                          ' - ${widget.distance}'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Container(
                                      width: double.infinity,
                                      // decoration: BoxDecoration(
                                      //     border: Border.all(width: 0.5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              SmoothStarRating(
                                                  allowHalfRating: true,
                                                  onRated: (v) {},
                                                  starCount: 5,
                                                  rating: widget.rate,
                                                  color: Colors.yellow,
                                                  borderColor: Colors.yellow,
                                                  spacing: 0.0),
                                              Text("4.3")
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Line(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 10.0, bottom: 10.0),
                                    child: Text(
                                      'Chọn gói ăn',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.orange[900]),
                                    ),
                                  ),
                                  ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: Combo.titles.length,
                                      itemBuilder: (context, index) {
                                        return buildSharingCard(
                                            size,
                                            Combo.imgCombos[index],
                                            Combo.titles[index],
                                            Combo.calories[index],
                                            Combo.prices[index],
                                            () => {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ComboDetail(
                                                              category: Combo
                                                                      .categories[
                                                                  index],
                                                              calo: Combo
                                                                      .calories[
                                                                  index],
                                                              name:
                                                                  Combo.titles[
                                                                      index],
                                                            )),
                                                  ),
                                                },
                                            Combo.categories[index]);
                                      }),
                                  buildSharingCard(
                                      size,
                                      "assets/fit1.jpg",
                                      'Gói Fit 1',
                                      '2300 calories/ngày',
                                      "600.000/tuần",
                                      () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ComboDetail(
                                                        category: 'Dash Diet',
                                                        calo:
                                                            '2300 calories/ngày',
                                                        name: 'Gói Fit 1',
                                                      )),
                                            ),
                                          },
                                      'Dash Diet'),
                                  buildSharingCard(
                                      size,
                                      "assets/fit2.jpg",
                                      'Gói Fit 2',
                                      '1900 calories/ngày',
                                      "800.000/tuần",
                                      () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ComboDetail(
                                                        category: 'Low Carb',
                                                        calo:
                                                            '1900 calories/ngày',
                                                        name: 'Gói Fit 2',
                                                      )),
                                            ),
                                          },
                                      'Low Carb'),
                                  buildSharingCard(
                                      size,
                                      "assets/fit3.jpg",
                                      'Gói Fit 3',
                                      '2200 calories/ngày',
                                      "900.000/tuần",
                                      () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ComboDetail(
                                                        category: 'Eat Clean',
                                                        calo:
                                                            '2200 calories/ngày',
                                                        name: 'Gói Fit 3',
                                                      )),
                                            ),
                                          },
                                      'Eat Clean'),
                                  buildSharingCard(
                                      size,
                                      "assets/food-set.png",
                                      'Gói Fit Full',
                                      '2300 calories/ngày',
                                      "8500.000/tuần",
                                      () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ComboDetail(
                                                        category: 'Paleo',
                                                        calo:
                                                            '2300 calories/ngày',
                                                        name: 'Gói Fit Full',
                                                      )),
                                            ),
                                          },
                                      'Paleo'),
                                ],
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

  Widget buildSharingCard(size, url, title, subtitle, price, press, detail) {
    return InkWell(
      onTap: press ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          height: size.height * 0.14,
          child: Center(
            child: Row(
              children: <Widget>[
                Container(
                  height: 0.12 * size.height,
                  width: 0.12 * size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(url), fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    top: 5.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title ?? 'title',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        detail ?? 'detail',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0.0),
                        child: Text(
                          // address[index],
                          price ?? 'price',
                          style: TextStyle(color: Colors.orange[900]),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            subtitle ?? 'subtitle',
                            style: TextStyle(color: Colors.lightGreen[900]),
                          ),
                          Text('', style: TextStyle(color: Colors.orange[900])),
                          Text(
                            '',
                            style: TextStyle(color: Colors.lightGreen[900]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _orderBottomSheet(context) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
        enableDrag: false,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: size.height * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 2.0, color: Colors.grey[200]))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 60.0,
                      ),
                      Text(
                        'Dash Diet',
                        style: TextStyle(
                          color: Colors.orange[900],
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.5,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2.0, color: Colors.grey[200]),
                    ),
                  ),
                  child: ComboCarouselDemo(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: MaterialButton(
                    height: 50,
                    minWidth: 200.0,
                    color: Colors.lightGreen[300],
                    onPressed: () {
                      print(widget.showSnackBar);
                      // Scaffold.of(context).showSnackBar(snackBar());
                      if (widget.showSnackBar == false) {
                        Navigator.of(context).pop();
                        _scaffoldKey.currentState
                            .showSnackBar(snackBar('Gói Fit 3'));
                        widget.showSnackBar = true;
                      } else {
                        _showMyDialog(context);
                        widget.showSnackBar = false;
                      }
                    },
                    child: Text(
                      'Thêm gói vào giỏ hàng',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget snackBar(title) {
    return SnackBar(
      duration: Duration(hours: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.lightGreen[300],
      content: Container(
        height: 50.0,
        child: Row(
          children: <Widget>[
            Container(
              // child: Icon(
              //   Icons.fastfood,
              //   size: 40.0,
              // ),
              child: Text('Xem giỏ hàng'),
            ),
            SizedBox(
              width: 30.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.0),
              child: Column(
                children: <Widget>[
                  Container(
                    // height: 30.0,
                    child: Text(
                      title ?? 'Gói Fit 3',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[900],
                      ),
                    ),
                  ),
                  Container(
                    // height: 30.0,
                    child: Text(
                      '750,000 đ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[900],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      action: SnackBarAction(
        label: 'Hủy',
        textColor: Colors.orange[900],
        onPressed: () {
          widget.showSnackBar = false;
        },
      ),
    );
  }

  Future<void> _showMyDialog(context) async {
    String detail = 'Giỏ hàng đã có gói Fit 1 \n Bạn có muốn thay gói ';
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Chi tiết'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(detail),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Đồng ý'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Thoát'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final RestaurantDetail widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CategoryCard(
              title: 'Dash Diet',
              url: "assets/Dash-Diet.jpg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListComboScreen(
                            storeName: widget.name,
                            categoryName: 'Dash Diet',
                            imgUrl: 'assets/Dash-Diet.jpg',
                          )),
                );
              },
            ),
            CategoryCard(
              title: 'Eat Clean',
              url: "assets/eat-clean.jpg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListComboScreen(
                            storeName: widget.name,
                            categoryName: 'Eat Clean',
                            imgUrl: 'assets/eat-clean.jpg',
                          )),
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CategoryCard(
              title: 'Paleo',
              url: "assets/paleo.jpg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListComboScreen(
                            storeName: widget.name,
                            categoryName: 'Dash Diet',
                            imgUrl: 'assets/paleo.jpg',
                          )),
                );
              },
            ),
            CategoryCard(
              title: 'Low Carb',
              url: "assets/low-carb.jpg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListComboScreen(
                            storeName: widget.name,
                            categoryName: 'Low Carb',
                            imgUrl: 'assets/low-carb.jpg',
                          )),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
