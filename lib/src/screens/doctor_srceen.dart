import 'package:flutter/material.dart';
import 'package:swd_project/src/widgets/appbar.dart';

class DoctorWidger extends StatelessWidget {
  final List<String> orderCategory = ['Dash Diet', 'Low Carb', 'Vegan'];

  List<String> discount = ["15%", "5%", "20% ~ 30%", "20%", "20%", "20%"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: HomeAppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context, true),
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Chuyên gia", style: TextStyle(color: Colors.black)),
              ],
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            width: 450,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Column(
                children: [
                  notificationCard(
                    "https://cdn.sanity.io/images/0vv8moc6/hcplive/0ebb6a8f0c2850697532805d09d4ff10e838a74b-200x200.jpg?auto=format",
                    "bao tử - tim mạch",
                    "Trần Minh Tấn",
                  ),
                  notificationCard(
                    "https://images.squarespace-cdn.com/content/v1/5e48315833aa1603122ab308/1581789692494-5ZH1124NM64BAVF6UEEI/ke17ZwdGBToddI8pDm48kLkXF2pIyv_F2eUT9F60jBl7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0iyqMbMesKd95J-X4EagrgU9L3Sa3U8cogeb0tjXbfawd0urKshkc5MgdBeJmALQKw/shutterstock_314454719.jpg?format=2500w",
                    "bao tử - tim mạch",
                    "Đỗ Ngọc Phúc",
                  ),
                  notificationCard(
                    "https://img.freepik.com/free-photo/front-view-doctor-with-medical-mask-posing-with-crossed-arms_23-2148445082.jpg?size=626&ext=jpg",
                    "bao tử - tim mạch",
                    "Trần Ngọc Trân",
                  ),
                  notificationCard(
                    "https://images.theconversation.com/files/304957/original/file-20191203-66986-im7o5.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=926&fit=clip",
                    "bao tử - tim mạch",
                    "Độ Công Minh",
                  ),
                  notificationCard(
                    "https://images.squarespace-cdn.com/content/v1/5e48315833aa1603122ab308/1581789692494-5ZH1124NM64BAVF6UEEI/ke17ZwdGBToddI8pDm48kLkXF2pIyv_F2eUT9F60jBl7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0iyqMbMesKd95J-X4EagrgU9L3Sa3U8cogeb0tjXbfawd0urKshkc5MgdBeJmALQKw/shutterstock_314454719.jpg?format=2500w",
                    "bao tử - tim mạch",
                    "Lưu Công Hòa",
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

Widget notificationCard(String img, String name, String des) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(13, 10, 13, 0.1),
    child: Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    img,
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    des,
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
                  SizedBox(height: 6),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(26, 0, 0, 0),
            child: SizedBox(
              width: 100,
              height: 50,
              child: RaisedButton(
                  color: Colors.lightGreen[200],
                  onPressed: () {},
                  child: const Text('Chat', style: TextStyle(fontSize: 20))),
            ),
          ),
        ],
      ),
    ),
  );
}
