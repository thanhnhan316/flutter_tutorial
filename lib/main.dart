import 'package:flutter/material.dart';
import 'package:hello_world/learn_flutter/Qr_screen.dart';
import 'package:hello_world/learn_flutter/BMI/bmi.dart';
import 'package:hello_world/learn_flutter/call_api/callfakeapi.dart';
import 'package:hello_world/learn_flutter/carousel/carousel_slider.dart';

import 'package:hello_world/learn_flutter/form_basic.dart';
import 'package:hello_world/learn_flutter/carousel/listview_basic.dart';
import 'package:hello_world/learn_flutter/learnprovider/multiprovider/firstprovider.dart';
import 'package:hello_world/learn_flutter/learnprovider/providerscreen.dart';
import 'package:hello_world/learn_flutter/profile/pageview.dart';
import 'package:hello_world/learn_flutter/carousel/shoppe.dart';
import 'package:hello_world/learn_flutter/tictac/hime_page.dart';
import 'package:hello_world/learn_flutter/tictac/tictac.dart';
import 'package:hello_world/learn_flutter/news/web.dart';
import 'package:hello_world/learn_flutter/myapp2.dart';

void main() {
  runApp(MaterialApp(
      theme: new ThemeData(primaryColor: Colors.black), home: Provider()));
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
