import 'package:flutter/material.dart';

class Favorites extends ChangeNotifier {
  //Initialize list of favorites recipes
  List<Map> favorites = [];

  void toggleFavorite(Map item) {
    // this wants to alternate between favorite and not favorite
    final isExist = favorites.contains(item);
    if (isExist) {
      favorites.remove(item);
    } else {
      favorites.add(item);

      //sort by alphabet order
      favorites.sort((a, b) => a["name"].compareTo(b["name"]));

      //check and delete duplicates
      Set<Map> favoritesSet = favorites.toSet();
      favorites = favoritesSet.toList();
    }
    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }

  void clearFavorite() => favorites = [];

  bool isExist(Map item) {
    final isExist = favorites.contains(item);
    return isExist;
  }

/*
  void addRecipe(Map toAdd){
    //toAdd['isSaved'] = true;
    favorites.add(toAdd);

    //sort the list, to show the content in alphabetic order
    favorites.sort((a, b) => a["name"].compareTo(b["name"]));

    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }//addRecipe

  void deleteRecipe(Map toRemove){
    //toRemove['isSaved'] = false;
    favorites.remove(toRemove);

    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }//deleteRecipe
  
  */
}//Favorites