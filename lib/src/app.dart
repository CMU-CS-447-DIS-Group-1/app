import 'package:app/src/resources/Screen/HomeScreen.dart';
import 'package:app/src/resources/Screen/LoginHomePage.dart';
import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
