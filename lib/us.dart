import 'package:flutter/material.dart';

class Us extends StatelessWidget {
  const Us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Partners of Success',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/ziad.jpg',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      // صورة ضياء
                      Image.asset(
                        'images/aaa.jpg',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // صورة طارق
                      Image.asset(
                        'images/tarek.jpg',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      // صورة شريف
                      Image.asset(
                        'images/sherif.jpg',
                        width: 175,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ],
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
