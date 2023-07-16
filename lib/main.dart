import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/Screens/SplashScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final SystemUiOverlayStyle _style =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(_style);
    return MaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(),
      ),
    );
  }
}
