import 'package:flutter/material.dart';

import 'pay.dart';

class MyCartPage extends StatefulWidget {
  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  List<CartItem> cartItems = [
    CartItem(
        name: "Beyond Burger",
        image: "assets/Beyond-Burger.jpg",
        price: 6,
        weight: "500g",
        calories: "60 calories",
        quantity: 1),
    CartItem(
        name: "Burger King Whopper",
        image: "assets/Burger-King-Whopper.jpg",
        price: 5,
        weight: "500g",
        calories: "60 calories",
        quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    double subtotal =
        cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
    double delivery = 10;
    double tip = 3;
    double total = subtotal + delivery + tip;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("My Cart"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic, color: Colors.green),
                ),
              ),
            ),
            SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    item: cartItems[index],
                    onUpdateQuantity: (newQuantity) {
                      setState(() {
                        cartItems[index].quantity = newQuantity;
                      });
                    },
                    onRemove: () {
                      setState(() {
                        cartItems.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),

            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade200, blurRadius: 5)
                ],
              ),
              child: Column(
                children: [
                  _priceRow("Sub total", "\$${subtotal.toStringAsFixed(2)}"),
                  _priceRow("Delivery", "\$${delivery.toStringAsFixed(2)}"),
                  _priceRow("Tip", "\$${tip.toStringAsFixed(2)}"),
                  Divider(),
                  _priceRow("Total", "\$${total.toStringAsFixed(2)}",
                      isBold: true),
                ],
              ),
            ),

            SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              ),
              child: Text(
                "Check Out",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 254, 254, 254),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _priceRow(String title, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(amount,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}

class CartItem {
  final String name;
  final String image;
  final int price;
  final String weight;
  final String calories;
  int quantity;

  CartItem(
      {required this.name,
      required this.image,
      required this.price,
      required this.weight,
      required this.calories,
      required this.quantity});
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final Function(int) onUpdateQuantity;
  final Function onRemove;

  CartItemWidget(
      {required this.item,
      required this.onUpdateQuantity,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(item.image, width: 60, height: 60, fit: BoxFit.cover),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(item.weight + " | " + item.calories,
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  Text("\$${item.price}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle, color: Colors.green),
                  onPressed: () {
                    if (item.quantity > 1) {
                      onUpdateQuantity(item.quantity - 1);
                    }
                  },
                ),
                Text(item.quantity.toString(),
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.green),
                  onPressed: () {
                    onUpdateQuantity(item.quantity + 1);
                  },
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                onRemove();
              },
            ),
          ],
        ),
      ),
    );
  }
}
