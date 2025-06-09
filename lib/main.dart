import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisprr/view_models/auth_viewmodel.dart';
import 'package:whisprr/views/landing_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewmodel())],
      child: const MyApp(),
    ),
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff0070FC)),
      ),
      home: const LandingScreen(),
    );
  }
}
