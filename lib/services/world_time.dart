import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // Make the request
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      // print(data);
      String dateTime1 = data['datetime'];
      // print(dateTime1);
      String offset = data['utc_offset'].substring(1, 3);
      String offset2 = data['utc_offset'].substring(4, 6);

      DateTime abc = DateTime.parse(dateTime1);
      // print(abc);
      abc = abc
          .add(Duration(hours: int.parse(offset), minutes: int.parse(offset2)));
      // print(abc);
      isDayTime = abc.hour > 6 && abc.hour < 18 ? true : false;
      time = DateFormat.jm().format(abc);
      // print(time);
    } catch (error) {
      // print("Error in a code $error");
      time = 'Error in a code $error';
    }
  }
}
