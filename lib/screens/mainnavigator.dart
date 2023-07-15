// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_element, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_doctors/services/apicall.dart';
import 'package:flutter_doctors/services/databasecall.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_doctors/screens/loginpage.dart';
import 'package:flutter_doctors/screens/accountpage.dart';
import 'package:flutter_doctors/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_doctors/screens/visualEditRecipepage.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class MainNavigator extends StatefulWidget {
  final bool firstDatabaseEntry;
  final bool flag;
  const MainNavigator({super.key, required this.firstDatabaseEntry, required this.flag});

  static const routename = 'MainNavigator';

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {

  @override
  void initState() {
    super.initState();
    if (widget.flag == true) {
      _checkExpiredRefreshToken();
    }
  }

  Future<void> _checkExpiredRefreshToken() async {
    bool firstDatabaseEntry = widget.firstDatabaseEntry;

    SharedPreferences sp = await SharedPreferences.getInstance();

    if (JwtDecoder.isExpired(sp.getString('refresh')!)) {
      await sp.remove('access');
      await sp.remove('refresh');

      bool refreshedToken = true;

      bool apiAuth = await ApiCall.requestTokens(context, refreshedToken);
      if (apiAuth == true) {
        await ApiCall.requestData(context, firstDatabaseEntry);
      }
    } else {
      await ApiCall.requestData(context, firstDatabaseEntry);
    }
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _navScreen = [
      HomePage(firstDatabaseEntry: widget.firstDatabaseEntry),
      VisualEditRecipe(),
      AccountPage(firstDatabaseEntry: widget.firstDatabaseEntry, flag: false),
    ];
    print('${MainNavigator.routename} built');
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _navScreen.elementAt(_currentIndex),
        ),
        extendBody: true,
        bottomNavigationBar: DotNavigationBar(
          marginR: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
          paddingR: const EdgeInsets.only(bottom: 8, top: 8),
          borderRadius: 50,
            backgroundColor: Color(0xFF00916E),
            splashColor: Colors.transparent,
            enablePaddingAnimation: false,
            dotIndicatorColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.65),
            currentIndex: _currentIndex,
            onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
            items: [
              DotNavigationBarItem(icon: Icon(LineIcons.home), selectedColor: Colors.white),
              DotNavigationBarItem(icon: Icon(LineIcons.utensils), selectedColor: Colors.white),
              DotNavigationBarItem(icon: Icon(LineIcons.user), selectedColor: Colors.white),
            ],
          ),
      ),
    );
  } //build

  void _toLoginPage(BuildContext context) async {
    await DatabaseCall.deleteAll(context);
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove('username');
    await sp.remove('access');
    await sp.remove('refresh');
    await sp.remove('selectedIndex');
    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()));
  } //_toCalendarPage
} //MainNavigator