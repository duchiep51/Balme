import 'package:flutter/material.dart';
import 'package:swd_project/src/widgets/appbar.dart';

class AddressWidget extends StatelessWidget {
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
                    text: "Địa chỉ", style: TextStyle(color: Colors.black)),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 10,
            ),
            listWidget(Icons.add, "Thêm địa chỉ mới", context),
            Container(
              height: 10,
            ),
            listWidget(Icons.home, "Thêm địa chỉ nhà", context),
            Container(
              height: 10,
            ),
            listWidget(Icons.work, "Thêm địa chỉ Công ty", context),
            Container(
              height: 10,
            ),
            listAddressWidget(
                Icons.flag,
                "149/4 lê quang định",
                "149/4 lê quang định,phường 14,quận bình thạnh,Hồ Chí Minh,Việt Nam",
                "Dinhhoanggianh",
                "0932065969",
                context),
            Container(
              height: 160,
            ),
            Center(
                child: Text(
              "Version 1.0.1",
              style: TextStyle(color: Colors.grey),
            )),
            Center(
                child: Text(
              "Spring mike Corporation",
              style: TextStyle(color: Colors.grey),
            )),
            Container(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

Widget listWidget(IconData icon, String name, BuildContext context) {
  return GestureDetector(
    child: Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
              child: Icon(icon),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ),
            Spacer(flex: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
              child: Icon(Icons.chevron_right),
            )
          ],
        ),
      ),
    ),
  );
}

Widget listAddressWidget(IconData icon, String name, String addresss,
    String username, String phone, BuildContext context) {
  return GestureDetector(
    child: Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
          color: Colors.white,
          width: double.infinity,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                    child: Icon(icon),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 8, 8, 8),
                    child: Text(
                      name,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                  ),
                  Spacer(flex: 5),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                    child: Icon(Icons.chevron_right),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 8, 8, 8),
                child: Text(addresss,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[500])),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 8, 8, 8),
                child: Row(
                  children: [
                    Text(username,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(phone,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400)),
                    )
                  ],
                ),
              )
            ],
          )),
    ),
  );
}
