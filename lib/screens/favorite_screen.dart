import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {


  final List<Meal> favoriteMeal;
  FavoriteScreen(this.favoriteMeal);

  Widget favoriteIf(){
     if(favoriteMeal.isEmpty){
      return Center(child: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Text('you don\'t have any favorite yet !',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
      ));
    } else{
       return ListView.builder(
         itemBuilder: (ctx, index) {
           return MealItem(
             id: favoriteMeal[index].id,
             title: favoriteMeal[index].title,
             image: favoriteMeal[index].imageUrl,
             description: favoriteMeal[index].description,
           );
         },
         itemCount: favoriteMeal.length,
       );
     }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(body: favoriteIf(),);

    }

}
