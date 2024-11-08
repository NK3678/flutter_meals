import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void _showMealDetail(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return MealDetailScreen(meal: meal);
    }));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('No meals found, please check your filters',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface)),
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (context, index) => MealItem(
            meal: meals[index],
            onSelectMeal: () => _showMealDetail(context, meals[index])),
        itemCount: meals.length,
      );
    }
    if (title != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      );
    } else {
      return content;
    }
  }
}
