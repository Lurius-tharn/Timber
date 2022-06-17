import 'package:flutter/material.dart';
import 'package:timber/screens/LoginScreen.dart';

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
    return const Scaffold(body: LoginScreen());
  }
}
