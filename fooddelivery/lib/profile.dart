import 'package:flutter/material.dart';

import 'notification.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile.jpeg'),
          ),
          SizedBox(height: 10),
          Text(
            'Rukhsana Shaheen',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Rukhsanaux.321@gmail.com',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                ProfileMenuItem(
                    icon: Icons.notifications,
                    text: "Notification",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationPage()),
                      );
                    }),
                ProfileMenuItem(icon: Icons.payment, text: "Payment method"),
                ProfileMenuItem(
                    icon: Icons.card_giftcard, text: "Reward credits"),
                ProfileMenuItem(
                    icon: Icons.confirmation_number, text: "My promo code"),
                ProfileMenuItem(icon: Icons.settings, text: "Setting"),
                ProfileMenuItem(icon: Icons.people, text: "Invite Friends"),
                ProfileMenuItem(icon: Icons.help, text: "Help center"),
                ProfileMenuItem(icon: Icons.info, text: "About us"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  ProfileMenuItem({required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(text),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
