import 'package:flutter/material.dart';

class MealPlanScreen extends StatelessWidget {
  final Map<String, dynamic> weekData;

  const MealPlanScreen({Key? key, required this.weekData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yemek Planı Detayları',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange.shade700,
        centerTitle: true,
      ),
      body: weekData.isNotEmpty
          ? ListView(
              padding: const EdgeInsets.all(16.0),
              children: weekData.keys.map((day) {
                final meals = weekData[day]['meals'] as List<dynamic>;
                final nutrients = weekData[day]['nutrients'];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,
                  child: ExpansionTile(
                    title: Text(
                      day.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    children: [
                      ...meals.map((meal) {
                        return ListTile(
                          leading: meal['imageType'] != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://spoonacular.com/recipeImages/${meal['id']}-556x370.${meal['imageType']}',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const Icon(
                                  Icons.fastfood,
                                  color: Colors.orange,
                                ),
                          title: Text(
                            meal['title'] ?? 'Başlık Yok',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Hazırlama Süresi: ${meal['readyInMinutes']} dk\nServis: ${meal['servings'] ?? 'Bilinmiyor'}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        );
                      }).toList(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Günlük Besin Değerleri:\n'
                            'Kalori: ${nutrients['calories']} kcal\n'
                            'Protein: ${nutrients['protein']} g\n'
                            'Yağ: ${nutrients['fat']} g\n'
                            'Karbonhidrat: ${nutrients['carbohydrates']} g',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          : const Center(
              child: Text(
                'Yemek planı bulunamadı.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
    );
  }
}
