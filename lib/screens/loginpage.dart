import 'package:flutter/material.dart';
import 'package:flutter_doctors/screens/homepage.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routename = 'LoginPage';
  final String email = 'admin@admin.com';
  final String password = 'admin';

  Future<String> _loginUser(LoginData data) async {
    if(data.name == email && data.password == password){
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
      onLogin: _loginUser,
      onSignup: _signUpUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () async{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
      },
    );
  } // build
} // LoginScreen