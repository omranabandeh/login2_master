import 'package:flutter/material.dart';


import '../models/meal.dart';
import '../widget/meal_item.dart';

class MealsScreen extends StatelessWidget {
  static const routeName = 'meals_Screen';
  final List<Meal> availableMeals;
  MealsScreen(this.availableMeals);
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];
    final categoryMeal = availableMeals
        .where(
          (meal) => meal.categories.contains(categoryId!),

        )
        .toList();

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.indigo,
        title: Text(categoryTitle!),

      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeal[index].id,
            title: categoryMeal[index].title,
            image: categoryMeal[index].imageUrl,
            description: categoryMeal[index].description,
          );
        },
        itemCount: categoryMeal.length,
      ),

    );
  }
}


