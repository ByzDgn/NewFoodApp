import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class IngredientSearchScreen extends StatefulWidget {
  const IngredientSearchScreen({Key? key}) : super(key: key);

  @override
  State<IngredientSearchScreen> createState() => _IngredientSearchScreenState();
}

class _IngredientSearchScreenState extends State<IngredientSearchScreen> {
  final TextEditingController _ingredientController = TextEditingController();
  List<Map<String, String>> _recipes = [];
  bool _isLoading = false;

  // Spoonacular API Key
  final String _apiKey = 'f291edcccbb3483692334018cb347944';

  Future<void> _searchRecipes() async {
    setState(() {
      _isLoading = true;
      _recipes = [];
    });

    final String ingredients = _ingredientController.text.trim();
    if (ingredients.isEmpty) {
      _showErrorDialog('Lütfen malzemeleri girin.');
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final String url =
        'https://api.spoonacular.com/recipes/findByIngredients?ingredients=$ingredients&number=10&apiKey=$_apiKey';

    print('API URL: $url'); // URL'yi konsola yazdır

    try {
      final response = await http.get(Uri.parse(url));
      print('Response Code: ${response.statusCode}'); // Yanıt kodunu konsola yazdır
      print('Response Body: ${response.body}'); // Yanıt içeriğini konsola yazdır

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _recipes = (data as List<dynamic>).map((recipe) {
            return {
              'title': recipe['title'] as String? ?? 'Tarif adı yok',
              'image': recipe['image'] as String? ?? '',
            };
          }).toList();
        });
      } else {
        _showErrorDialog('API hatası: ${response.statusCode}\nMesaj: ${response.body}');
      }
    } catch (error) {
      print('Hata: $error'); // Hata mesajını konsola yazdır
      _showErrorDialog('Bir hata oluştu: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hata'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Malzeme ile Tarif Bulma'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Malzeme giriş alanı
            TextField(
              controller: _ingredientController,
              decoration: InputDecoration(
                hintText: 'Malzemeleri virgül ile ayırarak girin (örn: domates, peynir)',
                labelText: 'Malzemeler',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),

            // Arama butonu
            ElevatedButton(
              onPressed: _searchRecipes,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.all(16),
              ),
              child: const Text(
                'Tarif Ara',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),

            // Yükleniyor animasyonu veya sonuçlar
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              )
            else if (_recipes.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = _recipes[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: recipe['image']!.isNotEmpty
                            ? Image.network(
                                recipe['image']!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              )
                            : const Icon(Icons.fastfood, size: 50),
                        title: Text(recipe['title']!),
                      ),
                    );
                  },
                ),
              )
            else
              const Center(
                child: Text(
                  'Sonuç bulunamadı.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
