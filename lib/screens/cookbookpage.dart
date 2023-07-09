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

class CookBookPage extends StatefulWidget {
  const CookBookPage({Key? key, required this.selected, required this.meal}) : super(key: key);

  final List<List> selected;
  final String meal;

  static const routename = 'CookBookPage';

  @override
  _CookBookPageState createState() => _CookBookPageState();
}

class _CookBookPageState extends State<CookBookPage> {
  //List of recipes
  final List<Map> recipes = CookBook().recipeslist;

  List<List> ingredients = [[],[],[],[]]; //selected ingredient

  List<List> possibleRecipes = [[],[],[],[]]; //shown recipes

  // This controller will store the value of the search bar
  // TextEditingController editingController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  final List<String> groupsName = ['FIRST MAIN DISH','SECOND MAIN DISH','SIDE','DESSERT'];
  List<List> groups = Groups().createDishesGroups();
  List<String> chosenName = ['main1','main2','side','dessert'];

  List<List> chosen = []; // list of the selected recipes


  @override

  void initState() { 
    
    if (widget.selected[0].isEmpty & widget.selected[1].isEmpty & widget.selected[2].isEmpty & widget.selected[3].isEmpty){
      possibleRecipes = Groups().createDishesGroups();

      for (int i=0; i<possibleRecipes.length;i++){
      possibleRecipes[i].sort((a, b) => a["name"].compareTo(b["name"]));
        }
      
    }
    
    else{
      for (var i=0; i<widget.selected.length; i++){
        for (var element in widget.selected[i]){
          ingredients[i].add(element['name']); //list of selected ingredients (by name)
        }
      
      }
      //ingredients = widget.selected; 
      //ingredients.sort((a, b) => a["name"].compareTo(b["name"]));

      for (var i=0; i<possibleRecipes.length; i++){
        possibleRecipes[i] = recipes.where((item) => item['ingredients'].keys.toList().any(ingredients[i].contains)).toList();
        //this line creates possibleRecipes as a list of the recipes that contain at least one of the selected ingredients
        //we want to sort the list of recipes
        possibleRecipes[i].sort((a, b) => a["name"].compareTo(b["name"]));
      }
      //possibleRecipes[3] = Groups().getDessertDishes();

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
    return DefaultTabController(
      length: groupsName.length,
      child: Scaffold(
        floatingActionButton:FloatingActionButton(
          onPressed: () {
            //go to recipe page
            _Done(context);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.done),
        ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(CookBookPage.routename),
        leading: BackButton(
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => IngredientsPage(meal: widget.meal))),
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
      body: 
        TabBarView(
          children: [
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
                  SingleChildScrollView(
                    child:
                  Column(children: [
                    OutlinedButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => ScaffoldMessenger(
                          child: Builder(
                            builder: (context) => Scaffold(
                              backgroundColor: Colors.transparent,
                              body: GestureDetector(
                                child: AlertDialog(
                                  title: const Text('Insert personal course option'),
                                  content: 
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: nameController,
                                        //onChanged: (value) {String name = value;},
                                          decoration: const InputDecoration(
                                              labelText: "Name",
                                              hintText: "Name...",
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10))),    
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
                                                borderRadius: BorderRadius.all(Radius.circular(10))),    
                                                ),
                                        ),
                                    ],
                                  ),

                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        nameController.clear();
                                        quantityController.clear();
                                        Navigator.pop(context, 'Cancel');},
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (nameController.text != '' && quantityController.text != ''){
                                          Provider.of<PersonalMeals>(context, listen: false).addPersonalRecipe(0, nameController.text, int.parse(quantityController.text));
                                          setState(() {});
                                          nameController.clear();
                                          quantityController.clear();
                                          Navigator.pop(context, 'Add');
                                        }
                                        else{
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Name or quantity inserted are empty! Please complete both inputs or Cancel'),
                                              elevation: 20,
                                              )
                                          );
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
                        child: const Text('Insert personalized course (name and calories)')
                        )
                    ),

                    const Center(
                      heightFactor: 3,
                      child: Text('Personalized courses:'),
                    ),

                    ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Provider.of<PersonalMeals>(context, listen: false).personalRecipes[0].length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Card(
                          key: ValueKey(Provider.of<PersonalMeals>(context, listen: false).personalRecipes[0][index]['name']),
                          margin: const EdgeInsets.all(1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),

                          // The color depends on this is selected or not
                          color: Provider.of<PersonalMeals>(context, listen: false).personalRecipes[0][index]['isSelected'] == true
                              ? Colors.lightGreen
                              : Colors.white,
                          child: ListTile(
                            onTap: () {
                              // if this item isn't selected yet, "isSelected": false -> true
                              // If this item already is selected: "isSelected": true -> false
                              setState(() {
                                Provider.of<PersonalMeals>(context, listen: false).personalRecipes[0][index]['isSelected']
                                 = 
                                !Provider.of<PersonalMeals>(context, listen: false).personalRecipes[0][index]['isSelected'];
                              });
                            
                            
                          
                            },

                            //leading: CircleAvatar(
                            //    backgroundColor: Colors.green,
                            //    child: Text(possibleRecipes[index]['id'].toString())),
                            title: Text(Provider.of<PersonalMeals>(context, listen: false).personalRecipes[0][index]['name']),
                            subtitle: Text('     ${Provider.of<PersonalMeals>(context, listen: false).personalRecipes[0][index]['calories']} kcals'),
                            trailing:  IconButton(
                              icon: const Icon(Icons.delete_forever),
                              onPressed: () {   
                                Provider.of<PersonalMeals>(context, listen: false).removePersonalRecipe(0, index);
                                setState(() {});
                            },
                          )

                          ));
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
                          color: possibleRecipes[0][index]['isSelected'] == true
                              ? Colors.lightGreen
                              : Colors.white,
                          child: ListTile(
                            onTap: () {
                              // if this item isn't selected yet, "isSelected": false -> true
                              // If this item already is selected: "isSelected": true -> false
                              setState(() {
                                possibleRecipes[0][index]['isSelected'] = !possibleRecipes[0][index]['isSelected'];
                              });
                            },

                            //leading: CircleAvatar(
                            //    backgroundColor: Colors.green,
                            //    child: Text(possibleRecipes[index]['id'].toString())),
                            title: Text(possibleRecipes[0][index]['name']),
                            subtitle: Text('     ${possibleRecipes[0][index]['calories']} kcals'),

                            trailing: 
                              IconButton(
                                icon: const Icon(Icons.remove_red_eye_rounded),
                                tooltip: 'Show Recipe',
                                onPressed: () => _showRecipe(context, '${widget.meal.toUpperCase()}_${groupsName[0].toLowerCase()}', possibleRecipes[0][index]),
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
                  ],),

                  ),

                  SingleChildScrollView(
                    child: 
                      Column(children: [
                        OutlinedButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => ScaffoldMessenger(
                          child: Builder(
                            builder: (context) => Scaffold(
                              backgroundColor: Colors.transparent,
                              body: GestureDetector(
                                child: AlertDialog(
                                  title: const Text('Insert personal course option'),
                                  content: 
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: nameController,
                                        //onChanged: (value) {String name = value;},
                                          decoration: const InputDecoration(
                                              labelText: "Name",
                                              hintText: "Name...",
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10))),    
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
                                                borderRadius: BorderRadius.all(Radius.circular(10))),    
                                                ),
                                        ),
                                    ],
                                  ),

                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (nameController.text != '' && quantityController.text != ''){
                                          Provider.of<PersonalMeals>(context, listen: false).addPersonalRecipe(1, nameController.text, int.parse(quantityController.text));
                                          setState(() {});
                                          Navigator.pop(context, 'Add');
                                        }
                                        else{
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Name or quantity inserted are empty! Please complete both inputs or Cancel'),
                                              elevation: 20,
                                              )
                                          );
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
                        child: const Text('Insert personalized course (name and calories)')
                        )
                    ),

