import 'package:flutter/material.dart';

import '../app_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail_screen';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite,this.isFavorite);

  Widget buildTitle(String text) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        'Food Element',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = mealList.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle('Food Element'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        selectedMeal.foodElements[index],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.foodElements.length,
              ),
            ),
            buildTitle(
              'About',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.indigo.shade400,
        child: Icon(isFavorite(mealId) ? Icons.favorite : Icons.favorite_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
