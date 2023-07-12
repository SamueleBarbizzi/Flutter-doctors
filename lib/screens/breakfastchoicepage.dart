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
  final List recipes = Groups().getBreakfastDishes();

  // This controller will store the value of the search bar
  // TextEditingController editingController = TextEditingController();

  List chosen = []; // list of the selected recipes

  @override
  void initState() {
    recipes.sort((a, b) => a["name"].compareTo(b["name"]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('${BreakfastChoicePage.routename} built');
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
          /*
            Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                    onChanged: (value) {
                      _filterSearchResults(value);
                    },
                      controller: editingController,
                      decoration: InputDecoration(
                          labelText: "Search",
                          hintText: "Name of the recipe...",
                          prefixIcon: const Icon(Icons.search),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear, color: Colors.black,),
                            onPressed: () {
                              editingController.clear();
                              _filterSearchResults('');
                              }),    
                            ),
                    ),
                  ), */
          ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
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

  /*
  void _filterSearchResults(String query) {
  setState(() {
    possibleRecipes = possibleRecipes
        .where((item) => item['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();
    });
  }
  */

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
      String dish = '${meal.toUpperCase()}_${(i + 1).toString()}';
      Map item = chosen[i];

      Provider.of<MealChoiche>(context, listen: false)
          .ChooseAndReplace(dish, item);
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
} //HomePage