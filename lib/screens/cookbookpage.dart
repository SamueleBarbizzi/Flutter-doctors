// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';
import 'package:flutter_doctors/screens/ingredientspage.dart';

class CookBookPage extends StatefulWidget {
  const CookBookPage({Key? key, required this.selected}) : super(key: key);

  final List<Map> selected;

  static const routename = 'CookBookPage';

  @override
  _CookBookPageState createState() => _CookBookPageState();
}

class _CookBookPageState extends State<CookBookPage> {
  //List of recipes
  final List<Map> recipes = List.generate(100,
      (index) => {'id': index, 'name': 'Recipe $index', 'isSelected': false});
  
  List<Map> items = [];
  // This controller will store the value of the search bar
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    items = widget.selected;
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
        /*floatingActionButton:FloatingActionButton(
        onPressed: () {
          //go to recipes page
          _toCookBookPage(context);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.done),
      ),*/
    );
  } //build

  void _filterSearchResults(String query) {
  setState(() {
    items = recipes
        .where((item) => item['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();
    });
  }

  void _toMainNavigator(BuildContext context){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainNavigator()));
  }//_toHomePage



} //HomePage
