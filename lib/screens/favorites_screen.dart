import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meals.dart';

class FavoritesScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Center(
        child: Text('no Favorite Meals now'),
      );
    }
    return ListView.builder(
      itemCount: widget.favoriteMeals.length,
      itemBuilder: (ctx, index) {
        return MealsItem(
          id: widget.favoriteMeals[index].id,
          title: widget.favoriteMeals[index].title,
          affordability: widget.favoriteMeals[index].affordability,
          complexity: widget.favoriteMeals[index].complexity,
          duration: widget.favoriteMeals[index].duration,
          imageUrl: widget.favoriteMeals[index].imageUrl,
        );
      },
    );
  }
}
