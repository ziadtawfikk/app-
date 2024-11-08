import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        title: Text("Home"),
        actions: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(211, 164, 255, 193),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cartItems.length.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showCart();
                    },
                    icon: Icon(Icons.add_shopping_cart),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
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
                    showCart();  // عند الضغط على "My Products"، نعرض صفحة سلة المشتريات
                  },
                ),
                ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help_center),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {},
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
      body: ListView.builder(
        itemCount: carList.length,
        itemBuilder: (BuildContext context, int index) {
          double height = (index == 0) ? 150 : 200;

          return Container(
            margin: EdgeInsets.all(8.0),
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
                SizedBox(height: 8),
                Text(
                  carList[index]['name']!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  carList[index]['price']!,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        addToCart(carList[index]['name']!);
                      },
                      icon: Icon(Icons.add_shopping_cart),
                      color: Colors.green,
                    ),
                    SizedBox(width: 8),
                    Text('Add to cart'),
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

// صفحة التفاصيل
class Details extends StatelessWidget {
  final Map<String, String> car;
  final Function(String) addToCart;

  const Details({Key? key, required this.car, required this.addToCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int rating = int.tryParse(car['rating']!) ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(car['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(car['image']!),
            SizedBox(height: 16),
            Text(
              car['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              car['price']!,
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    addToCart(car['name']!);
                  },
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.green,
                ),
                SizedBox(width: 8),
                Text('Add to cart'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'هذه السيارة هي واحدة من أفضل السيارات في فئتها. تتميز بالراحة والأداء العالي، كما أنها تتمتع بتقنيات حديثة لراحة السائق والركاب. إذا كنت تبحث عن سيارة تجمع بين القوة والكفاءة، فإن هذه السيارة هي الخيار المثالي.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

// صفحة سلة المشتريات (مع تحديث فوري)
class CartPage extends StatefulWidget {
  final List<String> cartItems;
  final Function(String) onRemove;

  const CartPage({Key? key, required this.cartItems, required this.onRemove}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.cartItems[index]),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                setState(() {
                  widget.onRemove(widget.cartItems[index]);
                });
              },
            ),
          );
        },
      ),
    );
  }
}