import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Map<String, String> car;
  final Function(String) addToCart;

  const Details({super.key, required this.car, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    int rating = int.tryParse(car['rating']!) ?? 0;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        title: Text(car['name']!),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(car['image']!),
            const SizedBox(height: 16),
            Text(
              car['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              car['price']!,
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.yellow,
                );
              }),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    addToCart(car['name']!);
                  },
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    size: 40,
                  ),
                  color: Colors.green,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Add to cart',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'هذه السيارة هي واحدة من أفضل السيارات في فئتها. تتميز بالراحة والأداء العالي، كما أنها تتمتع بتقنيات حديثة لراحة السائق والركاب. إذا كنت تبحث عن سيارة تجمع بين القوة والكفاءة، فإن هذه السيارة هي الخيار المثالي.',
              style: TextStyle(fontSize: 25, color: Colors.white),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }
}
