import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<String> img = [
    'assets/restaurant1.jpg',
    'assets/restaurant2.jpg',
    'assets/restaurant3.jpg',
    'assets/restaurant3.jpg',
  ];
  final List<String> name = [
    " Nhà hàng Hải sản Rivia",
    " Quán ăn đường phố Wall",
    " Nhà hàng ka lộ lộ",
    " Quán ăn phát biết liền",
    " Nhà hàng đệ nhất gấu đỏ",
    " Nhà hàng Hảo Hảo"
  ];

  final List<String> add = [
    " 18 nguyễn cư trinh,p.bình thợ",
    " 195 nguyễn chi phương,p.tân hiệp",
    " 652 Lê Đức Hiệp,p.Duck Kip,Quận 1",
    " 12 Lê Thánh Tôn ,p.tân bình ,Quận 3",
    " 84 Trần Công Đoàn,p.bến tre, Quận Gò...",
    " 111 Lê Quang Định,p.20, Quận BT"
  ];
  final List<String> cate = [
    " low-carb/Dukan/ Atkins/HCG/Vegan",
    " Atkins/HCG/Vegan",
    " low-carb/Dukan",
    " /HCG/Vegan/low-carb",
    " Dukan/ Atkins/HCG",
    " low-carb/Dukan/ Atkins"
  ];

  final List<String> orderImg = ['assets/fit1.jpg', 'assets/ship.jpg'];

  final List<String> title = [
    'Đơn hàng sắp tới',
  ];

  final List<String> time = [
    "6h sáng",
    "6h sáng",
    "6h sáng",
    "6h sáng",
  ];

  final List<String> orderCategory = ['Dash Diet', 'Low Carb', 'Vegan'];

  List<String> discount = ["15%", "5%", "20% ~ 30%", "20%", "20%", "20%"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context, true),
            icon: Icon(Icons.arrow_back),
            color: Colors.lightGreen[300],
          ),
          backgroundColor: Colors.lightGreen[300],
          centerTitle: true,
          title: Text(
            "Thông Báo",
            style: TextStyle(fontSize: 20),
          ),
          bottom: TabBar(
            labelColor: Colors.orange[900],
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white),
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Đơn hàng",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Khuyến mãi",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              width: 450,
              height: 600,
              child: ListView.builder(
                itemCount: time.length,
                itemBuilder: (context, index) {
                  return notificationCard(
                    img: orderImg[1],
                    name: title[0],
                    des: 'Địa chỉ giao' + add[index],
                    cate: orderCategory[0],
                    dis: 'Thời gian giao: ' + time[index],
                  );
                },
              ),
            ),
            Container(
              width: 450,
              height: 600,
              child: ListView.builder(
                itemCount: img.length,
                itemBuilder: (context, index) {
                  return notificationCard(
                      img: img[index],
                      name: name[index],
                      des: 'Địa chỉ: ' + add[index],
                      cate: cate[index],
                      dis: "Discount: " + discount[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget notificationCard(
    {String img, String name, String des, String cate, String dis}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(13, 10, 13, 0.1),
    child: Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                height: 100,
                width: 100,
                child: Image(
                  image: AssetImage(img),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.lightGreen[900]),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(name ?? '',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14.0)),
                  SizedBox(height: 8),
                  Container(
                    width: 200.0,
                    child: Text(
                      des ?? '',
                      style: TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: <Widget>[
                      Text(dis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange[900]))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
