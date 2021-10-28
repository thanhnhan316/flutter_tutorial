import 'package:flutter/material.dart';
import 'package:hello_world/learn_flutter/callfakeapi.dart';
import 'package:hello_world/learn_flutter/carousel_slider.dart';

import 'package:hello_world/learn_flutter/form_basic.dart';
import 'package:hello_world/learn_flutter/listview_basic.dart';
import 'package:hello_world/learn_flutter/shoppe.dart';
import 'package:hello_world/my_flutter/call_api_login.dart';
import 'package:hello_world/learn_flutter/myapp2.dart';

void main() {
  runApp(MaterialApp(home: CarouselScreen()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(backgroundColor: Colors.blue, body: buildBody(size));
  }

  Widget buildBody(Size size) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.all(15),
            height: size.height * 0.25,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Text("Hello World",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25)),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: size.height * 0.1,
            width: size.width,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                itemMenu(Icons.call, "Call", Colors.red),
                itemMenu(Icons.place, "Routes", Colors.yellow),
                itemMenu(Icons.share, "Share", Colors.green),
                itemMenu(Icons.access_alarm, "Clock", Colors.pink)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget itemMenu(IconData iconData, String name, Color color) {
    return Column(
      children: [
        Icon(iconData),
        Text(name, style: TextStyle(color: color, fontSize: 17))
      ],
    );
  }
}
