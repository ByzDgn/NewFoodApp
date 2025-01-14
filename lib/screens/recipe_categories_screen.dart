import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:foodapp/screens/recipe_detail_screen.dart';

class RecipeCategoriesScreen extends StatefulWidget {
  const RecipeCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<RecipeCategoriesScreen> createState() => _RecipeCategoriesScreenState();
}

class _RecipeCategoriesScreenState extends State<RecipeCategoriesScreen> {
  late Future<List<dynamic>> recipes;

  Future<List<dynamic>> _loadRecipes() async {
    final data = await DefaultAssetBundle.of(context).loadString('assets/recipes.json');
    return json.decode(data);
  }

  @override
  void initState() {
    super.initState();
    recipes = _loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yemek Tarifleri'),
        backgroundColor: const Color(0xFF004D79),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF004D79), Color(0xFF0084A8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<List<dynamic>>(
          future: recipes,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Tarifler yüklenirken bir hata oluştu.'));
            }

            final recipeList = snapshot.data ?? [];

            return ListView.builder(
              itemCount: recipeList.length,
              itemBuilder: (context, index) {
                final recipe = recipeList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      recipe['gorsel'], // JSON'daki görsel yolu
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      recipe['isim'], // JSON'daki yemek ismi
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(recipe['kategori']), // Kategori bilgisi
                    onTap: () {
                      // Detay sayfasına yönlendirme
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailScreen(recipe: recipe),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
