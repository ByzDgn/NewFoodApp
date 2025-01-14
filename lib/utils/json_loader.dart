import 'dart:convert';
import 'package:flutter/services.dart';

class JsonLoader {
  static Future<List<dynamic>> loadRecipes(String category) async {
    final String response = await rootBundle.loadString('assets/recipes.json');
    final data = json.decode(response);
    return data[category];
  }
}
