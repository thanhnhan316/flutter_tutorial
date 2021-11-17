import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/learn_flutter/web.dart';

class Web extends StatelessWidget {
  var content;
  var tittle;
  Web({required this.content, required this.tittle, Key? key})
      : super(key: key);

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
          title: Text(tittle, style: TextStyle(fontSize: 22)),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                
                Text(tittle,
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                Text(content, style: TextStyle(fontSize: 19)),
              ],
            )));
  }
}
