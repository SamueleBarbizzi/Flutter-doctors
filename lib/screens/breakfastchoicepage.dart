// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_doctors/models/mealchoice.dart';
import 'package:flutter_doctors/models/personalmeals.dart';
import 'package:flutter_doctors/models/score_linear_progress.dart';
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
    required this.sumCalories,
  }) : super(key: key);

  final bool firstDatabaseEntry;
  final int sumCalories;

  static const routename = 'BreakfastChoicePage';

  @override
  _BreakfastChoicePageState createState() => _BreakfastChoicePageState();
}

class _BreakfastChoicePageState extends State<BreakfastChoicePage> {
  //List of recipes

  // This controller will store the value of the search bar
  // TextEditingController editingController = TextEditingController();
  late final recipes = Groups().createBreakfastDishes(context);
  List chosen = []; // list of the selected recipes

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final recipes = Groups().createBreakfastDishes(context);
    recipes.sort((a, b) => a["name"].compareTo(b["name"]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('${BreakfastChoicePage.routename} built');
    int countCalories = Provider.of<MealChoiche>(context, listen: false).getAllCalories();
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;
    final recipes = Groups().createBreakfastDishes(context);
    recipes.sort((a, b) => a["name"].compareTo(b["name"]));
    String meal = 'BREAKFAST';
    String course = 'breakfast';
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //back to MainNavigator, saving the coiches
          _Done(context);
        },
        backgroundColor: Colors.green,
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
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: [
                OutlinedButton(
                    onPressed: () => showDialog(
                          context: context,
                          builder: (context) => ScaffoldMessenger(
                            child: Builder(
                              builder: (context) => Scaffold(
                                backgroundColor: Colors.transparent,
                                body: GestureDetector(
                                  child: AlertDialog(
                                    title: const Text(
                                        'Insert personal course option'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: nameController,
                                          //onChanged: (value) {String name = value;},
                                          decoration: const InputDecoration(
                                            labelText: "Name",
                                            hintText: "Name...",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        TextField(
                                          controller: quantityController,
                                          keyboardType: TextInputType.number,
                                          //onChanged: (value) {int quantity = int.parse(value);},
                                          decoration: const InputDecoration(
                                            labelText: "Calories",
                                            hintText: "Kcals...",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          nameController.clear();
                                          quantityController.clear();
                                          Navigator.pop(context, 'Cancel');
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          if (nameController.text != '' &&
                                              quantityController.text != '') {
                                            Provider.of<PersonalMeals>(context,
                                                    listen: false)
                                                .addPersonalRecipe(
                                                    meal,
                                                    0,
                                                    nameController.text,
                                                    int.parse(quantityController
                                                        .text));
                                            Map item =
                                                Provider.of<PersonalMeals>(
                                                        context,
                                                        listen: false)
                                                    .getPersonalRecipe(
                                                        meal, 0, 1, true);
                                            Provider.of<MealChoiche>(context,
                                                    listen: false)
                                                .addPersonalRecipe(
                                                    meal.toUpperCase(),
                                                    course.toLowerCase(),
                                                    item);
                                        countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();
                                            setState(() {});
                                            nameController.clear();
                                            quantityController.clear();
                                            Navigator.pop(context, 'Add');
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Name or quantity inserted are empty! Please complete both inputs or Cancel'),
                                              elevation: 20,
                                            ));
                                          }
                                        },
                                        child: const Text('Add'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                            'Insert personalized course (name and calories)'))),
                const Center(
                  heightFactor: 3,
                  child: Text('Personalized courses:'),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Provider.of<PersonalMeals>(context, listen: false)
                      .personalRecipes[meal]
                      .length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                        key: ValueKey(Provider.of<PersonalMeals>(context, listen: false)
                            .personalRecipes[meal][index]['name']),
                        margin: const EdgeInsets.all(1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),

                        // The color depends on this is selected or not
                        color: Provider.of<PersonalMeals>(context, listen: false)
                                        .personalRecipes[meal][index]
                                    ['isSelected'] ==
                                true
                            ? Colors.lightGreen
                            : Colors.white,
                        child: ListTile(
                            onTap: () {
                              // if this item isn't selected yet, "isSelected": false -> true
                              // If this item already is selected: "isSelected": true -> false
                              setState(() {
                                Map item = Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .getPersonalRecipe(meal, 0, index, false);
                                Provider.of<MealChoiche>(context, listen: false)
                                    .TooglePersonalRecipe(meal.toUpperCase(),
                                        course.toLowerCase(), item);

                                countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();

                                Provider.of<PersonalMeals>(context,
                                                listen: false)
                                            .personalRecipes[meal][index]
                                        ['isSelected'] =
                                    !Provider.of<PersonalMeals>(context,
                                                listen: false)
                                            .personalRecipes[meal][index]
                                        ['isSelected'];
                              });
                            },
                            title: Text(
                                Provider.of<PersonalMeals>(context, listen: false)
                                    .personalRecipes[meal][index]['name']),
                            subtitle: Text('     ${Provider.of<PersonalMeals>(context, listen: false).personalRecipes[meal][index]['calories']} kcals'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_forever),
                              onPressed: () {
                                Map item = Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .getPersonalRecipe(meal, 0, index, false);
                                Provider.of<MealChoiche>(context, listen: false)
                                    .removePersonalRecipe(meal.toUpperCase(),
                                        course.toLowerCase(), item);
                                Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .removePersonalRecipe(meal, 0, index);
                                countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();
                                setState(() {});
                              },
                            )));
                  },
                ),
                const Center(
                  heightFactor: 3,
                  child: Text('Proposed recipes:'),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recipes.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                      key: ValueKey(recipes[index]['name']),
                      margin: const EdgeInsets.all(1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),

                      // The color depends on this is selected or not
                      color: recipes[index]['isSelected'] == true
                          ? Colors.lightGreen
                          : Colors.white,
                      child: ListTile(
                        onTap: () {
                          // if this item isn't selected yet, "isSelected": false -> true
                          // If this item already is selected: "isSelected": true -> false
                          setState(() {
                            recipes[index]['isSelected'] =
                                !recipes[index]['isSelected'];
                            String meal = 'BREAKFAST';
                            String course = 'breakfast';
                            Provider.of<MealChoiche>(context, listen: false)
                                .ToogleChosenRecipe(
                                    meal.toUpperCase(), course, recipes[index]);

                            countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();
                          });
                        },
                        title: Text(recipes[index]['name']),
                        subtitle:
                            Text('     ${recipes[index]['calories']} kcals'),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_red_eye_rounded),
                          tooltip: 'Show Recipe',
                          onPressed: () =>
                              _showRecipe(context, 'Breakfast', recipes[index]),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 30,
              width: deviceWidth(context),
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Text(
                      ' Actual calories count: $countCalories / ${widget.sumCalories}',
                    ),
                  ),
                  Expanded(
                    child: CustomPaint(
                      foregroundPainter: ScoreLinearProgress(
                        backColor: Colors.lightBlueAccent.withOpacity(0.4),
                        frontColor: Colors.lightBlueAccent,
                        strokeWidth: 15,
                        value: (countCalories/widget.sumCalories).toDouble(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MainNavigator(
          flag: false,
          firstDatabaseEntry: widget.firstDatabaseEntry,
        ),
      ),
    );
  } //_Done

  void _showRecipe(BuildContext context, String dish, Map recipe) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RecipePage(
              recipe: recipe,
              dish: dish,
            )));
  }
} //BreakfastChoicePage