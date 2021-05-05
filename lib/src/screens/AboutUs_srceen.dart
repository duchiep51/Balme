import 'package:flutter/material.dart';
import 'package:swd_project/src/widgets/appbar.dart';

class AboutUsWidget extends StatelessWidget {
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
                    text: "Về Balme", style: TextStyle(color: Colors.black)),
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                  "Balme là sàn giao dịch thương mại điện tử, chuyên cấp dịch vụ đặt các phần ăn dinh dưỡng - giao hàng tận nơi. Giao diện tiện lợi, dễ sử dụng trên điện thoại di động với các tính năng hữu ích như hẹn giờ giao hàng theo ngày/tuần/giờ. Balme đều có thể đáp ứng các nhu cầu về các bữa ăn dinh dưỡng cho từng thể trạng của mỗi người dựa trên chỉ số BMI một cách nhanh chóng và chính xác.",
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text("Bạn hoàn toàn có thể đặt hàng tại App Baleme.",
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text("Xin chân thành cảm ơn.", style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Image.network(
                "https://www.go-viet.vn/wp-content/uploads/2018/11/20150827110756-dadangky.png",
                fit: BoxFit.contain,
                width: 300,
              ),
              Container(
                height: 140,
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
      ),
    );
  }
}

Widget listWidget(String name, BuildContext context) {
  return GestureDetector(
    child: Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: 50,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
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
