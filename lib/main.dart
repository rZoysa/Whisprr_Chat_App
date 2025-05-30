import 'package:flutter/material.dart';
import 'package:whisprr/views/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whisprr',
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LandingScreen(),
    );
  }
}
