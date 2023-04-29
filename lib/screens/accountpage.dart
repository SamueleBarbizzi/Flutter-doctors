// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_doctors/screens/loginpage.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  static const routename = 'Accountpage';

  @override
  Widget build(BuildContext context) {
    print('${AccountPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(AccountPage.routename),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => _toLoginPage(context), //THIS HAS A BUG
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('login_flow'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => _toLoginPage(context),
            ),
          ],
        ),
      ),
    );
    
  } //build

  void _toLoginPage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
  }//_toLoginPage

} //AccountPage