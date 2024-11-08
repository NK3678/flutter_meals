import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredients',
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).colorScheme.primary),
            ),
            meal.ingredients.isEmpty
                ? const SizedBox(height: 20)
                : Column(
                    children: meal.ingredients
                        .map((ingredient) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                ingredient,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                              ),
                            ))
                        .toList(),
                  ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Steps',
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).colorScheme.primary),
            ),
            meal.steps.isEmpty
                ? const SizedBox(height: 20)
                : Column(
                    children: meal.steps
                        .asMap()
                        .entries
                        .map((entry) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              child: Text(
                                entry.value,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                              ),
                            ))
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
