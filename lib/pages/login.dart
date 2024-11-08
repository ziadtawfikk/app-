import 'package:flutter/material.dart';
import 'register.dart'; // تأكد من استيراد ملف Register

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // إضافة padding حول Column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // توسيط العناصر عموديًا
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter Your Email:",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(8),
                ),
              ),
              SizedBox(height: 16), // مسافة بين الحقول
              TextField(
                obscureText: true, // تفعيل حماية النص عند الكتابة
                decoration: InputDecoration(
                  hintText: "Enter Your Password:",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(8),
                ),
              ),
              SizedBox(height: 20), // مسافة قبل زر Sign In
              ElevatedButton(
                onPressed: () {
                  // إضافة إجراء تسجيل دخول
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // لون الزر
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // حواف دائرية
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white, // جعل النص باللون الأبيض
                    fontSize: 18, // زيادة حجم الخط
                    fontWeight: FontWeight.bold, // جعل النص عريض (اختياري)
                  ),
                ),
              ),
              SizedBox(height: 20), // المسافة بين الزر والصف
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do not have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Register()), // الانتقال إلى صفحة التسجيل
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}