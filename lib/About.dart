import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About Us",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            const Text(
              "Welcome to our application! This platform is designed to make it easy for users to find, compare, and purchase cars. "
                  "Our goal is to provide a seamless and enjoyable experience by offering a wide range of vehicles that meet your needs and preferences.\n\n"
                  "We offer detailed information about each car, including specifications, prices, and reviews, so that you can make an informed decision. "
                  "Whether you're looking for a family car, a sports car, or a luxury vehicle, we have something for everyone.\n\n"
                  "Thank you for using our app. We are constantly working to improve and expand our services to make your experience even better.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 1.5,
              ),
            ),
            SizedBox(height: 20),
            const Text(
              "Developed by Z_T_D_S  © 2024",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
