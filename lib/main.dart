import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_retrofit/network/api/api_service.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'ui/my_homepage.dart';

void main() {
  _setUpLogger();
  runApp(MyApp());
}

void _setUpLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) =>
      {print("${event.level.name} : ${event.time} : ${event.message}")});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ApiService.create(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home: MyHomePage(),
      ),
    );
  }
}
