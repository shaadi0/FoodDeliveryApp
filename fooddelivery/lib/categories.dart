import 'package:flutter/material.dart';
import 'burger.dart';

class CategoriesPage extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Burgers', 'image': 'assets/burgerc.png'},
    {'name': 'Pasta', 'image': 'assets/pastac.png'},
    {'name': 'Pizza', 'image': 'assets/pizzac.png'},
    {'name': 'Salads', 'image': 'assets/saladc.png'},
    {'name': 'Sushi', 'image': 'assets/sushic.png'},
    {'name': 'Sandwiches', 'image': 'assets/sandwichesc.png'},
    {'name': 'Desserts', 'image': 'assets/dessertc.png'},
    {'name': 'Drinks', 'image': 'assets/drinksc.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.85,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              _navigateToCategoryPage(context, category['name']!);
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 233, 231),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      category['image']!,
                      width: 70,
                      height: 70,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category['name']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToCategoryPage(BuildContext context, String categoryName) {
    switch (categoryName) {
      case 'Burgers':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BurgersPage()),
        );
        break;
    }
  }
}
