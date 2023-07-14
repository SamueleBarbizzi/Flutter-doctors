import 'package:flutter_doctors/database/entities/caloriesentity.dart';
import 'package:floor/floor.dart';

@dao
abstract class CaloriesDao {
  @Query('SELECT * FROM CaloriesEntity')
  Future<List<CaloriesEntity>> findAllCalories();

  @insert
  Future<void> insertCalories(CaloriesEntity caloriesEntity);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateCalories(CaloriesEntity caloriesEntity);

  /* @delete
  Future<void> deleteCalories(CaloriesEntity caloriesEntity); */

  /* @Query("DELETE FROM CaloriesEntity WHERE id = ${id}")
  Future<void> deleteAllCaloriesById(int id); */

  @Query("DELETE FROM CaloriesEntity")
  Future<void> deleteAllCalories();
}
