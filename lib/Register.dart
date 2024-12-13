import 'package:flutter/material.dart';
import 'login.dart'; // تأكد من استيراد ملف Login

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView( // إضافة خاصية التمرير
          child: Padding(
            padding: const EdgeInsets.all(16.0), // إضافة padding حول Column
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // توسيط العناصر عموديًا
              crossAxisAlignment: CrossAxisAlignment.center, // توسيط العناصر أفقيًا
              children: [
                // خانة اسم المستخدم
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Your Username:", // نص الخانة
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
                // خانة البريد الإلكتروني
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
                // خانة كلمة المرور
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
                SizedBox(height: 20), // مسافة قبل زر Sign Up
                ElevatedButton(
                  onPressed: () {
                    // إضافة إجراء تسجيل حساب جديد
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // لون الزر
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // حواف دائرية
                    ),
                  ),
                  child: Text(
                    'Register',
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
                          MaterialPageRoute(builder: (context) => const Login()), // الانتقال إلى صفحة تسجيل الدخول
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100), // مسافة إضافية في الأسفل لتوسيع المسافة
              ],
            ),
          ),
        ),
      ),
    );
  }
}