import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login2/screens/filter_screen.dart';
import 'package:login2/screens/meal_detail_screen.dart';
import 'package:login2/screens/meals_screen.dart';
import 'package:login2/screens/signin_screen.dart';
import 'package:login2/screens/tab_screen.dart';
import 'package:login2/test_screen.dart';
import 'app_data.dart';
import 'models/meal.dart';
import 'screens/category_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filtersList = {
    'suger': false,
    'Pressure disease' :false,
    'Kidney patients' : false,
    'Gout' : false,
  };
  List<Meal> availableMeals = mealList;
  List <Meal> _favoraiteMeals = [];

  void _setFilters(Map<String, bool> filtersData) {
    setState(() {
      _filtersList = filtersData;

      availableMeals = mealList.where((meal) {
        if (_filtersList['suger']! && !meal.sugarFree) {
          return false;
        }
        if (_filtersList['Pressure disease']! && !meal.pressure_disease) {
          return false;
        }if (_filtersList['Kidney patients']! && !meal.kidney_patients) {
          return false;
        }if (_filtersList['Gout']! && !meal.gout) {
          return false;
        }
        return true;
      }).toList();
    });
  }
  void _toggleFavorite(String mealId){
    final existingIndex = _favoraiteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _favoraiteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favoraiteMeals.add(mealList.firstWhere((meal) => meal.id == mealId));
      });
    }
  }
  bool _isMealFavorite(String id){
    return _favoraiteMeals.any((meal) => meal.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,color: Colors.indigo,
      title: 'Nutrition',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //'/' : (ctx) => TabScreen(_favoraiteMeals),
      initialRoute: '/',
      routes: {
       // '/': (ctx) => SignInScreen(_favoraiteMeals, favoriteMeal: [],),
       //  TabScreen.routeName:(ctx)=>TabScreen(_favoraiteMeals),
        '/' : (ctx) => TabScreen(_favoraiteMeals),
        MealsScreen.routeName:(ctx) => MealsScreen(availableMeals),
        MealDetailScreen.routeName:(ctx) =>MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FilterScreen.routerName:(ctx)=>FilterScreen(_setFilters),
      },
    );
  }
}
