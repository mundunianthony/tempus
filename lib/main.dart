import 'package:flutter/material.dart';

void main() {
  runApp(const TempAlertApp());
}

class TempAlertApp extends StatelessWidget {
  const TempAlertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Alert App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const Scaffold(
        body: Center(child: Text("Welcome to TempAlert")),
      ),
    );
  }
}
