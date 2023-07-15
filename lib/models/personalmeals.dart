// ignore_for_file: non_constant_identifier_names, unused_element

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalMeals extends ChangeNotifier {
  //Initialize list of choosen recipes


  Future<void> savePersonalMealsStatus() async {
    final personalMealsStatus = await SharedPreferences.getInstance();
      String encodedPersonalMeals = json.encode(personalRecipes);
      await personalMealsStatus.setString('personalRecipes', encodedPersonalMeals);
  }

  Future<void> loadPersonalMealsStatus() async {
    final personalMealsStatus = await SharedPreferences.getInstance();
    if (personalMealsStatus.getString('personalRecipes') != null)
      { String encodedPersonalMeals = personalMealsStatus.getString('personalRecipes')!;
      personalRecipes = json.decode(encodedPersonalMeals);}
  }

  Future<void> clearPersonalMealsStatus() async {
    final personalMealsStatus = await SharedPreferences.getInstance();
    await personalMealsStatus.remove('personalRecipes');
  }

  
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
    savePersonalMealsStatus();
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
    savePersonalMealsStatus();
    notifyListeners();
  }

void togglePersonalRecipe(String meal, String name) {
  if (meal == 'BREAKFAST'){
    int ind = personalRecipes[meal].indexWhere((element) => element['name'] == name);

    final isSelected = personalRecipes[meal][ind]['isSelected'];
    if (isSelected) {
      personalRecipes[meal][ind]['isSelected'] = false;
    } else {
      personalRecipes[meal][ind]['isSelected'] = true;
    }
  }
  else {
    loop:
    for (int index=0; index<personalRecipes[meal].length; index++){
      int ind = personalRecipes[meal][index].indexWhere((element) => element['name'] == name);
      if(ind != -1){
        final isSelected = personalRecipes[meal][index][ind]['isSelected'];
        if (isSelected) {
          personalRecipes[meal][index][ind]['isSelected'] = false;
        } else {
          personalRecipes[meal][index][ind]['isSelected'] = true;
        }
        break loop;
      }
    }
    
  }
    

    //Call the notifyListeners() method to alert that something happened.
    savePersonalMealsStatus();
    notifyListeners();
  }

}//PersonalMeals

