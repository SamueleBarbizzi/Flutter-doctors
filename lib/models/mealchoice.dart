// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MealChoiche extends ChangeNotifier{

  //Initialize list of choosen recipes
  Map chosen = {};

  //The structure will be something like this:
  /*
  Map chosen = {
    'BREAKFAST_1' = {recipe1},
    'LUNCH_main1_1' = {recipe2},
    'LUNCH_main1_2' = {recipe3},
    'LUNCH_main2_1' = {recipe4},
    'LUNCH_side_1' = {recipe5},
    'LUNCH_dessert_1' = {recipe6},
    'DINNER_main1_1' = {recipe7},
    'DINNER_main2_1' = {recipe8},
    'DINNER_main1_2' = {recipe9},
    'DINNER_side_1' = {recipe10},
    'DINNER_dessert_1' = {recipe11},
  };
  */

  void ChooseAndReplace(String dish, Map item){
    // this wants to alternate between inserting the recipe in the chosen Map,
    // or substitute the actual chosen recipe, or either delete it

    final isExist = chosen.containsKey(dish);

    if(isExist){
      final recipeExist = chosen[dish].contains(item);
      if(recipeExist){chosen[dish] = {};}
      else{chosen[dish] = item;}
    }
    else{chosen[dish] = item;}

    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }

  void clearChosen(){chosen = {};notifyListeners();}

  Map getRecipe(String meal, String course){
    return chosen['${meal.toUpperCase()}_${course.toLowerCase()}'];
  }

  Map getChosenRecipes(){
    return chosen;
  }


}//MealChoice