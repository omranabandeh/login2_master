import 'package:flutter/material.dart';
import '../constant/constants.dart';
import '../models/meal.dart';
import 'category_screen.dart';
import 'drawer_screen.dart';
import 'favorite_screen.dart';

class TabScreen extends StatefulWidget {
  static const routeName = 'tab_screen';
  final List<Meal> favoriteMeal;
  TabScreen(this.favoriteMeal);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: DrawerScreen(favoriteMeal: [],),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(
            'Meals',
          ),
          bottom: TabBar(
            indicatorColor: Colors.orange,
            labelColor: Colors.yellow,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'category',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'favorite',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoryScreen(),
            FavoriteScreen(widget.favoriteMeal),
          ],
        ),
      ),
    );
  }
}
