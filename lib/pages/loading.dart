import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    WorldTime instance =
        WorldTime(location: "Kathmandu", flag: "flag", url: "Asia/Kathmandu");

    await instance.getTime();
    Map data = {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    };
    Navigator.pushReplacementNamed(context, '/home', arguments: data);
  }

  @override
  void initState() {
    setUpWorldTime();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Center(
            child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
