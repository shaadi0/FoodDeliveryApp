import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<Map<String, String>> favorites = [
    {
      "name": "Indian Spiced Burger",
      "description":
          "A flavorful burger infused with Indian spices, often topped with chutneys, yogurt sauce, and fresh veggies.",
      "image": "assets/Indian-Spiced-Burger.jpg"
    },
    {
      "name": "Black Bean Burger",
      "description":
          "A hearty and nutritious plant-based burger made with black beans, spices, and vegetables, perfect for vegetarians.",
      "image": "assets/Black-Bean-Burgers.jpg"
    },
    {
      "name": "Korean BBQ Burger",
      "description":
          "A delicious fusion burger featuring marinated Korean BBQ beef, spicy kimchi, and tangy gochujang sauce.",
      "image": "assets/Korean-BBQ-Burger-1.jpg"
    },
    {
      "name": "Burger King Whopper",
      "description":
          "A classic fast-food burger from Burger King, featuring a flame-grilled beef patty, fresh lettuce, tomato, and signature sauce.",
      "image": "assets/Burger-King-Whopper.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final favorite = favorites[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      favorite["image"]!,
                      width: 80, // Set fixed width
                      height: 80, // Set fixed height
                      fit: BoxFit.cover, // Keep aspect ratio
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          favorite["name"]!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          favorite["description"]!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _removeFromFavorites(context, favorite["name"]!);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _removeFromFavorites(BuildContext context, String burgerName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$burgerName removed from favorites!')),
    );
  }
}
