import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import './screens/category_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './models/meals.dart';
import 'dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'GlutenFree': false,
    'LactoseFree': false,
    'Vegan': false,
    'Vegetarian': false,
  };
  List<Meal> _avilableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _avilableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['GlutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['LactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['Vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['Vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isFavorite(String id) {
    // this function return true if any meal in _favoriteMeal
    // has the same id as the meal that displayed now
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  void _toggleFavorite(String id) {
    if (!_isFavorite(id)) {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    } else
      setState(() {
        _favoriteMeals.removeWhere((meal) => meal.id == id);
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CategoriesScreen(),
      // ew can make CategoriesScreen the route page without using home :
      // just doing this '/':(ctx)=>CategoriesScreen() in routes
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_avilableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
