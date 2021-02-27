import 'package:flutter/foundation.dart';

enum Complexity {
  Simple, //zero = simle
  Challenging, // 1 = chalenging
  Hard // 2 = hard
}
enum Affordability {
  Affordable, //ma3kool
  Pricey, //very expensive
  Luxurious, // fakher
}

class Meal {
  final String id;
  final List<String> categories; //meal mybe part of one or more category
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
