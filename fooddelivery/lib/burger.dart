import 'package:flutter/material.dart';

class BurgersPage extends StatelessWidget {
  final List<Map<String, dynamic>> burgers = [
    {
      'name': 'Korean BBQ Burger',
      'image': 'assets/Korean-BBQ-Burger-1.jpg',
      'price': 4.99
    },
    {
      'name': 'Indian Spiced Burger',
      'image': 'assets/Indian-Spiced-Burger.jpg',
      'price': 3.99
    },
    {
      'name': 'Beyond Burger',
      'image': 'assets/Beyond-Burger.jpg',
      'price': 5.49
    },
    {
      'name': 'Big Mac Burger',
      'image': 'assets/Big-Mac-Burger.jpg',
      'price': 6.99
    },
    {
      'name': 'Black Bean Burgers',
      'image': 'assets/Black-Bean-Burgers.jpg',
      'price': 2.49
    },
    {
      'name': 'Burger King Whopper',
      'image': 'assets/Burger-King-Whopper.jpg',
      'price': 5.49
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
            childAspectRatio: 1 / 1.3,
          ),
          itemCount: burgers.length,
          itemBuilder: (context, index) {
            final burger = burgers[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        burger['image']!,
                        width: 90,
                        height: 90,
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
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            _addToFavorites(context, burger['name']!);
                          },
                          icon: const Icon(Icons.favorite_border),
                          color: Colors.red,
                          iconSize: 28,
                        ),
                        IconButton(
                          onPressed: () {
                            _addToCart(context, burger['name']!);
                          },
                          icon: const Icon(Icons.add_circle),
                          color: Colors.green,
                          iconSize: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _addToCart(BuildContext context, String burgerName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$burgerName added to cart!')),
    );
  }

  void _addToFavorites(BuildContext context, String burgerName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$burgerName added to favorites!')),
    );
  }
}
