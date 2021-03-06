import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

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
        children: <Widget> [
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
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter, end: Alignment.bottomCenter,
                      colors: [Colors.indigo.withOpacity(0.5), Colors.purple.withOpacity(0.5)])
              ),
            ),
          ),
          MainWidgets().mainWidgets(context, screenSize, pong, () async {
            await launch("http://www.spckorea.or.kr/");
          }),
        ],
      ),
    );
  }
}