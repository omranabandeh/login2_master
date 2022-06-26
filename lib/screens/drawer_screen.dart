import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login2/screens/signin_screen.dart';
import '../models/meal.dart';
import 'calories_calculator_screen.dart';
import 'filter_screen.dart';

class DrawerScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

  DrawerScreen({
    required this.favoriteMeal,
  });

  @override
  var currentUser = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'user email',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              '${FirebaseAuth.instance.currentUser!.email}',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://www.pinclipart.com/picdir/big/95-958614_man-icon-person-logo-png-clipart.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                image: NetworkImage(
                  'https://previews.123rf.com/images/romastudio/romastudio1603/romastudio160300203/54088672-healthy-food-background-studio-photo-of-different-fruits-and-vegetables-on-white-wooden-table-high-r.jpg?fj=1',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('signup & signin'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignInScreen(favoriteMeal,
                          favoriteMeal: favoriteMeal)));
            },
          ),
          ListTile(
            leading: Icon(Icons.filter),
            title: Text('Filters'),
            onTap: () {
              Navigator.of(context).pushNamed(FilterScreen.routerName);
            },
          ),

          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Daily Need Calculator'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DailyNeedCalculator()));
            },
          ),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignInScreen(favoriteMeal,
                          favoriteMeal: favoriteMeal)));
            },
          )
        ],
      ),
    );
  }
}
