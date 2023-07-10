// ignore_for_file: avoid_print, depend_on_referenced_packages, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key, required this.recipe, required this.dish})
      : super(key: key);

  final Map recipe;
  final String dish;

  static const routename = 'RecipePage';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('${RecipePage.routename} built');
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(onPressed: () {
            _toCookBookPage(context);
          }),
          title: const Text(RecipePage.routename),
          centerTitle: true),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
            margin: const EdgeInsets.only(top: 3),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400, width: 1.0),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade700,
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: const Offset(-4, -4),
                  )
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: Text(recipe['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                  color: Color.fromARGB(255, 76, 175, 80))),
                        ),
                        Text(dish,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey[850])),
                      ]),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Container(
                      //color: Colors.brown,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(MdiIcons.fire,
                              color: Colors.orange, size: 30),
                          Row(children: [
                            Text(recipe['calories'].toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 76, 175, 80))),
                            const Text(" kcals",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
          /* Container( height: 300, //width: 400,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage('assets/images/recipe1.jpg'), 
                  fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10))
              ), */
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400, width: 1.0),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade700,
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: const Offset(-4, -4),
                  )
                ]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(recipe['url'])),
          ),
          const SizedBox(height: 15),
          Container(
            width: 450,
            padding: const EdgeInsets.fromLTRB(
                10, 5, 5, 5), //margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400, width: 1.0),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade700,
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: const Offset(-4, -4),
                  )
                ]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Ingredients:",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      //height: 10,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color.fromARGB(255, 76, 175, 80))),
              const SizedBox(height: 5),
              Text(
                  "\u2022'Saffron': '1/2 tsp', \n\u2022'Rice': ' 80g',\n\u2022'Butter': '35g',\n\u2022'Onion': '1/2',\n\u2022'Grana Padano cheese': '20g',\n\u2022'White wine': '10g',\n\u2022'Water': 'to taste',\n\u2022'Vegetable stock': '1/2L',\n\u2022'Salt': 'to taste'",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      height: 1.2, fontSize: 20, color: Colors.grey[850])),
            ]),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400, width: 1.0),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade700,
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: const Offset(-4, -4),
                  )
                ]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Preparation:",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color.fromARGB(255, 76, 175, 80))),
              const SizedBox(height: 5),
              Text(recipe['preparation'],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      height: 1.2, fontSize: 20, color: Colors.grey[850])),
            ]),
          ),
          const SizedBox(height: 100)
        ]),
      )),
    );
  }

  void _toCookBookPage(BuildContext context) {
    Navigator.of(context).pop();
  } //_toMainNavigator
}
