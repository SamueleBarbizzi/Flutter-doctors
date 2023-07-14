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

class CookBookPage extends StatefulWidget {
  const CookBookPage(
      {Key? key,
      required this.selected,
      required this.meal,
      required this.firstDatabaseEntry,
      required this.sumCalories,})
      : super(key: key);

  final bool firstDatabaseEntry;
  final List<List> selected;
  final String meal;
  final int sumCalories;

  static const routename = 'CookBookPage';

  @override
  _CookBookPageState createState() => _CookBookPageState();
}

class _CookBookPageState extends State<CookBookPage> {
  List<Map> recipes = [];

  List<List> ingredients = [[], [], [], []]; //selected ingredient

  List<List> possibleRecipes = [[], [], [], []]; //shown recipes

  // This controller will store the value of the search bar
  // TextEditingController editingController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  final List<String> groupsName = [
    'FIRST MAIN DISH',
    'SECOND MAIN DISH',
    'SIDE',
    'DESSERT',
  ];

  List<String> coursesName = ['main1', 'main2', 'side', 'dessert'];

  List<List> chosen = []; // list of the selected recipes

  late Color subtitle2Color;

  @override
  void initState() {
    final List<Map> recipes =
        Provider.of<CookBook>(context, listen: false).recipeslist;

    if (widget.selected[0].isEmpty &
        widget.selected[1].isEmpty &
        widget.selected[2].isEmpty &
        widget.selected[3].isEmpty) {
      
      subtitle2Color = Colors.transparent;

      possibleRecipes = [
        Groups().createFirstMainDishes(context),
        Groups().createSecondMainDishes(context),
        Groups().createSideDishes(context),
        Groups().createDessertDishes(context),
      ];

      for (int i = 0; i < possibleRecipes.length; i++) {
        possibleRecipes[i].sort((a, b) => a["name"].compareTo(b["name"]));
      }
    } else {

      subtitle2Color = Colors.black;

      for (var i = 0; i < widget.selected.length; i++) {
        for (var element in widget.selected[i]) {
          ingredients[i]
              .add(element['name']); //list of selected ingredients (by name)
        }
      }

      for (var i = 0; i < possibleRecipes.length; i++) {
        possibleRecipes[i] = recipes
            .where((item) =>
                item['ingredients'].keys.toList().any(ingredients[i].contains) && item['course'].contains('${coursesName[i][0].toUpperCase()}${coursesName[i].substring(1)}'))
            .toList();

        for (var j = 0; j < possibleRecipes[i].length; j++) {
          List listsToCompare = [
            possibleRecipes[i][j]['ingredients'].keys.toList(),
            ingredients[i]
          ];

          List commonIngredients = (listsToCompare.fold<Set>(
                  listsToCompare.first.toSet(), (a, b) => a.intersection(b.toSet())))
              .toList();

          commonIngredients.sort((a, b) => a.compareTo(b));

          int commonIngredientsCount = commonIngredients.length;

          possibleRecipes[i][j]['commonIngredients'] = commonIngredients;
          possibleRecipes[i][j]['commonIngredientsCount'] =
              commonIngredientsCount;
        }

        //this line creates possibleRecipes as a list of the recipes that contain at least one of the selected ingredients
        //we want to sort the list of recipes
        possibleRecipes[i].sort((b, a) =>
            a['commonIngredientsCount'].compareTo(b['commonIngredientsCount']));
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('${CookBookPage.routename} built');


    int countCalories = Provider.of<MealChoiche>(context, listen: false).getAllCalories();

    //double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: groupsName.length,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //go to recipe page
            _Done(context);
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.done),
        ),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(CookBookPage.routename),
          leading: BackButton(
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => IngredientsPage(
                        firstDatabaseEntry: widget.firstDatabaseEntry,

                        meal: widget.meal, sumCalories: widget.sumCalories,))),

          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              tooltip: 'Home',
              onPressed: () => _toMainNavigator(context),
            ),
          ],
          bottom: const TabBar(
            indicatorWeight: 3,
            tabs: [
              Tab(child: Text('First main dish')),
              Tab(child: Text('Second main dish')),
              Tab(child: Text('Side dish')),
              Tab(child: Text('Dessert')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Stack(
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
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "Name",
                                                  hintText: "Name...",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              TextField(
                                                controller: quantityController,
                                                keyboardType:
                                                    TextInputType.number,
                                                //onChanged: (value) {int quantity = int.parse(value);},
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "Calories",
                                                  hintText: "Kcals...",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                nameController.clear();
                                                quantityController.clear();
                                                Navigator.pop(
                                                    context, 'Cancel');
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                if (nameController.text != '' &&
                                                    quantityController.text !=
                                                        '') {
                                                  Provider.of<PersonalMeals>(
                                                          context,
                                                          listen: false)
                                                      .addPersonalRecipe(widget.meal,
                                                          0,
                                                          nameController.text,
                                                          int.parse(
                                                              quantityController
                                                                  .text));
                                                   Map item = Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .getPersonalRecipe(widget.meal, 0, 1, true);
                                                  Provider.of<MealChoiche>(context, listen: false).
                                                    addPersonalRecipe(widget.meal.toUpperCase(),
                                        coursesName[0].toLowerCase(), item);

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
                                                      .showSnackBar(
                                                          const SnackBar(
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
                        itemCount:
                            Provider.of<PersonalMeals>(context, listen: false)
                                .personalRecipes[widget.meal][0]
                                .length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Card(
                              key: ValueKey(
                                  Provider.of<PersonalMeals>(context, listen: false)
                                      .personalRecipes[widget.meal][0][index]['name']),
                              margin: const EdgeInsets.all(1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),

                              // The color depends on this is selected or not
                              color: Provider.of<PersonalMeals>(context, listen: false)
                                              .personalRecipes[widget.meal][0][index]
                                          ['is${widget.meal}Saved'] ==
                                      true
                                  ? Colors.lightGreen
                                  : Colors.white,
                              child: ListTile(
                                  onTap: () {
                                    // if this item isn't selected yet, "isSelected": false -> true
                                    // If this item already is selected: "isSelected": true -> false
                                    setState(() {
                                      Provider.of<PersonalMeals>(context,
                                                      listen: false)
                                                  .personalRecipes[widget.meal][0][index]
                                              ['is${widget.meal}Saved'] =
                                          !Provider.of<PersonalMeals>(context,
                                                      listen: false)
                                                  .personalRecipes[widget.meal][0][index]
                                              ['is${widget.meal}Saved'];
                                Map item = Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .getPersonalRecipe(widget.meal, 0, index, false);
                                Provider.of<MealChoiche>(context, listen: false)
                                    .TooglePersonalRecipe(widget.meal.toUpperCase(),
                                        coursesName[0].toLowerCase(), item);
                                    });

                                        countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();
                                    
                                  },
                                  title: Text(Provider.of<PersonalMeals>(context, listen: false)
                                      .personalRecipes[widget.meal][0][index]['name']),
                                  subtitle: Text('     ${Provider.of<PersonalMeals>(context, listen: false).personalRecipes[widget.meal][0][index]['calories']} kcals'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete_forever),
                                    onPressed: () {
                                Map item = Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .getPersonalRecipe(widget.meal,0, index, false);
                                Provider.of<MealChoiche>(context, listen: false)
                                    .removePersonalRecipe(widget.meal.toUpperCase(),
                                        coursesName[0].toLowerCase(), item);
                                      Provider.of<PersonalMeals>(context,
                                              listen: false)
                                          .removePersonalRecipe(widget.meal, 0, index);

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
                        itemCount: possibleRecipes[0].length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Card(
                              key: ValueKey(possibleRecipes[0][index]['name']),
                              margin: const EdgeInsets.all(1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),

                              // The color depends on this is selected or not
                              color: possibleRecipes[0][index]['is${widget.meal}Saved'] ==
                                      true
                                  ? Colors.lightGreen
                                  : Colors.white,
                              child: ListTile(
                                onTap: () {
                                  // if this item isn't selected yet, "isSelected": false -> true
                                  // If this item already is selected: "isSelected": true -> false
                                  setState(() {
                                    possibleRecipes[0][index]['is${widget.meal}Saved'] =
                                        !possibleRecipes[0][index]
                                            ['is${widget.meal}Saved'];
                                    String meal = widget.meal;
                                    String course = coursesName[0];

                                    Provider.of<MealChoiche>(context, listen: false).
                                    ToogleChosenRecipe(meal.toUpperCase(), course , possibleRecipes[0][index]);

                                    countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();

                                  });
                                },

                                //leading: CircleAvatar(
                                //    backgroundColor: Colors.green,
                                //    child: Text(possibleRecipes[index]['id'].toString())),
                                title: Text(possibleRecipes[0][index]['name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                subtitle: RichText(
                                  text: TextSpan(
                                    text:
                                        "     ${possibleRecipes[0][index]['calories']} kcals",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text:
                                            "\n${possibleRecipes[0][index]['commonIngredientsCount']} ingredients inside: ${possibleRecipes[0][index]['commonIngredients'].join(", ")}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 11,
                                            fontStyle: FontStyle.italic,
                                            color:
                                                subtitle2Color),
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: IconButton(
                                  icon:
                                      const Icon(Icons.remove_red_eye_rounded),
                                  tooltip: 'Show Recipe',
                                  onPressed: () => _showRecipe(
                                      context,
                                      groupsName[0][0].toUpperCase() + groupsName[0].substring(1).toLowerCase(),
                                      possibleRecipes[0][index]),
                                ),
                              ));
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
                              backColor:
                                  Colors.lightBlueAccent.withOpacity(0.4),
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
            Stack(
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
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "Name",
                                                  hintText: "Name...",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              TextField(
                                                controller: quantityController,
                                                keyboardType:
                                                    TextInputType.number,
                                                //onChanged: (value) {int quantity = int.parse(value);},
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "Quantity",
                                                  hintText: "Kcals...",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                if (nameController.text != '' &&
                                                    quantityController.text !=
                                                        '') {
                                                  Provider.of<PersonalMeals>(
                                                          context,
                                                          listen: false)
                                                      .addPersonalRecipe(widget.meal,
                                                          1,
                                                          nameController.text,
                                                          int.parse(
                                                              quantityController
                                                                  .text));
                                                  setState(() {});
                                                  Map item = Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .getPersonalRecipe(widget.meal, 1, 1, true);
                                                  Provider.of<MealChoiche>(context, listen: false).
                                                    addPersonalRecipe(widget.meal.toUpperCase(),
                                        coursesName[1].toLowerCase(), item);

                                        countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();
                                                  
                                                  nameController.clear();
                                                  quantityController.clear();
                                                  Navigator.pop(context, 'Add');
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
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
                        itemCount:
                            Provider.of<PersonalMeals>(context, listen: false)
                                .personalRecipes[widget.meal][1]
                                .length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Card(
                              key: ValueKey(
                                  Provider.of<PersonalMeals>(context, listen: false)
                                      .personalRecipes[widget.meal][1][index]['name']),
                              margin: const EdgeInsets.all(1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),

                              // The color depends on this is selected or not
                              color: Provider.of<PersonalMeals>(context, listen: false)
                                              .personalRecipes[widget.meal][1][index]
                                          ['is${widget.meal}Saved'] ==
                                      true
                                  ? Colors.lightGreen
                                  : Colors.white,
                              child: ListTile(
                                  onTap: () {
                                    // if this item isn't selected yet, "isSelected": false -> true
                                    // If this item already is selected: "isSelected": true -> false
                                    setState(() {
                                      Provider.of<PersonalMeals>(context,
                                                      listen: false)
                                                  .personalRecipes[widget.meal][1][index]
                                              ['is${widget.meal}Saved'] =
                                          !Provider.of<PersonalMeals>(context,
                                                      listen: false)
                                                  .personalRecipes[widget.meal][1][index]
                                              ['is${widget.meal}Saved'];
                                Map item = Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .getPersonalRecipe(widget.meal, 1, index, false);
                                Provider.of<MealChoiche>(context, listen: false)
                                    .TooglePersonalRecipe(widget.meal.toUpperCase(),
                                        coursesName[1].toLowerCase(), item);

                                        countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();
                                      
                                    });
                                  },

                                  //leading: CircleAvatar(
                                  //    backgroundColor: Colors.green,
                                  //    child: Text(possibleRecipes[index]['id'].toString())),
                                  title: Text(Provider.of<PersonalMeals>(context, listen: false)
                                      .personalRecipes[widget.meal][1][index]['name']),
                                  subtitle: Text('     ${Provider.of<PersonalMeals>(context, listen: false).personalRecipes[widget.meal][1][index]['calories']} kcals'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete_forever),
                                    onPressed: () {
                                Map item = Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .getPersonalRecipe(widget.meal, 1, index, false);
                                Provider.of<MealChoiche>(context, listen: false)
                                    .removePersonalRecipe(widget.meal.toUpperCase(),
                                        coursesName[1].toLowerCase(), item);
                                      Provider.of<PersonalMeals>(context,
                                              listen: false)
                                          .removePersonalRecipe(widget.meal, 1, index);

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
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: possibleRecipes[1].length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Card(
                              key: ValueKey(possibleRecipes[1][index]['name']),
                              margin: const EdgeInsets.all(1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),

                              // The color depends on this is selected or not
                              color: possibleRecipes[1][index]['is${widget.meal}Saved'] ==
                                      true
                                  ? Colors.lightGreen
                                  : Colors.white,
                              child: ListTile(
                                onTap: () {
                                  // if this item isn't selected yet, "isSelected": false -> true
                                  // If this item already is selected: "isSelected": true -> false
                                  setState(() {
                                    possibleRecipes[1][index]['is${widget.meal}Saved'] =
                                        !possibleRecipes[1][index]
                                            ['is${widget.meal}Saved'];
                                    String meal = widget.meal;
                                    String course = coursesName[1];

                                    Provider.of<MealChoiche>(context, listen: false).
                                    ToogleChosenRecipe(meal.toUpperCase(), course , possibleRecipes[1][index]);
                                    countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();

                                  });
                                },

                                //leading: CircleAvatar(
                                //    backgroundColor: Colors.green,
                                //    child: Text(possibleRecipes[index]['id'].toString())),
                                title: Text(possibleRecipes[1][index]['name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                subtitle: RichText(
                                  text: TextSpan(
                                    text:
                                        "     ${possibleRecipes[1][index]['calories']} kcals",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text:
                                            "\n${possibleRecipes[1][index]['commonIngredientsCount']} ingredients inside: ${possibleRecipes[1][index]['commonIngredients'].join(", ")}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 11,
                                            fontStyle: FontStyle.italic,
                                            color:
                                                Colors.black.withOpacity(0.6)),
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: IconButton(
                                  icon:
                                      const Icon(Icons.remove_red_eye_rounded),
                                  tooltip: 'Show Recipe',
                                  onPressed: () => _showRecipe(
                                      context,
                                      groupsName[1][0].toUpperCase() + groupsName[1].substring(1).toLowerCase(),
                                      possibleRecipes[1][index]),
                                ),
                              ));
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
                              backColor:
                                  Colors.lightBlueAccent.withOpacity(0.4),
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
            Stack(
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
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "Name",
                                                  hintText: "Name...",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              TextField(
                                                controller: quantityController,
                                                keyboardType:
                                                    TextInputType.number,
                                                //onChanged: (value) {int quantity = int.parse(value);},
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "Quantity",
                                                  hintText: "Kcals...",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                if (nameController.text != '' &&
                                                    quantityController.text !=
                                                        '') {
                                                  Provider.of<PersonalMeals>(
                                                          context,
                                                          listen: false)
                                                      .addPersonalRecipe(widget.meal, 
                                                          2,
                                                          nameController.text,
                                                          int.parse(
                                                              quantityController
                                                                  .text));
                                                  setState(() {});
                                                  Map item = Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .getPersonalRecipe(widget.meal, 2, 1, true);
                                                  Provider.of<MealChoiche>(context, listen: false).
                                                    addPersonalRecipe(widget.meal.toUpperCase(),
                                        coursesName[2].toLowerCase(), item);

                                        countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();
                                                  
                                                  nameController.clear();
                                                  quantityController.clear();
                                                  Navigator.pop(context, 'Add');
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
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
                        itemCount:
                            Provider.of<PersonalMeals>(context, listen: false)
                                .personalRecipes[widget.meal][2]
                                .length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Card(
                              key: ValueKey(
                                  Provider.of<PersonalMeals>(context, listen: false)
                                      .personalRecipes[widget.meal][2][index]['name']),
                              margin: const EdgeInsets.all(1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),

                              // The color depends on this is selected or not
                              color: Provider.of<PersonalMeals>(context, listen: false)
                                              .personalRecipes[widget.meal][2][index]
                                          ['is${widget.meal}Saved'] ==
                                      true
                                  ? Colors.lightGreen
                                  : Colors.white,
                              child: ListTile(
                                  onTap: () {
                                    // if this item isn't selected yet, "isSelected": false -> true
                                    // If this item already is selected: "isSelected": true -> false
                                    setState(() {
                                      Provider.of<PersonalMeals>(context,
                                                      listen: false)
                                                  .personalRecipes[widget.meal][2][index]
                                              ['is${widget.meal}Saved'] =
                                          !Provider.of<PersonalMeals>(context,
                                                      listen: false)
                                                  .personalRecipes[widget.meal][2][index]
                                              ['is${widget.meal}Saved'];
                                Map item = Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .getPersonalRecipe(widget.meal, 2, index, false);
                                Provider.of<MealChoiche>(context, listen: false)
                                    .TooglePersonalRecipe(widget.meal.toUpperCase(),
                                        coursesName[2].toLowerCase(), item);

                                        countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();

                                    });
                                  },
                                  title: Text(Provider.of<PersonalMeals>(context, listen: false)
                                      .personalRecipes[widget.meal][2][index]['name']),
                                  subtitle: Text('     ${Provider.of<PersonalMeals>(context, listen: false).personalRecipes[widget.meal][2][index]['calories']} kcals'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete_forever),
                                    onPressed: () {
                                Map item = Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .getPersonalRecipe(widget.meal, 2, index, false);
                                Provider.of<MealChoiche>(context, listen: false)
                                    .removePersonalRecipe(widget.meal.toUpperCase(),
                                        coursesName[2].toLowerCase(), item);
                                      Provider.of<PersonalMeals>(context,
                                              listen: false)
                                          .removePersonalRecipe(widget.meal, 2, index);

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
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: possibleRecipes[2].length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Card(
                              key: ValueKey(possibleRecipes[2][index]['name']),
                              margin: const EdgeInsets.all(1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),

                              // The color depends on this is selected or not
                              color: possibleRecipes[2][index]['is${widget.meal}Saved'] ==
                                      true
                                  ? Colors.lightGreen
                                  : Colors.white,
                              child: ListTile(
                                onTap: () {
                                  // if this item isn't selected yet, "isSelected": false -> true
                                  // If this item already is selected: "isSelected": true -> false
                                  setState(() {
                                    possibleRecipes[2][index]['is${widget.meal}Saved'] =
                                        !possibleRecipes[2][index]
                                            ['is${widget.meal}Saved'];
                                    String meal = widget.meal;
                                    String course = coursesName[2];

                                    Provider.of<MealChoiche>(context, listen: false).
                                    ToogleChosenRecipe(meal.toUpperCase(), course , possibleRecipes[2][index]);
                                    countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();

                                  });
                                },
                                title: Text(possibleRecipes[2][index]['name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                subtitle: RichText(
                                  text: TextSpan(
                                    text:
                                        "     ${possibleRecipes[2][index]['calories']} kcals",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text:
                                            "\n${possibleRecipes[2][index]['commonIngredientsCount']} ingredients inside: ${possibleRecipes[2][index]['commonIngredients'].join(", ")}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 11,
                                            fontStyle: FontStyle.italic,
                                            color:
                                                Colors.black.withOpacity(0.6)),
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: IconButton(
                                  icon:
                                      const Icon(Icons.remove_red_eye_rounded),
                                  tooltip: 'Show Recipe',
                                  onPressed: () => _showRecipe(
                                      context,
                                      groupsName[2][0].toUpperCase() + groupsName[2].substring(1).toLowerCase(),
                                      possibleRecipes[2][index]),
                                ),
                                /*
                                trailing:  IconButton(
                                  icon: Provider.of<Favorites>(context).isExist(recipes[index])
                                    ? const Icon(Icons.favorite, color: Colors.red)
                                    : const Icon(Icons.favorite_border),

                                  onPressed: () {
                                  // if this item isn't selected yet, "isSaved": false -> true
                                  // If this item already is selected: "isSaved": true -> false
                                    
                                  Provider.of<Favorites>(context, listen: false).toggleFavorite(recipes[index]);
                                
                                },
                              )*/
                              ));
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
                              backColor:
                                  Colors.lightBlueAccent.withOpacity(0.4),
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
            Stack(
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          TextField(
                                            controller: quantityController,
                                            keyboardType: TextInputType.number,
                                            //onChanged: (value) {int quantity = int.parse(value);},
                                            decoration: const InputDecoration(
                                              labelText: "Quantity",
                                              hintText: "Kcals...",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            if (nameController.text != '' &&
                                                quantityController.text != '') {
                                              Provider.of<PersonalMeals>(
                                                      context,
                                                      listen: false)
                                                  .addPersonalRecipe(widget.meal, 
                                                      3,
                                                      nameController.text,
                                                      int.parse(
                                                          quantityController
                                                              .text));
                                              setState(() {});
                                              Map item = Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .getPersonalRecipe(widget.meal, 3, 1, true);
                                                  Provider.of<MealChoiche>(context, listen: false).
                                                    addPersonalRecipe(widget.meal.toUpperCase(),
                                        coursesName[3].toLowerCase(), item);

                                        countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();

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
                    itemCount:
                        Provider.of<PersonalMeals>(context, listen: false)
                            .personalRecipes[widget.meal][3]
                            .length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Card(
                          key: ValueKey(
                              Provider.of<PersonalMeals>(context, listen: false)
                                  .personalRecipes[widget.meal][3][index]['name']),
                          margin: const EdgeInsets.all(1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),

                          // The color depends on this is selected or not
                          color: Provider.of<PersonalMeals>(context, listen: false)
                                          .personalRecipes[widget.meal][3][index]
                                      ['is${widget.meal}Saved'] ==
                                  true
                              ? Colors.lightGreen
                              : Colors.white,
                          child: ListTile(
                              onTap: () {
                                // if this item isn't selected yet, "isSelected": false -> true
                                // If this item already is selected: "isSelected": true -> false
                                setState(() {
                                  Provider.of<PersonalMeals>(context,
                                                  listen: false)
                                              .personalRecipes[widget.meal][3][index]
                                          ['is${widget.meal}Saved'] =
                                      !Provider.of<PersonalMeals>(context,
                                                  listen: false)
                                              .personalRecipes[widget.meal][3][index]
                                          ['is${widget.meal}Saved'];
                                Map item = Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .getPersonalRecipe(widget.meal, 3, index, false);
                                Provider.of<MealChoiche>(context, listen: false)
                                    .TooglePersonalRecipe(widget.meal.toUpperCase(),
                                        coursesName[3].toLowerCase(), item);

                                        countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();

                                });
                              },
                              title: Text(Provider.of<PersonalMeals>(context, listen: false)
                                  .personalRecipes[widget.meal][3][index]['name']),
                              subtitle: Text('     ${Provider.of<PersonalMeals>(context, listen: false).personalRecipes[widget.meal][3][index]['calories']} kcals'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete_forever),
                                onPressed: () {
                                Map item = Provider.of<PersonalMeals>(context,
                                        listen: false)
                                    .getPersonalRecipe(widget.meal, 3, index, false);
                                Provider.of<MealChoiche>(context, listen: false)
                                    .removePersonalRecipe(widget.meal.toUpperCase(),
                                        coursesName[3].toLowerCase(), item);
                                  Provider.of<PersonalMeals>(context,
                                          listen: false)
                                      .removePersonalRecipe(widget.meal, 3, index);

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
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: possibleRecipes[3].length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Card(
                          key: ValueKey(possibleRecipes[3][index]['name']),
                          margin: const EdgeInsets.all(1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),

                          // The color depends on this is selected or not
                          color: possibleRecipes[3][index]['is${widget.meal}Saved'] == true
                              ? Colors.lightGreen
                              : Colors.white,
                          child: ListTile(
                            onTap: () {
                              // if this item isn't selected yet, "isSelected": false -> true
                              // If this item already is selected: "isSelected": true -> false
                              setState(() {
                                possibleRecipes[3][index]['is${widget.meal}Saved'] =
                                    !possibleRecipes[3][index]['is${widget.meal}Saved'];
                                String meal = widget.meal;
                                String course = coursesName[3];

                                Provider.of<MealChoiche>(context, listen: false).
                                ToogleChosenRecipe(meal.toUpperCase(), course , possibleRecipes[3][index]);
                                countCalories = Provider.of<MealChoiche>(
                                        context,
                                        listen: false)
                                    .getAllCalories();

                              });
                            },
                            title: Text(possibleRecipes[3][index]['name'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            subtitle: RichText(
                              text: TextSpan(
                                text:
                                    "     ${possibleRecipes[3][index]['calories']} kcals",
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    text:
                                        "\n${possibleRecipes[3][index]['commonIngredientsCount']} ingredients inside: ${possibleRecipes[3][index]['commonIngredients'].join(", ")}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 11,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ],
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.remove_red_eye_rounded),
                              tooltip: 'Show Recipe',
                              onPressed: () => _showRecipe(
                                  context,
                                  groupsName[3][0].toUpperCase() + groupsName[3].substring(1).toLowerCase(),
                                  possibleRecipes[3][index]),
                            ),
                          ));
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
                              backColor:
                                  Colors.lightBlueAccent.withOpacity(0.4),
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
          ],
        ),
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
    

    _toMainNavigator(context);
  } //_Done

  void _showRecipe(BuildContext context, String dish, Map recipe) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RecipePage(
              recipe: recipe,
              dish: dish,
            )));
  }
} //HomePage