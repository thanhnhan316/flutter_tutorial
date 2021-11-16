import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/learn_flutter/web.dart';

class Web extends StatelessWidget {
  var content;
  Web({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => WebScreen()));
              },
              icon: Icon(Icons.keyboard_backspace_outlined, size: 30)),
          title: Text("Content", style: TextStyle(fontSize: 22)),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Text(content, style: TextStyle(fontSize: 19))));
  }
}
