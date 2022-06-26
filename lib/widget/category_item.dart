import 'package:flutter/material.dart';

import '../screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;

  CategoryItem({
    required this.imageUrl,
    required this.title,
    required this.id,
  });

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(45), bottomLeft: Radius.circular(45)),
        ),
        color: Colors.white,
        elevation: 25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(45),
              ),
              child: Image(image: AssetImage(imageUrl),)
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 15,
                bottom: 15,
                left: 25,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'this category Contains all the vgan food',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
