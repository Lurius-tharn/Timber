import 'package:flutter/material.dart';
import 'package:timber/screens/LoginScreen.dart';

var _index = 0;

void main() {
  runApp(const MaterialApp(
    title: "Timber",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginScreen());
  }
}

class MeinProfile extends StatelessWidget {
  const MeinProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
