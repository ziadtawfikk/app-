import 'package:flutter/material.dart';
import 'login.dart';  // تأكد من أنك أضفت ملف login.dart
import 'home.dart';   // تأكد من أنك أضفت ملف home.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Login(),  // هنا تم تحديد شاشة Login كالشاشة الرئيسية عند تشغيل التطبيق
      debugShowCheckedModeBanner: false,
    );
  }
}