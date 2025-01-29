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
        title: const Text('Categories'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1 / 1.3,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return InkWell(
              onTap: () {
                _navigateToCategoryPage(context, category['name']!);
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        category['image']!,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      category['name']!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
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

  void _navigateToCategoryPage(BuildContext context, String categoryName) {
    switch (categoryName) {
      case 'Burgers':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BurgersPage()));
        break;
    }
  }
}
