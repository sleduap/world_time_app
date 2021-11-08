// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    // home: const Home(),
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/chooseLocation': (context) => const ChooseLocation()
    },
  ));
}
