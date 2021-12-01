import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hello_world/learn_flutter/BMI/container_box.dart';
import 'package:hello_world/learn_flutter/BMI/data_container.dart';
import 'package:hello_world/learn_flutter/BMI/resurtspage.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMI(),
    );
  }
}

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  _BMIState createState() => _BMIState();
}

const activeColor = Color(0xff4D5468); //màu khi click
const inActiveColor = Color(0xff91A5DE); //không click

class _BMIState extends State<BMI> {
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  var height = 190;
  var weight = 50;
  var age = 20;
  double bmi = 0;
  String result = "";
  String getresult = "";
  String resultDetail = "result here";

  String getResult(double bmi) {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation(double bmi) {
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  String caculateBmi() {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  double Bmi() {
    return weight / pow(height / 100, 2);
  }

  void updateColor(int i) {
    if (i == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;
      } else {
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color(0xff1D2333),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: genderBuild()),
              Expanded(child: heightBuild()),
              Expanded(child: weightAgeBuild()),
              calculate()
            ],
          ),
        ));
  }

  Widget genderBuild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child: GestureDetector(
          onTap: () {
            setState(() {
              updateColor(1);
            });
          },
          child: ContainerBox(
              color: maleBoxColor,
              childWidget:
                  DataContainer(title: "MALE", icon: Icons.male, size: size)),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () {
            setState(() {
              updateColor(2);
            });
          },
          child: ContainerBox(
              color: femaleBoxColor,
              childWidget: DataContainer(
                  title: "FEMALE", icon: Icons.female, size: size)),
        ))
      ],
    );
  }

  Widget heightBuild() {
    return ContainerBox(
        color: activeColor,
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("HEIGHT",
                style: TextStyle(
                    fontSize: size.height * 0.03,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(height.toString(),
                    style: TextStyle(
                        fontSize: size.height * 0.05,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Text("cm",
                    style: TextStyle(
                        fontSize: size.height * 0.015,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Slider(
                value: height.toDouble(),
                min: 130,
                max: 210,
                activeColor: Colors.pink,
                onChanged: (double value) {
                  setState(() {
                    height = value.round();
                  });
                })
          ],
        ));
  }

  Widget weightAgeBuild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child: ContainerBox(
                color: activeColor,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("WEIGHT",
                        style: TextStyle(
                            fontSize: size.height * 0.03,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold)),
                    Text(weight.toString(),
                        style: TextStyle(
                            fontSize: size.height * 0.05,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 0) weight--;
                              });
                            },
                            backgroundColor: inActiveColor,
                            child: Icon(Icons.minimize_outlined,
                                size: size.height * 0.05)),
                        FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            backgroundColor: inActiveColor,
                            child: Icon(Icons.add, size: size.height * 0.05))
                      ],
                    )
                  ],
                ))),
        Expanded(
            child: ContainerBox(
                color: activeColor,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("AGE",
                        style: TextStyle(
                            fontSize: size.height * 0.03,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold)),
                    Text(age.toString(),
                        style: TextStyle(
                            fontSize: size.height * 0.05,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (age > 0) age--;
                              });
                            },
                            backgroundColor: inActiveColor,
                            child: Icon(Icons.minimize_outlined,
                                size: size.height * 0.05)),
                        FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            backgroundColor: inActiveColor,
                            child: Icon(Icons.add, size: size.height * 0.05))
                      ],
                    )
                  ],
                )))
      ],
    );
  }

  Widget calculate() {
    return GestureDetector(
        onTap: () {
          bmi = Bmi();
          result = getResult(bmi);
          getresult = caculateBmi();
          resultDetail = getInterpretation(bmi);
          print(bmi);
          print(result);
          print(getresult);
          print(resultDetail);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultsPage(
                      bmi: getresult,
                      result: result,
                      resultDetail: resultDetail,
                      size: size)));
        },
        child: ContainerBox(
          color: Colors.pink,
          childWidget: Container(
              height: size.height * 0.1,
              width: double.infinity,
              child: Center(
                child: Text("CALCULATE",
                    style: TextStyle(
                        fontSize: size.height * 0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              )),
        ));
  }
}
