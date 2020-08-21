import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:pongdang/fnc/hanAPI.dart';
import 'package:pongdang/page/mainWidgets.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState()=> HomeState();
}

class HomeState extends State<Home> {
  HanAPI hanAPI = HanAPI();
  Pong pong = Pong();

  @override
  void initState() {
    super.initState();
    hanAPI.fetchData().then((data){
      setState(() {
        pong = data;
        print(pong.time);
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
            child: Container(
              color: Colors.black.withOpacity(0.3),
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