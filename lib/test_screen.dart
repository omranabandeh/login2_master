// import 'package:flutter/material.dart';
// import 'package:nutrition/models/meal.dart';
// import 'package:nutrition/screens/tab_screen.dart';
//
// class TestScreen extends StatefulWidget {
//   final List<Meal> favoriteMeal;
//   const TestScreen(List<Meal> favoraiteMeals, {Key? key,required this.favoriteMeal}) : super(key: key);
//
//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }
//
// class _TestScreenState extends State<TestScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('new screen'),
//       ),
//       body: Center(
//         child: RaisedButton(child: Text('log in',style: TextStyle(fontSize: 25,),),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TabScreen(widget.favoriteMeal)));},),
//       ),
//     );
//   }
// }
