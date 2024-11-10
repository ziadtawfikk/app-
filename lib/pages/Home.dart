import 'package:flutter/material.dart';
import 'package:untitled4/pages/cartpage.dart';
import 'package:untitled4/pages/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> cartItems = [];

  static const List<Map<String, String>> carList = [
    {
      'image': 'images/10.png',
      'name': 'Toyota Land Cruiser',
      'price': '\$21,000',
      'rating': '4'
    },
    {
      'image': 'images/16.png',
      'name': 'Hyundai Palisade',
      'price': '\$25,000',
      'rating': '3'
    },
    {
      'image': 'images/9.png',
      'name': 'Toyota Supra',
      'price': '\$22,000',
      'rating': '4'
    },
    {
      'image': 'images/5.png',
      'name': 'Toyota Corolla',
      'price': '\$18,000',
      'rating': '5'
    },
    {
      'image': 'images/6.png',
      'name': 'Toyota Corolla',
      'price': '\$15,000',
      'rating': '4'
    },
    {
      'image': 'images/13.png',
      'name': 'سيارة 13',
      'price': '\$29,000',
      'rating': '3'
    },
    {
      'image': 'images/8.png',
      'name': 'Toyota Fortuner',
      'price': '\$27,000',
      'rating': '4'
    },
    {
      'image': 'images/18.png',
      'name': 'Hyundai Sonata',
      'price': '\$30,000',
      'rating': '5'
    },
    {
      'image': 'images/15.png',
      'name': 'Hyundai',
      'price': '\$26,000',
      'rating': '4'
    },
    {
      'image': 'images/11.png',
      'name': 'Toyota Camry',
      'price': '\$20,000',
      'rating': '3'
    },
    {
      'image': 'images/7.png',
      'name': 'Toyota Hilux',
      'price': '\$23,000',
      'rating': '4'
    },
    {
      'image': 'images/2.png',
      'name': 'Toyota Shas',
      'price': '\$24,000',
      'rating': '5'
    },
  ];

  void addToCart(String itemName) {
    setState(() {
      cartItems.add(itemName);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$itemName أضيفت إلى سلة الطلبات!'),
      ),
    );
  }

  void removeFromCart(String itemName) {
    setState(() {
      cartItems.remove(itemName);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$itemName تمت إزالته من سلة الطلبات!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 141, 95),
        title: const Text("Home"),
        actions: [
          Row(
            children: [
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
                    onPressed: () {
                      showCart();
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  "\$ 128",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/19.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  accountName: Transform.translate(
                    offset: const Offset(0, 10),
                    child: const Text(
                      "F A H D",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        height: 0.8,
                      ),
                    ),
                  ),
                  accountEmail: Transform.translate(
                    offset: const Offset(0, 10),
                    child: const Text("Fahd@yahoo.com"),
                  ),
                ),
                ListTile(
                  title: const Text("Home"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text("My Products"),
                  leading: const Icon(Icons.add_shopping_cart),
                  onTap: () {
                    showCart(); // عند الضغط على "My Products"، نعرض صفحة سلة المشتريات
                  },
                ),
                ListTile(
                  title: const Text("About"),
                  leading: const Icon(Icons.help_center),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Logout"),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () {},
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: const Text(
                "Developed by Z_T_D_S  © 2024",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: carList.length,
        itemBuilder: (BuildContext context, int index) {
          double height = (index == 0) ? 150 : 200;

          return Container(
            width: 350,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 1),
                    blurRadius: 3,
                    spreadRadius: 5)
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                          car: carList[index],
                          addToCart: addToCart,
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      carList[index]['image']!,
                      fit: BoxFit.cover,
                      height: height,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  carList[index]['name']!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  carList[index]['price']!,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        addToCart(carList[index]['name']!);
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                      color: Colors.green,
                    ),
                    const SizedBox(width: 8),
                    const Text('Add to cart'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void showCart() {
    Navigator.push(
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
