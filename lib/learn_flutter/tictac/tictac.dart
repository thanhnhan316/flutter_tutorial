import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/learn_flutter/BMI/container_box.dart';
import 'package:hello_world/learn_flutter/tictac/hime_page.dart';
import 'package:hello_world/learn_flutter/tictac/play_2peple.dart';



class TicTac extends StatefulWidget {
  const TicTac({Key? key}) : super(key: key);

  @override
  _TicTac1State createState() => _TicTac1State();
}

class _TicTac1State extends State<TicTac> {
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return  MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Lựa Chọn kiểu chơi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>TicTacScreen()));
            },
            child: ContainerBox(
              color: Colors.pink,
              childWidget: Container(
                  height:70 ,
                  width: double.infinity,
                  child: Center(
                    child: Text("Chơi Với Máy",
                        style: TextStyle(
                            fontSize: size.height * 0.04,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  )),
            )),
             GestureDetector(
            onTap: () {

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>TicTacPepleScreen()));
            },
            child: ContainerBox(
              color: Colors.pink,
              childWidget: Container(
                  height: 70,
                  width: double.infinity,
                  child: Center(
                    child: Text("2 Người chơi",
                        style: TextStyle(
                            fontSize: size.height * 0.04,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  )),
            )),
          ],
        ),
      ),
    )
    );
    
     
  }
}
