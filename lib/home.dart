import 'package:flutter/material.dart';
import 'login.dart';
import 'details.dart';
import 'cart.dart';
import 'about.dart';
import 'us.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> cartItems = [];

  static const List<Map<String, String>> carList = [
    {'image': 'images/10.png', 'name': 'Toyota Land Cruiser', 'price': '\$21,000', 'rating': '4'},
    {'image': 'images/20.jpg', 'name': 'Nissan Patrol', 'price': '\$24,000', 'rating': '5'},
    {'image': 'images/16.png', 'name': 'Hyundai Palisade', 'price': '\$25,000', 'rating': '3'},
    {'image': 'images/9.png', 'name': 'Toyota Supra', 'price': '\$22,000', 'rating': '4'},
    {'image': 'images/5.png', 'name': 'Toyota Corolla', 'price': '\$18,000', 'rating': '5'},
    {'image': 'images/6.png', 'name': 'Toyota Corolla', 'price': '\$15,000', 'rating': '4'},
    {'image': 'images/13.png', 'name': 'سيارة 13', 'price': '\$29,000', 'rating': '3'},
    {'image': 'images/8.png', 'name': 'Toyota Fortuner', 'price': '\$27,000', 'rating': '4'},
    {'image': 'images/18.png', 'name': 'Hyundai Sonata', 'price': '\$30,000', 'rating': '5'},
    {'image': 'images/15.png', 'name': 'Hyundai', 'price': '\$26,000', 'rating': '4'},
    {'image': 'images/11.png', 'name': 'Toyota Camry', 'price': '\$20,000', 'rating': '3'},
    {'image': 'images/7.png', 'name': 'Toyota Hilux', 'price': '\$23,000', 'rating': '4'},
    {'image': 'images/2.png', 'name': 'Toyota Shas', 'price': '\$24,000', 'rating': '5'},
    {'image': 'images/3.png', 'name': 'Toyota Hilux', 'price': '\$30,000', 'rating': '4'},
  ];

  void addToCart(String itemName) {
    setState(() {
      cartItems.add(itemName);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$itemName أضيفت إلى سلة الطلبات!')),
    );
  }

  void removeFromCart(String itemName) {
    setState(() {
      cartItems.remove(itemName);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$itemName تمت إزالته من سلة الطلبات!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.green,
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
                  cartItems.length.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              IconButton(
                onPressed: showCart,
                icon: const Icon(Icons.add_shopping_cart),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/19.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  accountName: Transform.translate(
                    offset: Offset(0, 10),
                    child: Text(
                      "F A H D",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        height: 0.8,
                      ),
                    ),
                  ),
                  accountEmail: Transform.translate(
                    offset: Offset(0, 10),
                    child: Text("Fahd@yahoo.com"),
                  ),
                ),
                ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("My Products"),
                  leading: Icon(Icons.add_shopping_cart),
                  onTap: () {
                    showCart();
                  },
                ),
                ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help_center),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const About()),
                    );
                  },
                ),
                ListTile(
                  title: Text("US"),
                  leading: Icon(Icons.group),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Us()),
                    );
                  },
                ),
                ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Text(
                "Developed by Z_T_D_S  © 2024",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(     //بيعرض تفاصيل السياره ال في list
        itemCount: carList.length,
        itemBuilder: (context, index) {
          final car = carList[index];
          return GestureDetector(   //لما بضغط يحولني لصفحه ال details
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(
                    car: car,
                    addToCart: addToCart,
                    cartItemCount: cartItems.length,  //عدد ال جوه السله
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Image.asset(
                  car['image']!,
                  width: 300,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        car['name']!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        car['price']!,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void showCart() {
    Navigator.push(   //صفحه فوق صفحه
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(
          cartItems: cartItems,
          onRemove: removeFromCart,
        ),
      ),
    );
  }
}
