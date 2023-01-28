// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'container_box.dart';
import 'data_container.dart';

const activeColor = Color(0xFF0073dd);
const inActiveColor = Color(0xFF212121);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  int height = 180;
  int weight = 70;
  int age = 25;
  String result = "";
  String resultDetail = "result here";
  double bmi = 0;

  void updateBoxColor(int gender) {
    if (gender == 1) {
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

  String calcuteBmi(int weight, int height) {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getInterpretation(double bmi) {
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("BMI Calculator")),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateBoxColor(1);
                        });
                      },
                      child: ContainerBox(
                        boxColor: maleBoxColor,
                        childWidget: DataContainer(
                          icon: FontAwesomeIcons.mars,
                          title: "Male",
                        ),
                      )),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateBoxColor(2);
                        });
                      },
                      child: ContainerBox(
                          boxColor: femaleBoxColor,
                          childWidget: DataContainer(
                              icon: FontAwesomeIcons.venus, title: "Female"))),
                ),
              ],
            )),
            Expanded(
                child: ContainerBox(
              boxColor: inActiveColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: DataContainer.textStyle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: DataContainer.textStyle2,
                      ),
                      Text(
                        'cm',
                        style: DataContainer.textStyle1,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: activeColor,
                    inactiveColor: inActiveColor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            )),
            Expanded(
                child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Expanded(
                  child: ContainerBox(
                      boxColor: inActiveColor,
                      childWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'WEIGHT',
                            style: DataContainer.textStyle1,
                          ),
                          Text(
                            weight.toString(),
                            style: DataContainer.textStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                backgroundColor: activeColor,
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 0) {
                                      weight--;
                                    }
                                  });
                                },
                                backgroundColor: activeColor,
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: ContainerBox(
                      boxColor: inActiveColor,
                      childWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Age',
                            style: DataContainer.textStyle1,
                          ),
                          Text(
                            age.toString(),
                            style: DataContainer.textStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                backgroundColor: activeColor,
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (age > 0) {
                                      age--;
                                    }
                                  });
                                },
                                backgroundColor: activeColor,
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            )),
            GestureDetector(
              onTap: () {
                setState(() {
                  result = calcuteBmi(weight, height);
                  resultDetail = getInterpretation(bmi);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: inActiveColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            color: inActiveColor,
                            height: 200,
                            margin: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Text(
                                  'Result',
                                  style: DataContainer.textStyle1,
                                ),
                                Text(
                                  result,
                                  style: DataContainer.textStyle2,
                                ),
                                Text(
                                  resultDetail,
                                  style: DataContainer.textStyle1,
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                });
              },
              child: Container(
                // ignore: sort_child_properties_last
                child: Center(
                  child: Text(
                    'Calculate',
                    style: DataContainer.textStyle3,
                  ),
                ),
                width: double.infinity,
                height: 80.0,
                color: activeColor,
                margin: EdgeInsets.only(top: 10.0),
              ),
            ),
          ],
        ));
  }
}
