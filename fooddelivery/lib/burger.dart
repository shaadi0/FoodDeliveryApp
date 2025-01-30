import 'package:flutter/material.dart';
import 'korean_burger_page.dart';

class BurgersPage extends StatelessWidget {
  final List<Map<String, dynamic>> burgers = [
    {
      'name': 'Korean BBQ Burger',
      'image': 'assets/Korean-BBQ-Burger-1.jpg',
      'price': 4.99,
      'page': KoreanBurgerPage(),
    },
    {
      'name': 'Indian Spiced Burger',
      'image': 'assets/Indian-Spiced-Burger.jpg',
      'price': 3.99,
    },
    {
      'name': 'Beyond Burger',
      'image': 'assets/Beyond-Burger.jpg',
      'price': 6.00,
    },
    {
      'name': 'Big Mac Burger',
      'image': 'assets/Big-Mac-Burger.jpg',
      'price': 6.99,
    },
    {
      'name': 'Black Bean Burgers',
      'image': 'assets/Black-Bean-Burgers.jpg',
      'price': 2.49,
    },
    {
      'name': 'Burger King Whopper',
      'image': 'assets/Burger-King-Whopper.jpg',
      'price': 5.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Burger Varieties'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemCount: burgers.length,
          itemBuilder: (context, index) {
            final burger = burgers[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => burger['page'],
                  ),
                );
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          burger['image']!,
                          width: double.infinity,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        burger['name']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '\$${burger['price'].toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
