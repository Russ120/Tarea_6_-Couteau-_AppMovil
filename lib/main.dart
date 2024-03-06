import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarea 6 (Couteau)',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tarea 6 (Couteau)'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
