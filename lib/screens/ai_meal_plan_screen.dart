import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'meal_plan_screen.dart';

class AiMealPlanScreen extends StatelessWidget {
  final String? diet;
  final String? intolerance;

  const AiMealPlanScreen({Key? key, this.diet, this.intolerance}) : super(key: key);

  Future<Map<String, dynamic>> _generateMealPlan() async {
    String url =
        'https://api.spoonacular.com/mealplanner/generate?timeFrame=week&apiKey=182d8f94233946f7ae026202e423ca18';

    if (diet != null && diet!.isNotEmpty) {
      url += '&diet=$diet';
    }
    if (intolerance != null && intolerance!.isNotEmpty) {
      url += '&intolerances=$intolerance';
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['week'] ?? {};
    } else {
      throw Exception('API Hatası: ${response.statusCode}');
    }
  }

  void _showMealPlan(BuildContext context) async {
    try {
      final weekPlan = await _generateMealPlan();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealPlanScreen(weekData: weekPlan),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hata oluştu: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Destekli Plan'),
        backgroundColor: Colors.orange.shade700,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            backgroundColor: Colors.orange.shade700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () => _showMealPlan(context),
          child: const Text(
            'Planı Getir',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
