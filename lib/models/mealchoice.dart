import 'package:flutter/material.dart';

class MealChoiche extends ChangeNotifier{

  //Initialize list of choosen recipes
  Map chosen = {

    'BREAKFAST': {},
    'LAUNCH_meal1': {},
    'LAUNCH_meal2': {},
    'LAUNCH_side': {},
    'LAUNCH_dessert': {},
    'DINNER_meal1': {},
    'DINNER_meal2': {},
    'DINNER_side': {},
    'DINNER_dessert': {},

  };

  void ChooseAndReplace(String dish, Map item){
    // this wants to alternate between inserting the recipe in the chosen map, or delete it,
    // or substitute the actual chosen recipe
    final isExist = chosen[dish].contains(item);
    if(isExist){
      chosen[dish] = {};
    }
    else{
      chosen[dish] = item;
    }

    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }

  void clearFavorite() =>   chosen = {

    'Breakfast': {},
    'LAUNCH_Meal1': {},
    'LAUNCH_Meal2': {},
    'LAUNCH_Side': {},
    'LAUNCH_Dessert': {},
    'DINNER_Meal1': {},
    'DINNER_Meal2': {},
    'DINNER_Side': {},
    'DINNER_Dessert': {},

  };

  bool isExist(String dish, Map item){
    final isExist = chosen[dish].contains(item);
    return isExist;
  }

  Map getBreakfast(){
    return chosen['BREAKFAST'];
  }

  Map getRecipe(String meal, String course){
    return chosen[meal.toUpperCase()+'_'+course.toLowerCase()];
  }

}//Favorites