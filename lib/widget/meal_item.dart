import 'package:flutter/material.dart';

import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String image;

  MealItem({
    required this.title,
    required this.image,
    required this.description,
    required this.id,
  });

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        child: ListTile(
          title: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          subtitle: Text(description,style: TextStyle(fontSize: 15),),
          leading: Container(width: 80,child: Image.network(image,height: 80,fit: BoxFit.cover,)),
          trailing: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
