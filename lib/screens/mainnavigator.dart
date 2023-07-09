// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_doctors/services/apicall.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_doctors/screens/loginpage.dart';
import 'package:flutter_doctors/screens/accountpage.dart';
import 'package:flutter_doctors/screens/favoritespage.dart';
import 'package:flutter_doctors/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainNavigator extends StatefulWidget {

  final bool firstDatabaseEntry;
  const MainNavigator({super.key, required this.firstDatabaseEntry});
  

  static const routename = 'MainNavigator';

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}


class _MainNavigatorState extends State<MainNavigator> {
  

  @override
  void initState() {
    super.initState();
    _checkExpiredRefreshToken();
  }

  Future<void> _checkExpiredRefreshToken() async {
    bool firstDatabaseEntry = widget.firstDatabaseEntry;

    SharedPreferences sp = await SharedPreferences.getInstance();

        if(JwtDecoder.isExpired(sp.getString('refresh')!)){
          await sp.remove('access');
          await sp.remove('refresh');

          bool refreshedToken = true;

          bool apiAuth = await ApiCall.requestTokens(context, refreshedToken);
          if(apiAuth == true){
            await ApiCall.requestData(context, firstDatabaseEntry); 
          }
        }
        else{
          await ApiCall.requestData(context, firstDatabaseEntry);
        }
    

  }


  int _currentIndex = 0;
  final PageController _pageController = PageController();


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
    final List<Widget> _screens = [
    HomePage(firstDatabaseEntry: widget.firstDatabaseEntry),
    FavoritesPage(),
    AccountPage(),
  ];
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
            icon: Icon(MdiIcons.heart),
            label: 'Favorite'
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.account),
            label: 'Profile',
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 14, 75, 16),
        // selectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: const IconThemeData(color: Colors.white70),
        unselectedItemColor: Colors.white70,        
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