import 'package:flutter/material.dart';

class BurgersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Burgers')),
      body: const Center(child: Text('Welcome to the Burgers category!')),
    );
  }
}
