// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_doctors/screens/infopage.dart';
import 'package:flutter_doctors/models/favorites.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({Key? key}) : super(key: key);

  static const routename = 'Favorites';

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  //IMPORTANTE: LA BARRA DI RICERCA HA UN BUG: SI SMINCHIA TUTTO QUANDO SI ELIMINA DAI PREFERITI UNA COSA CHE SI STA CERCANDO
  //COMMENTO LA BARRA DI RICERCA PER IL MOMENTO


  // This controller will store the value of the search bar
  //TextEditingController editingController = TextEditingController();


  

  List<Map> items = [];

  @override
  void initState() {
    items = Provider.of<Favorites>(context, listen: false).favorites;
    items.sort((a, b) => a["name"].compareTo(b["name"]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('${FavoritesPage.routename} built');

    final List<Map> favorites = Provider.of<Favorites>(context).favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text(FavoritesPage.routename),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            tooltip: 'Info',
            onPressed: () => _toInfoPage(context),
          ),
        ],
      ),
      body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              /*child: TextField(
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
              ),*/
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

                    color: Colors.white,
                    child: ListTile(
                      onTap: () {
                        //open the recipe on tap
                        //TO BE IMPLEMENTED
                      },
                      //leading: CircleAvatar(
                      //    backgroundColor: Colors.green,
                      //    child: Text(context.watch<Favorites>().favorites[index]['id'].toString())),
                      title: Text(items[index]['name']),
                      trailing:  IconButton(
                        icon: Provider.of<Favorites>(context).isExist(items[index])
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_border),
                        onPressed: () {
                          Provider.of<Favorites>(context, listen: false).toggleFavorite(favorites[index]);
                      },
                    )
                    ));
              },
            ),  
            ),
          ],
        ),
    );
  } //build

  /*void _filterSearchResults(String query) {
  setState(() {
    items = Provider.of<Favorites>(context, listen: false).favorites
        .where((item) => item['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();
    });
  }*/


  void _toInfoPage(BuildContext context){
    //Then pop the FoodStoragePage
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => InfoPage()));
  }//_toInfoPage

} //FoodStorage