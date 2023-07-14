// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
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

  Map personalRecipes = {
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

  List<Map> snacks = [];

  void addSnack(String name, int calories) {
    snacks.add({
      'name': name,
      'calories': calories,
      'isSelected': true,
    });
  }

  void removeSnack(String name) {
    snacks.removeWhere((element) => element['name'] == name);
  }

  void ToogleChosenRecipe(String meal, String course, Map item) {
    // this wants to alternate between inserting the recipe in the chosen Map,
    // and removes it if it is already present
    bool isPresent =
        chosen[meal.toUpperCase()][course.toLowerCase()].contains(item);
    if (isPresent) {
      chosen[meal.toUpperCase()][course.toLowerCase()].remove(item);
    } else {
      chosen[meal.toUpperCase()][course.toLowerCase()].add(item);
    }

    //Remember to call the CookBook provider when using choose.

    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }

  void findAndRemovePersonalRecipe(String name) {
    for (String meal in ['BREAKFAST','LUNCH','DINNER']) {
      for (String course in personalRecipes[meal].keys) {
        bool isPresent = personalRecipes[meal][course]
            .where((element) => element['name'] == name).isNotEmpty;
        if (isPresent){
          personalRecipes[meal][course].remove(personalRecipes[meal][course]
            .where((element) => element['name'] == name));
          break;
        }
        else{continue;}
      }
    }

    notifyListeners();
  }

  void removeChosenRecipe(String meal, String course, Map item) {
    bool isPresent = personalRecipes[meal.toUpperCase()][course.toLowerCase()]
        .contains(item);
    if (isPresent) {
      chosen[meal.toUpperCase()][course.toLowerCase()].remove(item);
    }
  }

  void addPersonalRecipe(String meal, String course, Map item) {
    personalRecipes[meal.toUpperCase()][course.toLowerCase()].add(item);

    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }

  void removePersonalRecipe(String meal, String course, Map item) {
    bool isPresent = personalRecipes[meal.toUpperCase()][course.toLowerCase()]
        .contains(item);
    if (isPresent) {
      personalRecipes[meal.toUpperCase()][course.toLowerCase()].remove(item);
    }

    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }

  void TooglePersonalRecipe(String meal, String course, Map item) {
    // this wants to alternate between inserting the recipe in the chosen Map,
    // and removes it if it is already present
    bool isPresent = personalRecipes[meal.toUpperCase()][course.toLowerCase()]
        .contains(item);
    if (isPresent) {
      personalRecipes[meal.toUpperCase()][course.toLowerCase()].remove(item);
    } else {
      personalRecipes[meal.toUpperCase()][course.toLowerCase()].add(item);
    }

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

  void clearPersonalRecipes() {
    personalRecipes = {
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

  Set getMealRecipes(String meal, String course) {
    return chosen[meal.toUpperCase()][course.toLowerCase()];
  }

  Map getChosenRecipe(String meal, String course, int id) {
    return chosen[meal.toUpperCase()][course.toLowerCase()]
        .where((element) => element['id'] == id);
  }

  Map getPersonalRecipe(String meal, String course, int id) {
    return personalRecipes[meal.toUpperCase()][course.toLowerCase()]
        .where((element) => element['id'] == id);
  }

  int getAllChosenCalories() {
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

  int getAllPersonalCalories() {
    num totalCalories = 0;
    personalRecipes.forEach(
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

  int getAllSnackCalories() {
    num totalCalories = 0;

    for (Map element in snacks) {
      totalCalories += element['calories'];
    }

    if (kDebugMode) {
      print('total calories: $totalCalories');
    }
    return totalCalories.toInt();
  }

  int getAllCalories() {
    return getAllChosenCalories() +
        getAllPersonalCalories() +
        getAllSnackCalories();
  }
} //MealChoice