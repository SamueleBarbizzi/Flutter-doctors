// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_element

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_doctors/screens/loginpage.dart';
import 'package:flutter_doctors/screens/accountpage.dart';
import 'package:flutter_doctors/screens/foodstoragepage.dart';
import 'package:flutter_doctors/screens/homepage.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  static const routename = 'MainNavigator';

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}


class _MainNavigatorState extends State<MainNavigator> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    const HomePage(),
    FoodStoragePage(),
    AccountPage(),
  ];

  void _onPageChanged(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int value){
    _pageController.jumpToPage(value);
  }

  @override
  Widget build(BuildContext context) {
    print('${MainNavigator.routename} built');
    return Scaffold(
      body: 
      PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('user1'),
            ),
            ListTile(
              leading:  const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => _toLoginPage(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.foodForkDrink),
            label: 'Food Storage',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.account),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors.blue,
        // selectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: Colors.black),
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: const IconThemeData(color: Colors.black38),
        unselectedItemColor: Colors.black38,        
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
      ),
    );
  } //build

  void _toLoginPage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
  }//_toCalendarPage

  void _toInfoPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: ((context) => AccountPage())));
  }

} //MainNavigator