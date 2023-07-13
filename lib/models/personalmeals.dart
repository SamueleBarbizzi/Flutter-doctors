// ignore_for_file: non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';

class PersonalMeals extends ChangeNotifier {
  //Initialize list of choosen recipes

  List<List> personalRecipes = [[], [], [], []];
  List<Map> snacks = [];

  void addPersonalRecipe(int indexMeal, String name, int calories) {
    personalRecipes[indexMeal].add({
      'name': name,
      'calories': calories,
      'isSelected': false,
      'isLUNCHSaved': false,
      'isDINNERSaved': false,
    });
    for (int i = 0; i < personalRecipes.length; i++) {
      personalRecipes[indexMeal].sort((a, b) => a["name"].compareTo(b["name"]));
    }
    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }

  Map getPersonalRecipe(int indexMeal, int indexCourse) {
    return personalRecipes[indexMeal][indexCourse];
  }

  void removePersonalRecipe(int indexMeal, int indexCourse) {
    personalRecipes[indexMeal].removeAt(indexCourse);

    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }  

  void addSnack(String name, int calories) {
    snacks.add({
      'name': name,
      'calories': calories,
      'isSelected': false,
    });
  }

  void removeSnack(String name) {
    snacks.removeWhere((element) => element['name'] == name);
  }

  int getAllCalories() {
    num totalCalories = 0;
    for (var personalRecipesOfMeal in personalRecipes) {
      for (var recipe in personalRecipesOfMeal) {
        totalCalories += recipe['calories'];
      }
    }
    for (var snack in snacks) {
      totalCalories += snack['calories'];
    }
    return totalCalories.toInt();
  }
}//PersonalMeals