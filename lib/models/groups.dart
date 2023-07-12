// ignore_for_file: non_constant_identifier_names

import 'package:flutter_doctors/models/cookbook.dart';
import 'package:flutter_doctors/models/ingredientslist.dart';

class Groups {
  // here we creates the groups in which the ingredients are displayed,
  // based on the course they are used for
  final List<Map> BreakfastIngredients = IngredientsList()
      .ingredientslist
      .where((element) => element['course'].contains('Breakfast'))
      .toList();

  final List<Map> FirstMainDishIngredients = IngredientsList()
      .ingredientslist
      .where((element) => element['course'].contains('Main1'))
      .toList();

  final List<Map> SecondMainDishIngredients = IngredientsList()
      .ingredientslist
      .where((element) => element['course'].contains('Main2'))
      .toList();

  final List<Map> SideIngredients = IngredientsList()
      .ingredientslist
      .where((element) => element['course'].contains('Side'))
      .toList();

  final List<Map> DessertIngredients = IngredientsList()
      .ingredientslist
      .where((element) => element['course'].contains('Dessert'))
      .toList();

  List<List> createIngredientsGroups() {
    return [
      FirstMainDishIngredients,
      SecondMainDishIngredients,
      SideIngredients,
      DessertIngredients
    ];
  }

  // here we creates the groups in which the recipes are displayed,
  // based on the course  in which they are used

  final List<Map> BreakfastDishes = CookBook()
      .recipeslist
      .where((element) => element['course'].contains('Breakfast'))
      .toList();

  final List<Map> FirstMainDishes = CookBook()
      .recipeslist
      .where((element) => element['course'].contains('Main1'))
      .toList();

  final List<Map> SecondMainDishes = CookBook()
      .recipeslist
      .where((element) => element['course'].contains('Main2'))
      .toList();

  final List<Map> SideDishes = CookBook()
      .recipeslist
      .where((element) => element['course'].contains('Side'))
      .toList();

  final List<Map> DessertDishes = CookBook()
      .recipeslist
      .where((element) => element['course'].contains('Dessert'))
      .toList();

  List<List> createDishesGroups() {
    return [FirstMainDishes, SecondMainDishes, SideDishes, DessertDishes];
  }

  List getBreakfastDishes() {
    return BreakfastDishes;
  }

  List getDessertDishes() {
    return DessertDishes;
  }

/*
  // here we creates the groups in which the personal recipes are displayed,
  // based on the course  in which they are used

    final List<Map> BreakfastPersonal = CookBook().recipeslist
  .where((element) => element['course'].contains('Breakfast')).toList();

  final List<Map> FirstMainPersonal = CookBook().recipeslist
  .where((element) => element['course'].contains('Main1')).toList();

  final List<Map> SecondMainPersonal = CookBook().recipeslist
  .where((element) => element['course'].contains('Main2')).toList();

  final List<Map> SidePersonal = CookBook().recipeslist
  .where((element) => element['course'].contains('Side')).toList();

  final List<Map> DessertPersonal = CookBook().recipeslist
  .where((element) => element['course'].contains('Dessert')).toList();

  List<List> createPersonalGroups(){
    return [FirstMainPersonal,SecondMainPersonal,SidePersonal,DessertPersonal];
  }
*/
}
