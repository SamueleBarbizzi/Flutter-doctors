// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_doctors/models/mealchoice.dart';
import 'package:flutter_doctors/models/personalmeals.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';
import 'package:flutter_doctors/screens/ingredientspage.dart';
import 'package:flutter_doctors/screens/recipepage.dart';
import 'package:flutter_doctors/models/favorites.dart';
import 'package:flutter_doctors/models/cookbook.dart';
import 'package:flutter_doctors/models/groups.dart';
import 'package:provider/provider.dart';

class BreakfastChoicePage extends StatefulWidget {
  const BreakfastChoicePage({
    Key? key,
    required this.firstDatabaseEntry,
  }) : super(key: key);

  final bool firstDatabaseEntry;

  static const routename = 'BreakfastChoicePage';

  @override
  _BreakfastChoicePageState createState() => _BreakfastChoicePageState();
}

class _BreakfastChoicePageState extends State<BreakfastChoicePage> {
  //List of recipes

  // This controller will store the value of the search bar
  // TextEditingController editingController = TextEditingController();
  List recipes = [];
  List chosen = []; // list of the selected recipes

  @override
  void initState() {
    final recipes = Groups().createBreakfastDishes(context);
    recipes.sort((a, b) => a["name"].compareTo(b["name"]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('${BreakfastChoicePage.routename} built');
    final recipes = Groups().createBreakfastDishes(context);
    recipes.sort((a, b) => a["name"].compareTo(b["name"]));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //back to MainNavigator, saving the coiches
          _Done(context);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.done),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(BreakfastChoicePage.routename),
        leading: BackButton(
          onPressed: () => _toMainNavigator(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Home',
            onPressed: () => _toMainNavigator(context),
          ),
        ],
      ),
      body:
          ListView.builder(
        shrinkWrap: true,
        itemCount: recipes.length,
        itemBuilder: (BuildContext ctx, index) {
          return Card(
            key: ValueKey(recipes[index]['name']),
            margin: const EdgeInsets.all(1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

            // The color depends on this is selected or not
            color: recipes[index]['isSelected'] == true
                ? Colors.lightGreen
                : Colors.white,
            child: ListTile(
              onTap: () {
                // if this item isn't selected yet, "isSelected": false -> true
                // If this item already is selected: "isSelected": true -> false
                setState(() {
                  recipes[index]['isSelected'] = !recipes[index]['isSelected'];
                });
              },

              //leading: CircleAvatar(
              //    backgroundColor: Colors.green,
              //    child: Text(possibleRecipes[index]['id'].toString())),
              title: Text(recipes[index]['name']),
              subtitle: Text('     ${recipes[index]['calories']} kcals'),
            ),
          );
        },
      ),
    );
  } //build

  void _toMainNavigator(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MainNavigator(
              flag: false,
              firstDatabaseEntry: widget.firstDatabaseEntry,
            )));
  } //_toMainNavigator

  void _Done(BuildContext context) {
    chosen = recipes.where((item) => item['isSelected'] == true).toList();

    String meal = 'BREAKFAST';

    for (int i = 0; i < chosen.length; i++) {
      int id = (chosen[i]['id']);
      Map item = chosen[i];

      Provider.of<MealChoiche>(context, listen: false).ChooseRecipe(meal.toUpperCase(), 'breakfast' , item);
      Provider.of<CookBook>(context, listen: false).toggleRecipe(id);

    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MainNavigator(
          flag: false,
          firstDatabaseEntry: widget.firstDatabaseEntry,
        ),
      ),
    );
  } //_Done
} //BreakfastChoicePage