// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MealChoiche extends ChangeNotifier {
  //Initialize list of choosen recipes
  Map chosen = {};

  //The structure will be something like this:
  /*
  Map chosen = {
    'BREAKFAST_recipe1id' = {recipe1},
    'LUNCH_main1_recipe2id' = {recipe2},
    'LUNCH_main1_recipe3id' = {recipe3},
    'LUNCH_main2_recipe4id' = {recipe4},
    'LUNCH_side_recipe5id' = {recipe5},
    'LUNCH_dessert_recipe6id' = {recipe6},
    'DINNER_main1_recipe7id' = {recipe7},
    'DINNER_main2_recipe8id' = {recipe8},
    'DINNER_main1_recipe9id' = {recipe9},
    'DINNER_side_recipe10id' = {recipe10},
    'DINNER_dessert_recipe11id' = {recipe11},
  };
  */

  void ChooseAndReplace(String dish, Map item) {
    // this wants to alternate between inserting the recipe in the chosen Map,
    // and removes it if it is already present 
    final isPresent = chosen.containsKey(dish);

    if (isPresent){
      chosen.remove(dish);
    }
    else{
      chosen[dish] = item;
    }


    
    //Remember to call the CookBook provider when using choose.

    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }

  void RemoveRecipe(String dish, Map item) {
      chosen[dish] = {};

    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }

  void clearChosen() {
    chosen = {};
    notifyListeners();
  }

  Map getRecipe(String meal, String course) {
    return chosen['${meal.toUpperCase()}_${course.toLowerCase()}'];
  }

  Map getChosenRecipes() {
    return chosen;
  }
}//MealChoice