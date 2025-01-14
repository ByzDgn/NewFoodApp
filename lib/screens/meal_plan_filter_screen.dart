import 'package:flutter/material.dart';
import 'ai_meal_plan_screen.dart'; // AiMealPlanScreen'i import edin

class MealPlanFilterScreen extends StatefulWidget {
  const MealPlanFilterScreen({Key? key}) : super(key: key);

  @override
  State<MealPlanFilterScreen> createState() => _MealPlanFilterScreenState();
}

class _MealPlanFilterScreenState extends State<MealPlanFilterScreen> {
  String? selectedDiet;
  String? selectedIntolerance;

  final List<String> diets = [
    'Normal',
    'Az Kalorili',
    'Glutensiz',
    'Ketojenik',
    'Protein Ağırlıklı',
    'Vegan',
    'Vejetaryen',
  ];

  final List<String> intolerances = [
    'Süt Ürünleri',
    'Gluten',
    'Kabuklu Deniz Ürünleri',
    'Fındık',
    'Soya',
    'Buğday',
    'Yumurta',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filtrele ve Planla',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Diyet Seçimi Kartı
              _buildFilterCard(
                title: 'Diyet Seçimi',
                hintText: 'Bir diyet seçin',
                items: diets,
                value: selectedDiet,
                onChanged: (value) {
                  setState(() {
                    selectedDiet = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Kısıtlamalar Kartı
              _buildFilterCard(
                title: 'Kısıtlamalar',
                hintText: 'Bir kısıtlama seçin',
                items: intolerances,
                value: selectedIntolerance,
                onChanged: (value) {
                  setState(() {
                    selectedIntolerance = value;
                  });
                },
              ),
              const SizedBox(height: 30),

              // Plan Oluştur Butonu
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  backgroundColor: const Color(0xFFFF7043),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AiMealPlanScreen(
                        diet: selectedDiet,
                        intolerance: selectedIntolerance,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Plan Oluştur',
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

  Widget _buildFilterCard({
    required String title,
    required String hintText,
    required List<String> items,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      shadowColor: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF424242),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: value,
              hint: Text(hintText),
              isExpanded: true,
              items: items.map((item) {
                return DropdownMenuItem(
                  value: item.toLowerCase(),
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
