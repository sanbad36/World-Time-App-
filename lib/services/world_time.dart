import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practice_3/pages/loading.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      var response =
          await http.get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      String min = data['utc_offset'].substring(
        4,
      );
      // print('min $min');
      // print(data['utc_offset']);
      // print(datetime);
      // print(offset);

      //  Create datetime object
      DateTime now = DateTime.parse(datetime);
      // print(now);
      now =
          now.add(Duration(hours: int.parse(offset), minutes: int.parse(min)));
      // print(now);

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      //set time property
      // time = now.toString();
      time = DateFormat.jm().format(now);
      print(time);
    } catch (e) {
      print("Caught error :: $e");
      time = "could not find the time for this location";
    }
  }
}
