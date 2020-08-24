import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:pongdang/fnc/hanAPI.dart';
import 'package:pongdang/page/mainWidgets.dart';
import 'package:pongdang/page/backgroundWidgets.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState()=> HomeState();
}

class HomeState extends State<Home> {
  HanAPI hanAPI = HanAPI();
  Pong pong = Pong();

  //UI
  List<Color> colorList = [
    Colors.red.withOpacity(0.3),
    Colors.blue.withOpacity(0.3),
    Colors.green.withOpacity(0.3),
    Colors.yellow.withOpacity(0.3),
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.indigo.withOpacity(0.3);
  Color topColor = Colors.purple.withOpacity(0.3);
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  void initState() {
    super.initState();
    hanAPI.fetchData().then((data){
      setState(() {
        pong = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
          "assets/background.png",
          height: screenSize.height,
          fit: BoxFit.fitHeight,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1),
              onEnd: () {
                setState(() {
                  index = index + 1;
                  bottomColor = colorList[index % colorList.length];
                  topColor = colorList[(index + 1) % colorList.length];

                  begin = alignmentList[index % alignmentList.length];
                  end = alignmentList[(index + 2) % alignmentList.length];
                });
              },
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: begin, end: end, colors: [bottomColor, topColor])
              ),
            ),
          ),
          MainWidgets().mainWidgets(context, screenSize, pong, () {
            // 온도 눌렀을때 기능
            print("퐁당");
          }),
        ],
      ),
    );
  }
}