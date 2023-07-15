//import 'dart:ffi';

// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctors/models/cookbook.dart';
import 'package:flutter_doctors/models/mealchoice.dart';
import 'package:flutter_doctors/models/personalmeals.dart';
import 'package:provider/provider.dart';
import 'package:flutter_doctors/screens/recipepage.dart';


class VisualEditRecipe extends StatefulWidget {
  const VisualEditRecipe({Key? key}) : super(key: key);

  static const routename = 'My Recipes';

  @override
  _VisualEditRecipeState createState() => _VisualEditRecipeState();
}

class _VisualEditRecipeState extends State<VisualEditRecipe> {

  late Map chosen= Provider.of<MealChoiche>(context, listen: false).chosen;
  late Map personal=Provider.of<MealChoiche>(context, listen: false).personalRecipes;
  late List snacks=Provider.of<MealChoiche>(context, listen: false).snacks;

  List<String> coursesName = ['main1', 'main2', 'side', 'dessert'];
/*   final List<String> groupsName = [
    'FIRST MAIN DISH',
    'SECOND MAIN DISH',
    'SIDE',
    'DESSERT',
  ]; */

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('${VisualEditRecipe.routename} built');
    }
  
    List<Widget> widgetMeals = [];
    Map chosen= Provider.of<MealChoiche>(context, listen: false).chosen;
    Map personal=Provider.of<MealChoiche>(context, listen: false).personalRecipes;
    List snacks=Provider.of<MealChoiche>(context, listen: false).snacks;

    for (var k in ['BREAKFAST','LUNCH','DINNER']) { 
      List recipe = chosen[k].values.toList();
      List recipePersonal = personal[k].values.toList();
      List addRecipe = [];
      List addRecipePersonal = [];
      List<bool> isEmpty = [];
      List<bool> isEmptyPersonal = [];
      int iter = k=='BREAKFAST'? 1 : 4;
      for( int i=0; i< iter; i++) {
        isEmpty.add(recipe[i].isNotEmpty); 
        isEmptyPersonal.add(recipePersonal[i].isNotEmpty); 
        addRecipe.add(recipe[i]);
        addRecipePersonal.add(recipePersonal[i]);
      }
      int lenEmpty = isEmpty.where((x) => x == true).length;
      int lenEmptyPersonal = isEmptyPersonal.where((x) => x == true).length;
      List allRecipe = addRecipe.expand((x) => x).toList();
      List allRecipePersonal = addRecipePersonal.expand((x) => x).toList();
      int lenRecipe=allRecipe.length;
      int lenRecipePersonal=allRecipePersonal.length;
      if (lenEmpty+lenEmptyPersonal!=0) {
        widgetMeals.add(
          Column( children: [ 
            Container( alignment: Alignment.center, 
              width: double.infinity,
              padding: const EdgeInsets.all(3), 
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.grey.shade400, width: 1.0),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [ BoxShadow(
                  color: Colors.grey.shade700,
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: const Offset(-4, -4),
                )],
              ),
              child: Text( k,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color.fromARGB(255, 76, 175, 80)),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: lenRecipePersonal,
              itemBuilder: (BuildContext context, index) { 
                return Card(
                  key: ValueKey(allRecipePersonal[index]['name']),
                  margin: const EdgeInsets.fromLTRB(5,1,5,1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(allRecipePersonal[index]['name']),
                    subtitle: Text('     ${allRecipePersonal[index]['calories']} kcals'),
                    trailing: IconButton(
                                  icon: const Icon(Icons.delete_forever),
                                  onPressed: () {

                                    Provider.of<PersonalMeals>(context, listen: false).
                                    togglePersonalRecipe(k, allRecipePersonal[index]['name']);

                                    Provider.of<MealChoiche>(context,listen: false)
                                    .findAndRemovePersonalRecipe(allRecipePersonal[index]['name']);

                                  setState(() {});
                                  },
                                ),
                  ),
                );
              },
            ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: lenRecipe,
                  itemBuilder: (BuildContext ctx, index) => Card ( 
                    key: ValueKey(allRecipe[index]['name']),
                    child: Tooltip( 
                      message: allRecipe[index]['name'],
                      child: GestureDetector(
                        onTap: () { _showRecipe(
                                    context,
                                    allRecipe[index]['course'][0],
                                    allRecipe[index]);
                          }, 
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                            border: Border.all(color: Colors.grey.shade400, width: 1.0),
                            borderRadius: BorderRadius.circular(8)
                          ), 
                          child: ClipRRect(borderRadius: BorderRadius.circular(10),
                          child: Stack( alignment: Alignment.topRight,
                            children: [Image.network(allRecipe[index]['url']),
                              Container(alignment: Alignment.center, height: 50, width: 50,
                              decoration: BoxDecoration( 
                                            color: Colors.red,
                                            border: Border.all(color: Colors.grey.shade400, width: 1.0),
                                            borderRadius: BorderRadius.circular(8)),               
                                child: IconButton(
                                  icon: const Icon(Icons.delete_forever),
                                  onPressed: () {
                                    if (k == 'BREAKFAST'){
                                      Provider.of<CookBook>(context, listen: false).
                                      toggleRecipe(allRecipe[index]['id']);
                                    }
                                    else{
                                      Provider.of<CookBook>(context, listen: false).
                                      toggleMealRecipe(k, allRecipe[index]['id']);
                                    }
                                    
                                    
                                    Provider.of<MealChoiche>(context,listen: false)
                                    .findAndRemoveChosenRecipe(allRecipe[index]['name']);

                                  setState(() {});
                                  },
                                ),

                              )],
                          ),            
                        ),
                      ),
                    ),
                  ),
                ),
              ),),
            const SizedBox(height: 20,)
          ],),
        );
      }
    }


    int lenSnacks=snacks.length;
    if (lenSnacks!=0) {
      widgetMeals.add(
        Column( children: [ 
          Container( alignment: Alignment.center, 
            width: double.infinity,
            padding: const EdgeInsets.all(3), 
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Colors.grey.shade400, width: 1.0),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [ BoxShadow(
                color: Colors.grey.shade700,
                blurRadius: 6,
                spreadRadius: 2,
                offset: const Offset(-4, -4),
              )],
            ),
            child: const Text( 'SNACK',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color.fromARGB(255, 76, 175, 80)),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: lenSnacks,
            itemBuilder: (BuildContext context, index) { 
              return Card(
                key: ValueKey(snacks[index]['name']),
                margin: const EdgeInsets.fromLTRB(5,1,5,1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  title: Text(snacks[index]['name']),
                  subtitle: Text('     ${snacks[index]['calories']} kcals'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_forever),
                    onPressed: () {
                      Provider.of<MealChoiche>(context,listen: false)
                        .removeSnack(snacks[index]['name']);
                      setState(() {});
                    },
                  )
                ),
              );
            },
          ),
          const SizedBox(height: 20,)
        ],),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: 
          Text(VisualEditRecipe.routename, 
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        /*leading: BackButton(
          onPressed: () => _toMainNavigator(context),
        ),*/
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widgetMeals
        ),
      ),
    );

  }

  void _showRecipe(BuildContext context, String dish, Map recipe) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RecipePage(
              recipe: recipe,
              dish: dish,
            )));
  }

  /*void _toMainNavigator(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MainNavigator(
            firstDatabaseEntry: widget.firstDatabaseEntry, flag: false
            )));
  } //_toMainNavigator*/

}
