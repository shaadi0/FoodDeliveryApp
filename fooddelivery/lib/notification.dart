import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<Map<String, String>> todayNotifications = [
    {
      "title": "Order",
      "subtitle": "Your order has delivered",
      "time": "2 min ago"
    },
    {
      "title": "Confirmed",
      "subtitle": "Your order is confirmed",
      "time": "10 min ago"
    },
    {
      "title": "Offers",
      "subtitle": "November offer 50% off",
      "time": "1 hour ago"
    },
  ];

  final List<Map<String, String>> yesterdayNotifications = [
    {
      "title": "Order",
      "subtitle": "Your order has delivered",
      "time": "2 min ago"
    },
    {
      "title": "Confirmed",
      "subtitle": "Your order is confirmed",
      "time": "10 min ago"
    },
    {
      "title": "Offers",
      "subtitle": "November offer 50% off",
      "time": "1 hour ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Notification', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                  text: "You have ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: "${todayNotifications.length} notifications",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: " today"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text("Today",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green)),
            ...todayNotifications
                .map((item) => NotificationTile(item))
                .toList(),
            SizedBox(height: 16),
            Text("Yesterday",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green)),
            ...yesterdayNotifications
                .map((item) => NotificationTile(item))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final Map<String, String> notification;
  NotificationTile(this.notification);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      color: Colors.grey[100],
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(Icons.notifications, color: Colors.green),
        title: Text(notification["title"]!,
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(notification["subtitle"]!),
        trailing: Text(notification["time"]!,
            style: TextStyle(color: Colors.grey, fontSize: 12)),
      ),
    );
  }
}
