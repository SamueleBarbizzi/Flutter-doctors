import 'package:flutter/material.dart';

class MealChoiche extends ChangeNotifier{

  //Initialize list of choosen recipes
  Map chosen = {

    'BREAKFAST': {},
    'LUNCH_main1': {},
    'LUNCH_main2': {},
    'LUNCH_side': {},
    'LUNCH_dessert': {},
    'DINNER_main1': {},
    'DINNER_main2': {},
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

    'BREAKFAST': {},
    'LUNCH_main1': {},
    'LUNCH_main2': {},
    'LUNCH_side': {},
    'LUNCH_dessert': {},
    'DINNER_main1': {},
    'DINNER_main2': {},
    'DINNER_side': {},
    'DINNER_dessert': {},

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