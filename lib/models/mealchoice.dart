// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

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
        'breakfast' : <dynamic>{}, //this is a Set, to avoid repetitions
    },
    'LUNCH': {
        'main1' : <dynamic>{},
        'main2' : <dynamic>{},
        'side' : <dynamic>{},
        'dessert' : <dynamic>{},
    },
    'DINNER': {
        'main1' : <dynamic>{},
        'main2' : <dynamic>{},
        'side' : <dynamic>{},
        'dessert' : <dynamic>{},
    },
  };



  void ChooseRecipe(String meal, String course, Map item) {
    // this wants to alternate between inserting the recipe in the chosen Map,
    // and removes it if it is already present 

    chosen[meal.toUpperCase()][course.toLowerCase()].add(item);
    //Remember to call the CookBook provider when using choose.

    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }

  void RemoveRecipe(String meal, String course, Map item) {
      chosen[meal.toUpperCase()][course.toLowerCase()].remove(item);

    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }

  void clearChosen() {
    chosen = {
    'BREAKFAST': {
        'breakfast' : {}, //this is a Set, to avoid repetitions
    },
    'LUNCH': {
        'main1' : {},
        'main2' : {},
        'side' : {},
        'dessert' : {},
    },
    'DINNER': {
        'main1' : {},
        'main2' : {},
        'side' : {},
        'dessert' : {},
    },
  };

    notifyListeners();
  }

  Set getMealRecipes(String meal, String course, int id) {
    return chosen[meal.toUpperCase()][course.toLowerCase()];
  }

}//MealChoice
