// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';
import 'package:flutter_doctors/screens/ingredientspage.dart';
import 'package:flutter_doctors/models/favorites.dart';
import 'package:flutter_doctors/models/cookbook.dart';
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

  List ingredients = []; //selected ingredient

  List<Map> possibleRecipes = []; //used to create the list of shown recipes

  List<Map> items = []; //shown recipes

  // This controller will store the value of the search bar
  TextEditingController editingController = TextEditingController();

  @override

  void initState() { 

    if (ingredients.isEmpty){
      items = recipes;
      items.sort((a, b) => a["name"].compareTo(b["name"]));
    }
    
    
    for (var element in widget.selected[0]){
      ingredients.add(element['name']); //list of selected ingredients (by name)
    }
    //ingredients = widget.selected; 
    //ingredients.sort((a, b) => a["name"].compareTo(b["name"]));

    possibleRecipes = recipes.where((item) => item['ingredients'].keys.toList().any(ingredients.contains)).toList();
    //this line creates items as a list of the recipes that contain at least one of the selected ingredients
    items = possibleRecipes;
    items.sort((a, b) => a["name"].compareTo(b["name"]));

    //we want to sort the list of recipes, 

    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    print('${CookBookPage.routename} built');

    return Scaffold(
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
      ),
      body: Column(
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
            ),
            Expanded(
              child:
              ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext ctx, index) {
                return Card(
                    key: ValueKey(items[index]['name']),
                    margin: const EdgeInsets.all(1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),

                    // The color depends on this is selected or not
                    color: items[index]['isSelected'] == true
                        ? Colors.lightGreen
                        : Colors.white,
                    child: ListTile(
                      onTap: () {
                        // if this item isn't selected yet, "isSelected": false -> true
                        // If this item already is selected: "isSelected": true -> false
                        setState(() {
                          items[index]['isSelected'] = !items[index]['isSelected'];
                        });
                      },

                      //leading: CircleAvatar(
                      //    backgroundColor: Colors.green,
                      //    child: Text(items[index]['id'].toString())),
                      title: Text(items[index]['name']),
                      trailing:  IconButton(
                        icon: Provider.of<Favorites>(context).isExist(recipes[index])
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_border),

                        onPressed: () {
                        // if this item isn't selected yet, "isSaved": false -> true
                        // If this item already is selected: "isSaved": true -> false
                          
                        Provider.of<Favorites>(context, listen: false).toggleFavorite(recipes[index]);
                      
                      },
                    )));
              },
            ),  
            ),
          ],
        ),

    );
  } //build

  void _filterSearchResults(String query) {
  setState(() {
    items = possibleRecipes
        .where((item) => item['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();
    });
  }

  void _toMainNavigator(BuildContext context){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainNavigator()));
  }//_toHomePage



} //HomePage
