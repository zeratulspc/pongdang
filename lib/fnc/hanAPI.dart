import 'package:http/http.dart' as http;
import 'dart:convert';
//http://hangang.dkserver.wo.tc/

class HanAPI {
  http.Client client = http.Client();

    Future<Pong> fetchData() async {
      http.Response res = await client.get('http://hangang.dkserver.wo.tc/');
      final parsed = json.decode(res.body);
      return Pong().fromJson(parsed);
    }
}

class Pong {
  String result;
  String temp;
  DateTime time;

  Pong({this.result, this.temp, this.time});

  fromJson(Map<String, dynamic> json) {
    String _jsonTime = json['time'];
    List<String> bigger = _jsonTime.split(' ');
    List<String> sectionOne = bigger[0].split('-');
    List<String> sectionTwo = bigger[1].split(':');
    int year = int.parse(sectionOne[0]);
    int month = int.parse(sectionOne[1]);
    int day = int.parse(sectionOne[2]);
    int hour = int.parse(sectionTwo[0]);
    int minute = int.parse(sectionTwo[1]);
    int second = int.parse(sectionTwo[2]);
    DateTime _time = DateTime(year, month, day, hour, minute, second);
    return Pong(
      result: json['result'] as String,
      temp: json['temp'] as String,
      time: _time,
    );
  }

}