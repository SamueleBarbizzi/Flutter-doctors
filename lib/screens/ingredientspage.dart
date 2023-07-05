// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';
import 'package:flutter_doctors/screens/cookbookpage.dart';
import 'package:flutter_doctors/models/ingredientslist.dart';
import 'package:flutter_doctors/models/groups.dart';


class IngredientsPage extends StatefulWidget {
  const IngredientsPage({Key? key}) : super(key: key);

  static const routename = 'IngredientsPage';

  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  //List of ingredients
  final ingredients = IngredientsList().ingredientslist;
  
  // list of selected ingredients to send to the next page
  List<List> chosen = [];

  // This controller will store the value of the search bar
  //TextEditingController editingController = TextEditingController();

  // Specify the name of the groups in which the ingredients are divided, and create those groups
  final List<String> groupsName = ['FIRST MAIN DISH','SECOND MAIN DISH','SIDE'];
  List<List> groups = Groups().createIngredientsGroups();

  @override
  void initState() {
    for (int i=0; i<groups.length;i++){
      groups[i].sort((a, b) => a["name"].compareTo(b["name"]));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('${IngredientsPage.routename} built');
    return DefaultTabController(
      length: groups.length,
      
      child: Scaffold(
        floatingActionButton:FloatingActionButton(
          onPressed: () {
            //go to recipes page
            _toCookBookPage(context);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.done),
        ),
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
          bottom: const TabBar(
            indicatorWeight: 3,
            tabs: [
              Tab(child: Text('First main dish')),
              Tab(child: Text('Second main dish')),
              Tab(child: Text('Side dish')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
                            shrinkWrap: true,
                            itemCount: groups[0].length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Card(
                                  key: ValueKey(groups[0][index]['name']),
                                  margin: const EdgeInsets.all(1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),

                                  // The color depends on this is selected or not
                                  color: groups[0][index]['isSelected'] == true
                                      ? Colors.lightGreen
                                      : Colors.white,
                                  child: ListTile(
                                    onTap: () {
                                      // if this item isn't selected yet, "isSelected": false -> true
                                      // If this item already is selected: "isSelected": true -> false
                                      setState(() {
                                        groups[0][index]['isSelected'] = !groups[0][index]['isSelected'];
                                      });
                                    },
                                    //leading: CircleAvatar(
                                    //    backgroundColor: Colors.green,
                                    //    child: Text(items[index]['id'].toString())),
                                    title: Text(groups[0][index]['name']),
                                  )
                              );
                          },
                        ),

            ListView.builder(
                            shrinkWrap: true,
                            itemCount: groups[1].length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Card(
                                  key: ValueKey(groups[1][index]['name']),
                                  margin: const EdgeInsets.all(1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),

                                  // The color depends on this is selected or not
                                  color: groups[1][index]['isSelected'] == true
                                      ? Colors.lightGreen
                                      : Colors.white,
                                  child: ListTile(
                                    onTap: () {
                                      // if this item isn't selected yet, "isSelected": false -> true
                                      // If this item already is selected: "isSelected": true -> false
                                      setState(() {
                                        groups[1][index]['isSelected'] = !groups[1][index]['isSelected'];
                                      });
                                    },
                                    //leading: CircleAvatar(
                                    //    backgroundColor: Colors.green,
                                    //    child: Text(items[index]['id'].toString())),
                                    title: Text(groups[1][index]['name']),
                                  )
                              );
                          },
                        ),

            ListView.builder(
                            shrinkWrap: true,
                            itemCount: groups[2].length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Card(
                                  key: ValueKey(groups[2][index]['name']),
                                  margin: const EdgeInsets.all(1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),

                                  // The color depends on this is selected or not
                                  color: groups[2][index]['isSelected'] == true
                                      ? Colors.lightGreen
                                      : Colors.white,
                                  child: ListTile(
                                    onTap: () {
                                      // if this item isn't selected yet, "isSelected": false -> true
                                      // If this item already is selected: "isSelected": true -> false
                                      setState(() {
                                        groups[2][index]['isSelected'] = !groups[2][index]['isSelected'];
                                      });
                                    },
                                    //leading: CircleAvatar(
                                    //    backgroundColor: Colors.green,
                                    //    child: Text(items[index]['id'].toString())),
                                    title: Text(groups[2][index]['name']),
                                  )
                              );
                          },
                        ),
            ],
          ),
        ),
      );

        } //build


            /*Column(
            children: <Widget>[
              // Research bar
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
              ), */
              /*Expanded(
                child:
                // Three groups of dishes: main1, main2 and sides
                ListView.builder(
                  itemCount: groups.length,
                  itemBuilder: (BuildContext context, int sectionIndex) {
                    List section = groups[sectionIndex];
                    String sectionNames = groupsName[sectionIndex];
                    return Container(
                      color: Colors.green,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                          
                          child: Text(
                            sectionNames,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        ),*/
                        //Ingredients for each dish
                        /*Container(
                          //height: 100,
                          child: ListView.builder(
                            controller: scrollController,
                            shrinkWrap: true,
                            itemCount: section.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Card(
                                  key: ValueKey(section[index]['name']),
                                  margin: const EdgeInsets.all(1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),

                                  // The color depends on this is selected or not
                                  color: section[index]['isSelected'] == true
                                      ? Colors.lightGreen
                                      : Colors.white,
                                  child: ListTile(
                                    onTap: () {
                                      // if this item isn't selected yet, "isSelected": false -> true
                                      // If this item already is selected: "isSelected": true -> false
                                      setState(() {
                                        section[index]['isSelected'] = !section[index]['isSelected'];
                                      });
                                    },
                                    //leading: CircleAvatar(
                                    //    backgroundColor: Colors.green,
                                    //    child: Text(items[index]['id'].toString())),
                                    title: Text(section[index]['name']),
                                  )
                              );
                          },
                        ),
                          ),
                        ],
                      )
                    );
              },),),
            ],
            ),
          ],*/     



  void _toMainNavigator(BuildContext context){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainNavigator()));
  }//_toHomePage

  void _toCookBookPage(BuildContext context){

    for (int i=0; i<groups.length;i++){
      chosen[i] = groups[i].where((item) => item['isSelected'] == true).toList();
    }

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CookBookPage( selected: chosen )));
  }//_toHomePage

  /* void _filterSearchResults(String query) {
  setState(() {
    items = ingredients
        .where((item) => item['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();
    });
  } */

} //IngredientsPage


