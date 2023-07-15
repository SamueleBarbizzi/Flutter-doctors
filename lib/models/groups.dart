// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_doctors/models/cookbook.dart';
import 'package:flutter_doctors/models/ingredientslist.dart';
import 'package:provider/provider.dart';

class Groups extends ChangeNotifier{
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
  List createBreakfastDishes(BuildContext context) {

    Provider.of<CookBook>(context, listen: false).loadCookbookStatus();

    return Provider.of<CookBook>(context, listen: false)
        .recipeslist
        .where((element) => element['course'].contains('Breakfast'))
        .toList();
  }

  List createFirstMainDishes(BuildContext context) {

    Provider.of<CookBook>(context, listen: false).loadCookbookStatus();

    return Provider.of<CookBook>(context, listen: false)
        .recipeslist
        .where((element) => element['course'].contains('Main1'))
        .toList();
  }

  List createSecondMainDishes(BuildContext context) {

    Provider.of<CookBook>(context, listen: false).loadCookbookStatus();

    return Provider.of<CookBook>(context, listen: false)
        .recipeslist
        .where((element) => element['course'].contains('Main2'))
        .toList();
  }

  List createSideDishes(BuildContext context) {

    Provider.of<CookBook>(context, listen: false).loadCookbookStatus();

    return Provider.of<CookBook>(context, listen: false)
        .recipeslist
        .where((element) => element['course'].contains('Side'))
        .toList();
  }

  List createDessertDishes(BuildContext context) {

    Provider.of<CookBook>(context, listen: false).loadCookbookStatus();

    return Provider.of<CookBook>(context, listen: false)
        .recipeslist
        .where((element) => element['course'].contains('Dessert'))
        .toList();
  }
}