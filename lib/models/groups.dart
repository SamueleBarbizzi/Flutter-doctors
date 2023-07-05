// ignore_for_file: non_constant_identifier_names

import 'package:flutter_doctors/models/ingredientslist.dart';

class Groups {

  // this class creates the groups in which the ingredients are displayed,
  // based on the course they are used for
  final ingredients = IngredientsList().ingredientslist.sort((a, b) => a["name"].compareTo(b["name"]));

  final List<Map> FirstMainDishIngredients = IngredientsList().ingredientslist
  .where((element) => element['course'] == 'Main1').toList();

  final List<Map> SecondMainDishIngredients = IngredientsList().ingredientslist
  .where((element) => element['course'] == 'Main2').toList();

  final List<Map> SideIngredients = IngredientsList().ingredientslist
  .where((element) => element['course'] == 'Side').toList();

  List<List> createIngredientsGroups(){
    return [FirstMainDishIngredients,SecondMainDishIngredients,SideIngredients];
  }

}