import 'package:flutter/material.dart';
import 'package:hello_world/learn_flutter/BMI/bmi.dart';
import 'package:hello_world/learn_flutter/BMI/container_box.dart';

class ResultsPage extends StatelessWidget {
  Size size;
  String result;
  String bmi;
  String resultDetail;
  ResultsPage(
      {required this.bmi,
      required this.result,
      required this.resultDetail,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1D2333),
        body: SafeArea(
          child: Center(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text("Your result",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: size.height * 0.05,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Expanded(
                      child: ContainerBox(
                    color: Color(0xff4D5468),
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(result,
                            style: TextStyle(
                                fontSize: size.height * 0.04,
                                color: Colors.green,
                                fontWeight: FontWeight.bold)),
                        Text(bmi,
                            style: TextStyle(
                                fontSize: size.height * 0.07,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text(resultDetail,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: size.height * 0.03,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BmiScreen()));
                      },
                      child: ContainerBox(
                        color: Colors.pink,
                        childWidget: Container(
                            height: size.height * 0.1,
                            width: double.infinity,
                            child: Center(
                              child: Text("RE_CALCULATE",
                                  style: TextStyle(
                                      fontSize: size.height * 0.04,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )),
                      ))
                ],
              ),
              margin: EdgeInsets.all(15),
            ),
          ),
        ));
  }
}
