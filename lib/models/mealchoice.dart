// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class MealChoiche extends ChangeNotifier {
  //Initialize list of choosen recipes

  //The structure will be something like this:

  /*
  Map chosen = {
    'BREAKFAST': {
        'breakfast' : [breakfast1id, breakfast2id,...],
    },
    'LUNCH': {
        'main1' : [LUNCH_main1_recipe3id, LUNCH_main1_recipe4id,...],
        'main2' : [LUNCH_main2_recipe5id, ...],
        'side' : [LUNCH_side_recipe5id,...],
        'dessert' : [LUNCH_dessert_recipe6id, ...],
    },
    'DINNER': {
        ...
    },
  };
*/

  Map chosen = {
    'BREAKFAST': {
      'breakfast': <dynamic>{}, //this is a Set, to avoid repetitions
    },
    'LUNCH': {
      'main1': <dynamic>{},
      'main2': <dynamic>{},
      'side': <dynamic>{},
      'dessert': <dynamic>{},
    },
    'DINNER': {
      'main1': <dynamic>{},
      'main2': <dynamic>{},
      'side': <dynamic>{},
      'dessert': <dynamic>{},
    },
  };

  void ToogleChosenRecipe(String meal, String course, Map item) {
    // this wants to alternate between inserting the recipe in the chosen Map,
    // and removes it if it is already present
    bool isPresent = chosen[meal.toUpperCase()][course.toLowerCase()].contains(item);
    if (isPresent){
      chosen[meal.toUpperCase()][course.toLowerCase()].remove(item);
    }
    else {chosen[meal.toUpperCase()][course.toLowerCase()].add(item);}

    //Remember to call the CookBook provider when using choose.

    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }

  void clearChosen() {
    chosen = {
      'BREAKFAST': {
        'breakfast': {}, //this is a Set, to avoid repetitions
      },
      'LUNCH': {
        'main1': {},
        'main2': {},
        'side': {},
        'dessert': {},
      },
      'DINNER': {
        'main1': {},
        'main2': {},
        'side': {},
        'dessert': {},
      },
    };

    notifyListeners();
  }

  Set getMealRecipes(String meal, String course, int id) {
    return chosen[meal.toUpperCase()][course.toLowerCase()];
  }

  /*int getAllCalories(){
    int totalCalories = 0;
    for (String meal in chosen){
      for (String course in chosen[meal]){
        for (int i=0; i<chosen[meal][course].length; i++){
          totalCalories += chosen[meal][course]['calories'];
        }
      }
    }
    return totalCalories;
  }*/

  int getAllCalories() {
    num totalCalories = 0;
    chosen.forEach(
      (key, value) {
        value.forEach((key2, value2) {
          for (Map recipe in value2) {
            totalCalories += recipe['calories'];
          }
        });
      },
    );
    if (kDebugMode) {
      print('total calories: $totalCalories');
    }
    return totalCalories.toInt();
  }
} //MealChoice
