import 'package:flutter/material.dart';
import 'package:login2/screens/search_screen.dart';
import '../app_data.dart';
import '../widget/category_item.dart';
import '../models/category.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemBuilder: (ctx, index) {
          Category category = Category_Data[index];
          return Column(
            children: [
              SizedBox(
                height: 15,
              ),
              CategoryItem(id: category.id,
                imageUrl: category.imageUrl,
                title: category.title,
              ),
            ],
          );
        },
        itemCount: Category_Data.length,
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.search),backgroundColor: Colors.indigo,onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
      },),
    );
  }
}
