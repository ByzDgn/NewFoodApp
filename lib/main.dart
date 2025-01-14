import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';  // SplashScreen'ı import ettik


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Debug banner'ını kaldırır
      title: 'FoodApp',
      theme: ThemeData(
        primarySwatch: Colors.teal,  // Ana renk
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),  // İlk ekran olarak SplashScreen'i başlatıyoruz
    );
  }
}
