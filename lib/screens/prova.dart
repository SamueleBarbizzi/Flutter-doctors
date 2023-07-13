// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_doctors/models/score_linear_progress.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';

class Prova extends StatefulWidget {
  const Prova({
    Key? key,
    required this.firstDatabaseEntry,
  }) : super(key: key);

  final bool firstDatabaseEntry;

  static const routename = 'Prova';

  @override
  _ProvaState createState() => _ProvaState();
}

class _ProvaState extends State<Prova> {
  @override
  Widget build(BuildContext context) {
    //double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;
    print('${Prova.routename} built');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.done),
        onPressed: () {},
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(Prova.routename),
        leading: BackButton(
          onPressed: () => _toMainNavigator(context),
        ),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 30,
          width: deviceWidth(context),
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                child: Text(
                  'Actual calories count:',
                ),
              ),
              Expanded(
                child: CustomPaint(
                  foregroundPainter: ScoreLinearProgress(
                    backColor: Colors.lightBlueAccent.withOpacity(0.4),
                    frontColor: Colors.lightBlueAccent,
                    strokeWidth: 20,
                    value: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toMainNavigator(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MainNavigator(
              flag: false,
              firstDatabaseEntry: widget.firstDatabaseEntry,
            )));
  } //_toMainNavigator
}