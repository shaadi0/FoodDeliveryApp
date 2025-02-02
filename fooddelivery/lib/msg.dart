import 'package:flutter/material.dart';

import 'mgs1.dart';

class MessagesPage extends StatelessWidget {
  final List<Message> messages = [
    Message("Anila", "Your order has delivered", "2 min ago",
        "assets/anila.jpeg", Colors.green),
    Message(
        "Anusha", "Hello!", "10 min ago", "assets/anusha.jpeg", Colors.green),
    Message("Rashid Ali", "Your order is confirmed", "2:00 pm",
        "assets/rashid.jpeg", Colors.black),
    Message(
        "Teena", "Lorem ipsum", "1:30 am", "assets/teena.jpeg", Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(message.imagePath),
                radius: 25,
              ),
              title: Text(message.name,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                message.message,
                style: TextStyle(color: message.textColor),
              ),
              trailing:
                  Text(message.time, style: TextStyle(color: Colors.grey)),
              onTap: () {
                handleNavigation(context, message.name);
              },
            ),
          );
        },
      ),
    );
  }

  void handleNavigation(BuildContext context, String name) {
    switch (name) {
      case "Anila":
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
        break;
      case "Anusha":
        break;
      case "Rashid Ali":
      case "Teena":
        break;
      default:
        break;
    }
  }
}

class Message {
  final String name;
  final String message;
  final String time;
  final String imagePath;
  final Color textColor;

  Message(this.name, this.message, this.time, this.imagePath, this.textColor);
}
