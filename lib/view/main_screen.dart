import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главный экран')),
      body: const Center(
        child: Text(
          'Добро пожаловать в приложение!',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}