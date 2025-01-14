import 'package:flutter/material.dart';
import '../utils/api_service.dart';
import 'recipe_detail_screen.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yemek Tarifleri'),
        backgroundColor: const Color(0xFF004D79),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: ApiService.fetchRecipes(), // API'den tarifleri çekiyoruz
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Hiç tarif bulunamadı.'));
          }

          final recipes = snapshot.data!;
          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: recipe['image'] != null
                      ? Image.network(
                          recipe['image'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.fastfood),
                  title: Text(recipe['title']),
                  subtitle: Text(
                      'Hazırlama süresi: ${recipe['readyInMinutes']} dk'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecipeDetailScreen(recipe: recipe),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
