import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_keys.dart'; // API anahtarınızı burada saklıyoruz

class ApiService {
  static const String baseUrl = 'https://api.spoonacular.com/recipes';

  static Future<List<dynamic>> fetchRecipes() async {
    final url = Uri.parse('$baseUrl/random?number=16&apiKey=${ApiKeys.spoonacularApiKey}');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['recipes']; // 'recipes' JSON'dan gelen liste
      } else {
        throw Exception('Tarifler alınamadı. Kod: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Hata oluştu: $e');
    }
  }
}
