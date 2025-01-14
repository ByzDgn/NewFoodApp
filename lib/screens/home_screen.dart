import 'package:flutter/material.dart';
import 'recipe_list_screen.dart';
import 'meal_plan_filter_screen.dart'; // Filtreleme ekranını ekledik

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF001B48), Color(0xFF0084A8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Başlık
              const Text(
                'Yemek Tarifleri Uygulaması',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Yemek Tariflerini Görüntüle Butonu
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF8C42),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RecipeListScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.restaurant_menu, color: Colors.white),
                label: const Text(
                  'Yemek Tariflerini Görüntüle',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Haftalık Yemek Planı Oluştur Butonu
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E81FA),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MealPlanFilterScreen(), // Filtreleme ekranına yönlendir
                    ),
                  );
                },
                icon: const Icon(Icons.filter_alt_outlined, color: Colors.white),
                label: const Text(
                  'Haftalık Yemek Planı Oluştur',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
