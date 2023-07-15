// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> saveMeals() async {
    final savedMeals = await SharedPreferences.getInstance();
      String encodedChosenMeals = json.encode(chosen);
      String encodedPersonalMeals = json.encode(personalRecipes);
      String encodedSnacks = json.encode(snacks);
      await savedMeals.setString('chosenMeals', encodedChosenMeals);
      await savedMeals.setString('personalMeals', encodedPersonalMeals);
      await savedMeals.setString('snacks', encodedSnacks);
  }

  Future<void> loadMeals() async {
    final savedMeals = await SharedPreferences.getInstance();

      if (savedMeals.getString('chosenMeals') != null)
      { String encodedChosenMeals = savedMeals.getString('chosenMeals')!;
        chosen = json.decode(encodedChosenMeals);}

      if (savedMeals.getString('personalMeals') != null)
      { String encodedPersonalMeals = savedMeals.getString('personalMeals')!;
        personalRecipes = json.decode(encodedPersonalMeals);}

      if (savedMeals.getString('snacks') != null)
      { String encodedSnacks = savedMeals.getString('snacks')!;
        snacks = json.decode(encodedSnacks);}

  }

  Future<void> clearMeals() async {
    final savedMeals = await SharedPreferences.getInstance();
      await savedMeals.remove('chosenMeals');
      await savedMeals.remove('personalMeals');
      await savedMeals.remove('snacks');
  }


  Map chosen = {
    'BREAKFAST': {
      'breakfast': [], //this is a Set, to avoid repetitions
    },
    'LUNCH': {
      'main1': [],
      'main2': [],
      'side': [],
      'dessert': [],
    },
    'DINNER': {
      'main1': [],
      'main2': [],
      'side': [],
      'dessert': [],
    },
  };

  Map personalRecipes = {
    'BREAKFAST': {
      'breakfast': [], //this is a Set, to avoid repetitions
    },
    'LUNCH': {
      'main1': [],
      'main2': [],
      'side': [],
      'dessert': [],
    },
    'DINNER': {
      'main1': [],
      'main2': [],
      'side': [],
      'dessert': [],
    },
  };

  List snacks = [];

  void addSnack(String name, int calories) {
    snacks.add({
      'name': name,
      'calories': calories,
      'isSelected': true,
    });

    snacks.toSet().toList();

    saveMeals();
    notifyListeners();
  }

  void removeSnack(String name) {
    snacks.removeWhere((element) => element['name'] == name);

    saveMeals();
    notifyListeners();
  }

  void clearSnacks(){
    snacks = [];

    saveMeals();
    notifyListeners();
  }

  void ToogleChosenRecipe(String meal, String course, Map item) {
    // this wants to alternate between inserting the recipe in the chosen Map,
    // and removes it if it is already present
    int id = item['id'];
    int ind = chosen[meal][course].indexWhere((element) => element['id'] == id);
        if (ind != -1) {
          Map item = chosen[meal.toUpperCase()][course.toLowerCase()].elementAt(ind);
          chosen[meal.toUpperCase()][course.toLowerCase()].remove(item);
        }
        else{
      chosen[meal][course].add(item);
    }

    chosen[meal][course].toSet().toList();

    //Call the notifyListeners() method to alert that something happened.
    saveMeals();
    notifyListeners();
  }

  void findAndRemovePersonalRecipe(String name) {
    loop:
    for (String meal in ['BREAKFAST', 'LUNCH', 'DINNER']) {
      for (String course in personalRecipes[meal].keys) {
        int ind = personalRecipes[meal][course].indexWhere((element) => element['name'] == name);
        if (ind != -1) {
          Map item = personalRecipes[meal][course].elementAt(ind);
          personalRecipes[meal][course].remove(item);
          break loop;
        }
      }
    }
    saveMeals();
    notifyListeners();
  }

    void findAndRemoveChosenRecipe(String name) {
      loop:
      for (String meal in ['BREAKFAST', 'LUNCH', 'DINNER']) {
        for (String course in chosen[meal].keys) {
          List temp = chosen[meal][course].toList();
          int ind = temp.indexWhere((element) => element['name'] == name);
          if (ind != -1) {
            Map item = chosen[meal][course].elementAt(ind);
            chosen[meal][course].remove(item);
            break loop;
          }
        }
      }
      saveMeals();
      notifyListeners();
    }

  void addPersonalRecipe(String meal, String course, Map item) {
    personalRecipes[meal.toUpperCase()][course.toLowerCase()].add(item);

    //Call the notifyListeners() method to alert that something happened.
    saveMeals();
    notifyListeners();
  }

  void removePersonalRecipe(String meal, String course, Map item) {
    bool isPresent = personalRecipes[meal.toUpperCase()][course.toLowerCase()]
        .contains(item);
    if (isPresent) {
      personalRecipes[meal.toUpperCase()][course.toLowerCase()].remove(item);
    }

    //Call the notifyListeners() method to alert that something happened.
    saveMeals();
    notifyListeners();
  }

  void TooglePersonalRecipe(String meal, String course, Map item) {
    // this wants to alternate between inserting the recipe in the chosen Map,
    // and removes it if it is already present
    String name = item['name'];
    int ind = personalRecipes[meal][course].indexWhere((element) => element['name'] == name);
        if (ind != -1) {
          Map item = personalRecipes[meal.toUpperCase()][course.toLowerCase()].elementAt(ind);
          personalRecipes[meal.toUpperCase()][course.toLowerCase()].remove(item);
        }
        else{
      personalRecipes[meal][course].add(item);
    }

    personalRecipes[meal][course].toSet().toList();

    //Call the notifyListeners() method to alert that something happened.
    saveMeals();
    notifyListeners();
  }

  void clearChosen() {
    chosen = {
      'BREAKFAST': {
        'breakfast': [], //this is a Set, to avoid repetitions
      },
      'LUNCH': {
        'main1': [],
        'main2': [],
        'side': [],
        'dessert': [],
      },
      'DINNER': {
        'main1': [],
        'main2': [],
        'side': [],
        'dessert': [],
      },
    };

    saveMeals();
    notifyListeners();
  }

  void clearPersonalRecipes() {
    personalRecipes = {
      'BREAKFAST': {
        'breakfast': [], //this is a Set, to avoid repetitions
      },
      'LUNCH': {
        'main1': [],
        'main2': [],
        'side': [],
        'dessert': [],
      },
      'DINNER': {
        'main1': [],
        'main2': [],
        'side': [],
        'dessert': [],
      },
    };

    saveMeals();
    notifyListeners();
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