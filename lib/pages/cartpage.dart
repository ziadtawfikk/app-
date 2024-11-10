// صفحة سلة المشتريات (مع تحديث فوري)
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<String> cartItems;
  final Function(String) onRemove;

  const CartPage({super.key, required this.cartItems, required this.onRemove});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.cartItems[index]),
            trailing: IconButton(
              icon: const Icon(Icons.remove_shopping_cart),
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
