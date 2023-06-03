// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_doctors/screens/loginpage.dart';
import 'package:flutter_doctors/screens/infopage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  static const routename = 'Accountpage';

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  
  bool isObscurePassword =true;
  

  final TextEditingController _fullNameController = TextEditingController();
   final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _improvementGoalController = TextEditingController();
  final TextEditingController _foodIntoleranceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _fullNameController.text = prefs.getString('fullName') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _genderController.text = prefs.getString('gender') ?? '';
      _ageController.text = prefs.getString('age') ?? '';
      _improvementGoalController.text = prefs.getString('improvementGoal') ?? '';
      _foodIntoleranceController.text = prefs.getString('foodIntolerance') ?? '';
    });
  }

  void saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', _fullNameController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);
    await prefs.setString('gender', _genderController.text);
    await prefs.setString('age', _ageController.text);
    await prefs.setString('improvementGoal', _improvementGoalController.text);
    await prefs.setString('foodIntolerance', _foodIntoleranceController.text);
  }
  
  
  @override
  Widget build(BuildContext context) {
    print('${AccountPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(AccountPage.routename),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            tooltip: 'Info',
            onPressed: () => _toInfoPage(context), //THIS HAS A BUG
          ),
        ],
      ),

      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1)
                        )
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/apples.jpg'),
                      )

                    )
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0, 
                   child: Container(
                     height: 40,
                     width: 40,
                     decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4,
                        color: Colors.white
                      ),
                      color: Colors.green
                     ),

                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                     ),
                  
                    ),
                    ),
                ],
              ),
            ),
           const SizedBox(height: 30),
           buildTextField('Full Name', 'Enter your full name', false, _fullNameController),
           buildTextField('Email', 'Enter your email', false, _emailController),
           buildTextField('Password', 'Enter your password', true, _passwordController),         
           buildTextField('Gender', 'Enter your gender', false, _genderController),
           buildTextField('Age', 'Enter your age', false, _ageController),
           buildTextField('Improvement goal', 'Enter your improvement goal', false,  _improvementGoalController),
           buildTextField('Food intolerances/allergy', 'Enter your food intolerances/allergy', false,  _foodIntoleranceController),           
          
                const Center(
                  child: SizedBox(
                  height:20,
                  ),
                ),

                Center(
                  child: ElevatedButton(
                onPressed: () {
                  saveUserData();

               },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  shape: RoundedRectangleBorder(borderRadius : BorderRadius.circular(20))
                ),
                
                  child: const Text("SAVE", style: TextStyle(
                  fontSize:15,
                  letterSpacing: 2,
                  color: Colors.white
                ),),
                ),
               )             
         ],
        )
        )
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
    
  } 
 //build
  Widget buildTextField( String labelText, String placeholder, bool isPasswordtextField, TextEditingController controller,) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child:    TextField( 
      controller: controller, 
      obscureText: isPasswordtextField ? isObscurePassword : false,
      decoration: InputDecoration(
      suffixIcon: isPasswordtextField ?  
        IconButton(
          icon: const Icon( Icons.remove_red_eye, color: Colors.grey),
            onPressed: () {
              setState((){
                isObscurePassword = !isObscurePassword;
              });
            }      
        ): null, 
      contentPadding: const EdgeInsets.only(bottom: 5),
      labelText: labelText,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: placeholder,
      hintStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey
      )

      )
    ),
    );
  }

  void _toLoginPage(BuildContext context) async{
    //Unset the 'username' filed in SharedPreference 
    final sp = await SharedPreferences.getInstance();
    sp.remove('username'); 
    
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
  }
//_toLoginPage
    void _toInfoPage(BuildContext context){
    //Then pop the AccountPage
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => InfoPage()));
  }} //AccountPage