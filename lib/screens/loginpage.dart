// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';
import 'package:flutter_doctors/services/apicall.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routename = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    //Check if the user is already logged
    _checkIfLogged();
  } //initState

  void _checkIfLogged() async {
    //Get the SharedPreference instance and check if the value of the 'username' filed is set or not
    final sp = await SharedPreferences.getInstance();
    if (sp.getString('username') != null) {
      //If 'username' is set, go to MainNavigator
      _toMainNavigator(context, firstDatabaseEntry: false);
    } //if
  } //_checkIfLogged

  Future<String> _loginUser(LoginData data) async {
    const String email = 'admin@admin.com';
    const String password = 'admin';

    if (data.name == email && data.password == password) {
      bool refreshedToken = false;
      bool apiAuth = await ApiCall.requestTokens(context, refreshedToken);
      if (apiAuth == true) {
        final sp = await SharedPreferences.getInstance();
        sp.setString('username', data.name);
      }

      return '';
    } else {
      return 'Wrong credentials';
    }
  } // _loginUser

  Future<String> _signUpUser(SignupData data) async {
    return 'Not implemented';
  } // _signUpUser

  Future<String> _recoverPassword(String email) async {
    return 'Recover password functionality needs to be implemented';
  } // _recoverPassword

  @override
  Widget build(BuildContext context) {
    const inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );

    return FlutterLogin(
      title: 'Welcome!',
      // logo: const AssetImage('assets/images/logo.png'),
      theme: LoginTheme(
        primaryColor: Colors.green,
        accentColor: Colors.black,
        errorColor: Colors.deepOrange,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Quicksand',
          letterSpacing: 1,
        ),
        bodyStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
        textFieldStyle: const TextStyle(
          color: Colors.black,
          //shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
        ),
        buttonStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 5,
          margin: EdgeInsets.only(top: 15),
          //shape: ContinuousRectangleBorder(
          //    borderRadius: BorderRadius.circular(100.0)),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.purple.withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: const TextStyle(
            backgroundColor: Colors.red,
            color: Colors.white,
          ),
          labelStyle: const TextStyle(fontSize: 12),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade700, width: 4),
            borderRadius: inputBorder,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade400, width: 5),
            borderRadius: inputBorder,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700, width: 7),
            borderRadius: inputBorder,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade400, width: 8),
            borderRadius: inputBorder,
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 5),
            borderRadius: inputBorder,
          ),
        ),
        buttonTheme: const LoginButtonTheme(
          splashColor: Colors.blue,
          backgroundColor: Colors.green,
          highlightColor: Colors.lightGreen,
          elevation: 9.0,
          highlightElevation: 6.0,
          //shape: BeveledRectangleBorder(
          //  borderRadius: BorderRadius.circular(10),
          //),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          // shape: CircleBorder(side: BorderSide(color: Colors.green)),
          // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
        ),
      ),
      onLogin: _loginUser,
      onSignup: _signUpUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () async {
        _toMainNavigator(context);
      },
    );
  } // build

  void _toMainNavigator(BuildContext context,
      {bool firstDatabaseEntry = true}) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>
            const MainNavigator(flag: false, firstDatabaseEntry: true,)));
  } //_toHomePage
} // LoginScreen