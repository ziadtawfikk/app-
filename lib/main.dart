import 'package:flutter/material.dart';
import 'package:untitled4/pages/Home.dart';
import 'package:untitled4/pages/Register.dart';
import 'package:untitled4/pages/login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const Login(),
    );
  }

}