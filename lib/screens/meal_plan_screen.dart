import 'package:flutter/material.dart';

class MealPlanScreen extends StatelessWidget {
  final Map<String, dynamic> weekData;

  const MealPlanScreen({Key? key, required this.weekData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yemek Planı Detayları'),
        backgroundColor: Colors.orange.shade700,
      ),
      body: weekData.isNotEmpty
          ? ListView(
              children: weekData.keys.map((day) {
                final meals = weekData[day]['meals'] as List<dynamic>;
                final nutrients = weekData[day]['nutrients'];
                return ExpansionTile(
                  title: Text(
                    day.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ...meals.map((meal) {
                      return ListTile(
                        leading: meal['imageType'] != null
                            ? Image.network(
                                'https://spoonacular.com/recipeImages/${meal['id']}-556x370.${meal['imageType']}',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              )
                            : const Icon(Icons.fastfood),
                        title: Text(meal['title'] ?? 'Başlık Yok'),
                        subtitle: Text(
                          'Hazırlama Süresi: ${meal['readyInMinutes']} dk\nServis: ${meal['servings'] ?? 'Bilinmiyor'}',
                        ),
                      );
                    }).toList(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Günlük Besin Değerleri:\nKalori: ${nutrients['calories']} kcal\nProtein: ${nutrients['protein']} g\nYağ: ${nutrients['fat']} g\nKarbonhidrat: ${nutrients['carbohydrates']} g',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                );
              }).toList(),
            )
          : const Center(
              child: Text(
                'Yemek planı bulunamadı.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
