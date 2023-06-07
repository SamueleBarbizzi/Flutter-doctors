// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';
import 'package:flutter_doctors/screens/cookbookpage.dart';
import 'package:flutter_doctors/models/ingredientslist.dart';


class IngredientsPage extends StatefulWidget {
  const IngredientsPage({Key? key}) : super(key: key);

  static const routename = 'IngredientsPage';

  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  //List of ingredients
  final ingredients = IngredientsList().ingredientslist;
  
  List<Map> items = [];
  List<Map> chosen = [];

  // This controller will store the value of the search bar
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    items = ingredients;
    items.sort((a, b) => a["name"].compareTo(b["name"]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('${IngredientsPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(IngredientsPage.routename),
        leading: BackButton(
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainNavigator())),
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
                    hintText: "Name of the ingredient...",
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
                    ));
              },
            ),  
            ),
          ],
        ),
        floatingActionButton:FloatingActionButton(
        onPressed: () {
          //go to recipes page
          _toCookBookPage(context);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.done),
      ),
    );
  } //build

  void _filterSearchResults(String query) {
  setState(() {
    items = ingredients
        .where((item) => item['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();
    });
  }


  void _toMainNavigator(BuildContext context){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainNavigator()));
  }//_toHomePage

  void _toCookBookPage(BuildContext context){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CookBookPage(selected: chosen = items
        .where((item) => item['isSelected'] == true)
        .toList())));
  }//_toHomePage



} //IngredientsPage