                    const Center(
                      heightFactor: 3,
                      child: Text('Personalized courses:'),
                    ),

                    ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Provider.of<PersonalMeals>(context, listen: false).personalRecipes[1].length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Card(
                          key: ValueKey(Provider.of<PersonalMeals>(context, listen: false).personalRecipes[1][index]['name']),
                          margin: const EdgeInsets.all(1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),

                          // The color depends on this is selected or not
                          color: Provider.of<PersonalMeals>(context, listen: false).personalRecipes[1][index]['isSelected'] == true
                              ? Colors.lightGreen
                              : Colors.white,
                          child: ListTile(
                            onTap: () {
                              // if this item isn't selected yet, "isSelected": false -> true
                              // If this item already is selected: "isSelected": true -> false
                              setState(() {
                                Provider.of<PersonalMeals>(context, listen: false).personalRecipes[1][index]['isSelected']
                                 = 
                                !Provider.of<PersonalMeals>(context, listen: false).personalRecipes[1][index]['isSelected'];
                              });
                            
                            
                          
                            },

                            //leading: CircleAvatar(
                            //    backgroundColor: Colors.green,
                            //    child: Text(possibleRecipes[index]['id'].toString())),
                            title: Text(Provider.of<PersonalMeals>(context, listen: false).personalRecipes[1][index]['name']),
                            subtitle: Text('     ${Provider.of<PersonalMeals>(context, listen: false).personalRecipes[1][index]['calories']} kcals'),
                            trailing:  IconButton(
                              icon: const Icon(Icons.delete_forever),
                              onPressed: () {   
                                Provider.of<PersonalMeals>(context, listen: false).removePersonalRecipe(1, index);
                                setState(() {});
                            },
                          )

                          ));
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
                              color: possibleRecipes[1][index]['isSelected'] == true
                                  ? Colors.lightGreen
                                  : Colors.white,
                              child: ListTile(
                                onTap: () {
                                  // if this item isn't selected yet, "isSelected": false -> true
                                  // If this item already is selected: "isSelected": true -> false
                                  setState(() {
                                    possibleRecipes[1][index]['isSelected'] = !possibleRecipes[1][index]['isSelected'];
                                  });
                                },
                                
                                //leading: CircleAvatar(
                                //    backgroundColor: Colors.green,
                                //    child: Text(possibleRecipes[index]['id'].toString())),
                                title: Text(possibleRecipes[1][index]['name']),
                                subtitle: Text('     ${possibleRecipes[1][index]['calories']} kcals'),

                                trailing: 
                                  IconButton(
                                    icon: const Icon(Icons.remove_red_eye_rounded),
                                    tooltip: 'Show Recipe',
                                    onPressed: () => _showRecipe(context, '${widget.meal.toUpperCase()}_${groupsName[1].toLowerCase()}', possibleRecipes[1][index]),
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

                      ],),

                  ),

                  SingleChildScrollView(
                    child:
                      Column(children: [
                        OutlinedButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => ScaffoldMessenger(
                          child: Builder(
                            builder: (context) => Scaffold(
                              backgroundColor: Colors.transparent,
                              body: GestureDetector(
                                child: AlertDialog(
                                  title: const Text('Insert personal course option'),
                                  content: 
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: nameController,
                                        //onChanged: (value) {String name = value;},
                                          decoration: const InputDecoration(
                                              labelText: "Name",
                                              hintText: "Name...",
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10))),    
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
                                                borderRadius: BorderRadius.all(Radius.circular(10))),    
                                                ),
                                        ),
                                    ],
                                  ),

                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (nameController.text != '' && quantityController.text != ''){
                                          Provider.of<PersonalMeals>(context, listen: false).addPersonalRecipe(2,nameController.text, int.parse(quantityController.text));
                                          setState(() {});
                                          Navigator.pop(context, 'Add');
                                        }
                                        else{
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Name or quantity inserted are empty! Please complete both inputs or Cancel'),
                                              elevation: 20,
                                              )
                                          );
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
                        child: const Text('Insert personalized course (name and calories)')
                        )
                    ),

                    const Center(
                      heightFactor: 3,
                      child: Text('Personalized courses:'),
                    ),

                    ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Provider.of<PersonalMeals>(context, listen: false).personalRecipes[2].length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Card(
                          key: ValueKey(Provider.of<PersonalMeals>(context, listen: false).personalRecipes[2][index]['name']),
                          margin: const EdgeInsets.all(1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),

                          // The color depends on this is selected or not
                          color: Provider.of<PersonalMeals>(context, listen: false).personalRecipes[2][index]['isSelected'] == true
                              ? Colors.lightGreen
                              : Colors.white,
                          child: ListTile(
                            onTap: () {
                              // if this item isn't selected yet, "isSelected": false -> true
                              // If this item already is selected: "isSelected": true -> false
                              setState(() {
                                Provider.of<PersonalMeals>(context, listen: false).personalRecipes[2][index]['isSelected']
                                 = 
                                !Provider.of<PersonalMeals>(context, listen: false).personalRecipes[2][index]['isSelected'];
                              });
                            
                            
                          
                            },

                            //leading: CircleAvatar(
                            //    backgroundColor: Colors.green,
                            //    child: Text(possibleRecipes[index]['id'].toString())),
                            title: Text(Provider.of<PersonalMeals>(context, listen: false).personalRecipes[2][index]['name']),
                            subtitle: Text('     ${Provider.of<PersonalMeals>(context, listen: false).personalRecipes[2][index]['calories']} kcals'),
                            trailing:  IconButton(
                              icon: const Icon(Icons.delete_forever),
                              onPressed: () {   
                                Provider.of<PersonalMeals>(context, listen: false).removePersonalRecipe(2, index);
                                setState(() {});
                            },
                          )

                          ));
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
                              color: possibleRecipes[2][index]['isSelected'] == true
                                  ? Colors.lightGreen
                                  : Colors.white,
                              child: ListTile(
                                onTap: () {
                                  // if this item isn't selected yet, "isSelected": false -> true
                                  // If this item already is selected: "isSelected": true -> false
                                  setState(() {
                                    possibleRecipes[2][index]['isSelected'] = !possibleRecipes[2][index]['isSelected'];
                                  });
                                },

                                //leading: CircleAvatar(
                                //    backgroundColor: Colors.green,
                                //    child: Text(possibleRecipes[index]['id'].toString())),
                                title: Text(possibleRecipes[2][index]['name']),
                                subtitle: Text('     ${possibleRecipes[2][index]['calories']} kcals'),

                                trailing: 
                                  IconButton(
                                    icon: const Icon(Icons.remove_red_eye_rounded),
                                    tooltip: 'Show Recipe',
                                    onPressed: () => _showRecipe(context, '${widget.meal.toUpperCase()}_${groupsName[2].toLowerCase()}', possibleRecipes[2][index]),
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

                      ],
                      ),
                  ),


                  SingleChildScrollView(
                    child:
                      Column(children: [
                        OutlinedButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => ScaffoldMessenger(
                          child: Builder(
                            builder: (context) => Scaffold(
                              backgroundColor: Colors.transparent,
                              body: GestureDetector(
                                child: AlertDialog(
                                  title: const Text('Insert personal course option'),
                                  content: 
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: nameController,
                                        //onChanged: (value) {String name = value;},
                                          decoration: const InputDecoration(
                                              labelText: "Name",
                                              hintText: "Name...",
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10))),    
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
                                                borderRadius: BorderRadius.all(Radius.circular(10))),    
                                                ),
                                        ),
                                    ],
                                  ),

                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (nameController.text != '' && quantityController.text != ''){
                                          Provider.of<PersonalMeals>(context, listen: false).addPersonalRecipe(3, nameController.text, int.parse(quantityController.text));
                                          setState(() {});
                                          Navigator.pop(context, 'Add');
                                        }
                                        else{
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Name or quantity inserted are empty! Please complete both inputs or Cancel'),
                                              elevation: 20,
                                              )
                                          );
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
                        child: const Text('Insert personalized course (name and calories)')
                        )
                    ),

                    const Center(
                      heightFactor: 3,
                      child: Text('Personalized courses:'),
                    ),

                    ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Provider.of<PersonalMeals>(context, listen: false).personalRecipes[3].length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Card(
                          key: ValueKey(Provider.of<PersonalMeals>(context, listen: false).personalRecipes[3][index]['name']),
                          margin: const EdgeInsets.all(1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),

                          // The color depends on this is selected or not
                          color: Provider.of<PersonalMeals>(context, listen: false).personalRecipes[3][index]['isSelected'] == true
                              ? Colors.lightGreen
                              : Colors.white,
                          child: ListTile(
                            onTap: () {
                              // if this item isn't selected yet, "isSelected": false -> true
                              // If this item already is selected: "isSelected": true -> false
                              setState(() {
                                Provider.of<PersonalMeals>(context, listen: false).personalRecipes[3][index]['isSelected']
                                 = 
                                !Provider.of<PersonalMeals>(context, listen: false).personalRecipes[3][index]['isSelected'];
                              });
                            
                            
                          
                            },

                            //leading: CircleAvatar(
                            //    backgroundColor: Colors.green,
                            //    child: Text(possibleRecipes[index]['id'].toString())),
                            title: Text(Provider.of<PersonalMeals>(context, listen: false).personalRecipes[3][index]['name']),
                            subtitle: Text('     ${Provider.of<PersonalMeals>(context, listen: false).personalRecipes[3][index]['calories']} kcals'),
                            trailing:  IconButton(
                              icon: const Icon(Icons.delete_forever),
                              onPressed: () {   
                                Provider.of<PersonalMeals>(context, listen: false).removePersonalRecipe(3,index);
                                setState(() {});
                            },
                          )

                          ));
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
                              color: possibleRecipes[3][index]['isSelected'] == true
                                  ? Colors.lightGreen
                                  : Colors.white,
                              child: ListTile(
                                onTap: () {
                                  // if this item isn't selected yet, "isSelected": false -> true
                                  // If this item already is selected: "isSelected": true -> false
                                  setState(() {
                                    possibleRecipes[3][index]['isSelected'] = !possibleRecipes[3][index]['isSelected'];
                                  });
                                },

                                //leading: CircleAvatar(
                                //    backgroundColor: Colors.green,
                                //    child: Text(possibleRecipes[index]['id'].toString())),
                                title: Text(possibleRecipes[3][index]['name']),
                                subtitle: Text('     ${possibleRecipes[3][index]['calories']} kcals'),

                                trailing: 
                                  IconButton(
                                    icon: const Icon(Icons.remove_red_eye_rounded),
                                    tooltip: 'Show Recipe',
                                    onPressed: () => _showRecipe(context, '${widget.meal.toUpperCase()}_${groupsName[3].toLowerCase()}', possibleRecipes[3][index]),
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
                              )
                              */));
                        },
                      ), 

                      ],),
                  ),

                   

                ],  
              ),
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

  void _toMainNavigator(BuildContext context){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainNavigator()));
  }//_toMainNavigator

  void _Done(BuildContext context){

    for (int i=0; i<groups.length;i++){
      chosen.add(possibleRecipes[i].where((item) => item['isSelected'] == true).toList());
    }

    for (int i=0; i<chosen.length; i++){
      for (int j=0; j<chosen[i].length; j++){

        String dish = '${widget.meal.toUpperCase()}_${chosenName[i].toLowerCase()}_${(j+1).toString()}';
        Map item = chosen[i][j];

        Provider.of<MealChoiche>(context, listen: false).ChooseAndReplace(dish,item);
        
      }
    }

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainNavigator()));
  }//_Done

 void _showRecipe (BuildContext context, String dish, Map recipe){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecipePage(recipe: recipe, dish: dish,)));
 }

} //HomePage