// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';

class IngredientsPage extends StatefulWidget {
  const IngredientsPage({Key? key}) : super(key: key);

  static const routename = 'IngredientsPage';

  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  //List of ingredients
  final List<Map> ingredients = List.generate(100,
      (index) => {'id': index, 'name': 'Ingredient $index', 'isSelected': false});
  
  List<Map> items = [];

  // This controller will store the value of the search bar
   TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    items = ingredients;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('${IngredientsPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(IngredientsPage.routename),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Info',
            onPressed: () => _toMainNavigator(context),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
              onChanged: (value) {
                _filterSearchResults(value);
              },
                controller: editingController,
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Name of the ingredient...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
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
                      leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Text(items[index]['id'].toString())),
                      title: Text(items[index]['name']),
                    ));
              },
            ),  
            ),
          ],
        ),
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



} //HomePage