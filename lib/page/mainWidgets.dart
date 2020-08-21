import 'package:flutter/material.dart';
import 'package:pongdang/fnc/hanAPI.dart';
import 'package:pongdang/fnc/dateTimeParser.dart';

class MainWidgets {
  Widget mainWidgets(BuildContext context, Size screenSize, Pong pong) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Text(
            "퐁당",
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: screenSize.width / 1.5,
          child: Divider(thickness: 2,color: Colors.white38,),
        ),
        Container(
          child: Text(
            "${pong.temp != null ? pong.temp+"°C" : "불러오는 중"}",
            style: TextStyle(
              fontSize: 64,
              color: Colors.white
            ),
          ),
        ),
        Container(
          width: screenSize.width / 1.5,
          child: Divider(thickness: 2, color: Colors.white38,),
        ),
        Container(
          child: Text(
            "측정한 시간",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          child: Text(
            "${pong.time != null ? DateTimeParser().defaultParse(pong.time): "불러오는 중"}",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}