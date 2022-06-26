import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app_data.dart';
import '../constant/constants.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Text('Search For Some Food'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Tap on search button',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<Meal> showResultofCountries = mealList;

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        )
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: TextStyle(fontSize: 25),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Meal> suggestions = showResultofCountries.where((searchResult) {
      final result = searchResult.title.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          return MealItem(
              title: suggestion.title,
              image: suggestion.imageUrl,
              description: suggestion.description,
              id: suggestion.id);
        });
  }
}
