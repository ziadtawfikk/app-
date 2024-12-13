import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Map<String, String> car;
  final Function(String) addToCart;
  final int cartItemCount;  // إضافة متغير عدد العناصر في السلة

  const Details({Key? key, required this.car, required this.addToCart, required this.cartItemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int rating = int.tryParse(car['rating']!) ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(car['name']!),
        backgroundColor: Colors.green, // تغيير لون الـ AppBar إلى أخضر
        actions: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(211, 164, 255, 193),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  cartItemCount.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              IconButton(
                onPressed: () {
                  // يمكنك هنا إظهار السلة أو صفحة السلة
                },
                icon: const Icon(Icons.add_shopping_cart, color: Colors.white), // تغيير لون أيقونة السلة إلى أبيض
              ),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // توسيط جميع العناصر رأسياً
        children: [
          Center(
            child: Image.asset(
              car['image']!,
              width: 300,  // تقليل حجم الصورة
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Center(  // توسيط النصوص
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,  // توسيط النصوص
                children: [
                  Text(
                    car['name']!,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    car['price']!,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This is a brief description of the car. It features modern design, powerful engine, and luxurious interior. A perfect choice for those who seek comfort and performance.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,  // توسيط الوصف
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: Colors.yellow,
                      );
                    }),
                  ),
                  SizedBox(height: 16),
                  // توسيط الزر
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      onPressed: () => addToCart(car['name']!),
                      icon: Icon(Icons.shopping_cart, color: Colors.white),  // تغيير لون الأيقونة إلى أبيض
                      label: const Text("Add to Cart"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // تغيير لون الخلفية إلى أخضر
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}