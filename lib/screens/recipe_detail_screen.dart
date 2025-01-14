import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final dynamic recipe;

  const RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['title']),
        backgroundColor: const Color(0xFF004D79),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            recipe['image'] != null
                ? Image.network(recipe['image'], fit: BoxFit.cover)
                : const SizedBox(),
            const SizedBox(height: 16),
            Text(
              'Hazırlama Süresi: ${recipe['readyInMinutes']} dk',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Malzemeler:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            for (var ingredient in recipe['extendedIngredients'])
              Text('- ${ingredient['original']}'),
            const SizedBox(height: 16),
            Text(
              'Adımlar:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            for (var step in recipe['analyzedInstructions'].isNotEmpty
                ? recipe['analyzedInstructions'][0]['steps']
                : [])
              Text('${step['number']}. ${step['step']}'),
          ],
        ),
      ),
    );
  }
}
