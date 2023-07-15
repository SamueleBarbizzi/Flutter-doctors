// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, depend_on_referenced_packages, use_build_context_synchronously, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_doctors/screens/loginpage.dart';
import 'package:flutter_doctors/screens/infopage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_doctors/services/databasecall.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';

class AccountPage extends StatefulWidget {
  final bool firstDatabaseEntry;
  final bool flag;
  const AccountPage(
      {super.key, required this.firstDatabaseEntry, required this.flag});

  static const routename = 'Accountpage';

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isObscurePassword = true;
  bool consentChecked = false;

  List genders = ["Male", "Female"];

  List activity = ["Sedentary", "Moderately Active", "Active"];

  int calorieIntake = 0;


  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _dailycalorieintakeController =TextEditingController();
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _consentController = TextEditingController(text: 'false');

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _fullNameController.text = prefs.getString('fullName') ?? '';
      _genderController.text = prefs.getString('gender') ?? '';
      _ageController.text = prefs.getString('age') ?? '';
      _weightController.text = prefs.getString('weight') ?? '';
      _heightController.text = prefs.getString('height') ?? '';
      _activityController.text = prefs.getString('activity') ?? '';
      calorieIntake = prefs.getInt('dailycalorieintake') ?? 0;
      _consentController.text = prefs.getString('consent') ?? 'false';
      consentChecked = prefs.getBool('consentChecked') ?? false;
    });
  }

  void saveUserData() async {
    if (_isFormValid()) {

      if (_dailycalorieintakeController.text.isEmpty){
        calorieIntake = calculateCalorieIntake(
          _genderController.text,
          double.parse(_weightController.text),
          double.parse(_heightController.text),
          int.parse(_ageController.text), _activityController.text).round();
      }
      else{
        calorieIntake = double.parse(_dailycalorieintakeController.text).round();
      }
      print(calorieIntake);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('fullName', _fullNameController.text);
      await prefs.setString('gender', _genderController.text);
      await prefs.setString('age', _ageController.text);
      await prefs.setString('weight', _weightController.text);
      await prefs.setString('height', _heightController.text);
      await prefs.setString('activity', _activityController.text);
      await prefs.setInt('dailycalorieintake', calorieIntake);
      await prefs.setString('consent', _consentController.text);
      await prefs.setBool('consentChecked', consentChecked);



      if (widget.flag == true) {
        _toMainNavigator(context);
      }
      
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all required fields.'),
        ),
      );
    }
    if (!consentChecked) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please accept the consent for data processing'),
      ));
      return;
    }
  }

  bool _isFormValid() {
    // Verifica se tutti i campi di testo obbligatori sono stati compilati correttamente
    return _fullNameController.text.isNotEmpty &&
        _genderController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        _weightController.text.isNotEmpty &&
        _heightController.text.isNotEmpty &&
        _activityController.text.isNotEmpty;
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
            onPressed: () => _toInfoPage(context),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
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
                                  color: Colors.black.withOpacity(0.1))
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/apples.jpg'),
                            ))),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.green),
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
              buildTextField('Full Name*', 'Enter your full name', false, _fullNameController, TextInputType.text),
              buildTextField('Gender*', 'Enter your gender', false, _genderController, TextInputType.number),
              buildTextField('Age*', 'Enter your age', false, _ageController, TextInputType.number),
              buildTextField('Weight*', 'Enter your weight (in Kg)', false, _weightController, TextInputType.number),
              buildTextField('Height*', 'Enter your height (in cm)', false, _heightController, TextInputType.number),
              buildTextField('Your activity level*', 'Enter your activity level', false, _activityController, TextInputType.number),
              buildTextField('Daily calorie intake', 'If left blank, we will calculate it for you!', false, _dailycalorieintakeController, TextInputType.number),
              Text('(Actual calorie intake: $calorieIntake)'),
              SizedBox(height: 20,),
              buildTextField('Consent to the processing of personal data*', '', false, _consentController, TextInputType.number),
              const Center(
                child: SizedBox(
                  height: 20,
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {}); //to be deleted on final implementation
                    saveUserData();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    "SAVE",
                    style: TextStyle(
                        fontSize: 15, letterSpacing: 2, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 150,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          size: 28,
                          color: Colors.white,
                        ),
                        SizedBox(width: 1),
                        Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 34,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.facebook),
              title: Text(
                'Facebook',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                // Open Facebook page
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.instagram),
              title: Text(
                'Instagram',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                // Open Instagram page
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text(
                'Feedback',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                // Open feedback form
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text(
                'Rate us',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                // Open voting page
              },
            ),
            ListTile(
                leading: Icon(Icons.mail),
                title: Text(
                  'Contact support',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  // Open assistance contact
                }),
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Container(
                  color: Colors.red,
                  child: ListTile(
                    leading: Icon(Icons.logout, color: Colors.white),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onTap: (


                    ) => _toLoginPage(context),
                  )),
            )
          ],
        ),
      ),
    );
  }

  //build
  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordtextField, TextEditingController controller, TextInputType keyboard) {
    if (labelText == 'Consent to the processing of personal data*') {
      return CheckboxListTile(
        title: Text(
          labelText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        value: consentChecked,
        onChanged: (bool? value) {
          setState(() {
            consentChecked = value ?? false;
            _consentController.text = consentChecked.toString();
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      );
    } else if (labelText == 'Gender*') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gender*',
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
          ),
          Row(
            children: <Widget>[
              addRadioButton(0, 'Male'),
              addRadioButton(1, 'Female'),
            ],
          ),
        ],
      );
    } else if (labelText == 'Your activity level*') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your activity level*',
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
          ),
          Column(
            children: <Widget>[
              addActivityRadioButton(0, 'Sedentary'),
              addActivityRadioButton(1, 'Moderately Active'),
              addActivityRadioButton(2, 'Active'),
            ],
          ),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: TextField(
            keyboardType: keyboard,
            controller: controller,
            obscureText: isPasswordtextField ? isObscurePassword : false,
            decoration: InputDecoration(
                suffixIcon: isPasswordtextField
                    ? IconButton(
                        icon: const Icon(Icons.remove_red_eye,
                            color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            isObscurePassword = !isObscurePassword;
                          });
                        })
                    : null,
                contentPadding: const EdgeInsets.only(bottom: 5),
                labelText: labelText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: placeholder,
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)
                    )
                  ),
      );
    }
  }

  void _toMainNavigator(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MainNavigator(
            firstDatabaseEntry: widget.firstDatabaseEntry, flag: widget.flag)));
  }

  void _toLoginPage(BuildContext context) async {
    await DatabaseCall.deleteAll(context);
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove('username');
    await sp.remove('access');
    await sp.remove('refresh');
    await sp.remove('selectedIndex');

    final savedMeals = await SharedPreferences.getInstance();
      await savedMeals.remove('chosenMeals');
      await savedMeals.remove('personalMeals');
      await savedMeals.remove('snacks');

    final cookbookStatus = await SharedPreferences.getInstance();
    await cookbookStatus.remove('cookbook');

    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }

//_toLoginPage
  void _toInfoPage(BuildContext context) {
    //Then pop the AccountPage
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => InfoPage()));
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: genders[btnValue],
          groupValue: _genderController.text,
          onChanged: (value) {
            setState(() {
              _genderController.text = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  Row addActivityRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: activity[btnValue],
          groupValue: _activityController.text,
          onChanged: (value) {
            setState(() {
            _activityController.text = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  double calculateCalorieIntake(String gender, double weight, double height, int age, String activity){
    double activityCoefficient = 1;

    if (activity == 'Sedentary'){
      activityCoefficient = 1.2;
    }
    else if (activity == 'Moderately Active'){
      activityCoefficient = 1.3;
    }
    else {
      activityCoefficient = 1.4;
    }
    

    if (gender == 'Male'){
      return (66.5 + (13.8 * weight) + (5 * height) - (6.8 * age))*activityCoefficient;
    }
    else {
      return (655.1 + (9.6 * weight) + (1.9 * height) - (4.7 * age))*activityCoefficient;
    }
  }
} //AccountPage
