import 'package:flutter_doctors/database/database.dart';
import 'package:flutter_doctors/database/entities/caloriesentity.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier{


  final AppDatabase database;

  DatabaseProvider({required this.database});

  Future<List<CaloriesEntity>> findAllCalories() async{
    final results = await database.caloriesDao.findAllCalories();
    return results;
  }

  Future<void> insertCalories(CaloriesEntity caloriesEntity)async {
    await database.caloriesDao.insertCalories(caloriesEntity);
    notifyListeners();
  }

  Future<void> updateCalories(CaloriesEntity caloriesEntity) async{ 
    await database.caloriesDao.updateCalories(caloriesEntity);
    notifyListeners();
  }

  /* Future<void> deleteCalories(CaloriesEntity caloriesEntity) async{
    await database.caloriesDao.deleteCalories(caloriesEntity);
    notifyListeners();
  } */

  Future<void> deleteAllCalories() async {
    await database.caloriesDao.deleteAllCalories();
    notifyListeners();
  }
  
}