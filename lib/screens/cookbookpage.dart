// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';
import 'package:flutter_doctors/screens/ingredientspage.dart';
import 'package:flutter_doctors/models/favorites.dart';
import 'package:flutter_doctors/models/cookbook.dart';
import 'package:flutter_doctors/models/groups.dart';
import 'package:provider/provider.dart';

class CookBookPage extends StatefulWidget {
  const CookBookPage({Key? key, required this.selected}) : super(key: key);

  final List<List> selected;

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

  final List<String> groupsName = ['FIRST MAIN DISH','SECOND MAIN DISH','SIDE','DESSERT'];

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
  Widget build(BuildContext context) {
    print('${CookBookPage.routename} built');
    return DefaultTabController(
      length: groupsName.length,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(CookBookPage.routename),
        leading: BackButton(
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const IngredientsPage())),
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
                    shrinkWrap: true,
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

                  ListView.builder(
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

                  ListView.builder(
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

                  ListView.builder(
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
  }//_toHomePage



} //HomePage
