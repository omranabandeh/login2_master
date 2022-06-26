import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login2/models/meal.dart';
import 'package:login2/screens/home_screen.dart';
import 'package:login2/screens/tab_screen.dart';
import 'package:login2/screens/ulits_color.dart';
import 'package:login2/reuseabl_widget/reuseable_widget.dart';

class SignUpScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  const SignUpScreen({Key? key, required this.favoriteMeal}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor('CB2B93'),
          hexStringToColor('9546C4'),
          hexStringToColor('5E61F4'),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              120,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField('Enter UserName', Icons.person_outline, false,
                    userNameController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField('Enter Email Id', Icons.person_outline, false,
                    emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    'Enter Password', Icons.lock, true, passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(
                  context,
                  false,
                  () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailTextController.text,
                            password: passwordTextController.text)
                        .then((value) {
                      print("Created New Error");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TabScreen(widget.favoriteMeal)));
                    }).onError((error, stackTrace) {
                      Fluttertoast.showToast(
                          msg: 'there\'s already an email eith the same name ',
                          gravity: ToastGravity.TOP,
                          backgroundColor: Colors.white70,
                          textColor: Colors.black);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
