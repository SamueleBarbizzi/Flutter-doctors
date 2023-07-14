// ignore_for_file: non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';

class PersonalMeals extends ChangeNotifier {
  //Initialize list of choosen recipes

  Map personalRecipes = {
    'BREAKFAST' : [],
    'LUNCH' : [[], [], [], []],
    'DINNER' : [[], [], [], []],
  };

  void addPersonalRecipe(
      String meal, int indexCourse, String name, int calories) {
    if (meal == 'BREAKFAST') {
      personalRecipes[meal].add({
        'name': name,
        'calories': calories,
        'isSelected': true,
      });
      personalRecipes[meal].sort((a, b) => (a["name"] as String).compareTo(b["name"] as String));
    } else if (meal == 'LUNCH') {
      personalRecipes[meal][indexCourse].add({
        'name': name,
        'calories': calories,
        'isLUNCHSaved': true,
      });
    } else if (meal == 'DINNER') {
      personalRecipes[meal][indexCourse].add({
        'name': name,
        'calories': calories,
        'isDINNERSaved' : true,
      });
      for (int i = 0; i < personalRecipes[meal].length; i++) {
        personalRecipes[meal][indexCourse]
            .sort((a, b) => (a["name"] as String).compareTo(b["name"] as String));
      }
    }
    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }

  Map getPersonalRecipe(String meal, int indexCourse, int indexRecipe, bool last) {
    if (meal == 'BREAKFAST') {
      if (last){return personalRecipes[meal].last;}
      else{return personalRecipes[meal][indexRecipe];}
    } else{
      if (last){return personalRecipes[meal][indexCourse].last;}
      else{return personalRecipes[meal][indexCourse][indexRecipe];}
    }
  }

  void removePersonalRecipe(String meal, int indexCourse, int indexRecipe) {
    if (meal == 'BREAKFAST') {
      personalRecipes[meal].removeAt(indexRecipe);
    } else if (meal == 'LUNCH' || meal == 'DINNER') {
      personalRecipes[meal][indexCourse].removeAt(indexRecipe);
    }
    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }

}//PersonalMeals