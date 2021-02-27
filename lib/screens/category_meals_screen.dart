import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String catId;
  // final String title;
  // CategoryMealsScreen(this.title,this.catId);
  static const routeName = '/categoryMeals';
  List<Meal> avilableMeals;
  CategoryMealsScreen(this.avilableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String catTitle;
  String catId;
  List<Meal> displayedMeal;
  bool loadedInitData = false;
  @override
  Widget build(BuildContext context) {
    if (!loadedInitData) {
      final routeArg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      catTitle = routeArg['title'];
      catId = routeArg['id'];
      displayedMeal = widget.avilableMeals.where((meal) {
        return meal.categories.contains(catId);
      }).toList();
      loadedInitData = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        itemCount: displayedMeal.length,
        itemBuilder: (ctx, index) {
          return MealsItem(
            id: displayedMeal[index].id,
            imageUrl: displayedMeal[index].imageUrl,
            title: displayedMeal[index].title,
            affordability: displayedMeal[index].affordability,
            complexity: displayedMeal[index].complexity,
            duration: displayedMeal[index].duration,
          );
        },
      ),
    );
  }
}
