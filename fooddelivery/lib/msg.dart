import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  final List<Message> messages = [
    Message("Anila", "Your order has delivered", "2 min ago",
        "assets/anila.jpg", Colors.green),
    Message(
        "Anusha", "Hello!", "10 min ago", "assets/anusha.jpg", Colors.green),
    Message("Rashid Ali", "Your order is confirmed", "2:00 pm",
        "assets/rashid.jpg", Colors.black),
    Message(
        "Reena", "Lorem ipsum", "1:30 am", "assets/reena.jpg", Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
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
            ),
          );
        },
      ),
    );
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
