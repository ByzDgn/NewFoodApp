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
        title: const Text('Filtrele ve Planla'),
        backgroundColor: Colors.orange.shade700,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Diyet Seçimi',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      DropdownButton<String>(
                        value: selectedDiet,
                        hint: const Text('Bir diyet seçin'),
                        items: diets.map((diet) {
                          return DropdownMenuItem(
                            value: diet.toLowerCase(),
                            child: Text(diet),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedDiet = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Kısıtlamalar',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      DropdownButton<String>(
                        value: selectedIntolerance,
                        hint: const Text('Bir kısıtlama seçin'),
                        items: intolerances.map((intolerance) {
                          return DropdownMenuItem(
                            value: intolerance.toLowerCase(),
                            child: Text(intolerance),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedIntolerance = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.orange.shade700,
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
