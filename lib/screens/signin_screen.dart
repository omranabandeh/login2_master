import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login2/models/meal.dart';
import 'package:login2/screens/home_screen.dart';
import 'package:login2/screens/signup_screen.dart';
import 'package:login2/screens/tab_screen.dart';
import 'package:login2/screens/ulits_color.dart';
import 'package:login2/reuseabl_widget/reuseable_widget.dart';

class SignInScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  const SignInScreen(List<Meal> favoraiteMeals, {Key? key, required this.favoriteMeal}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor('CB2B93'),
              hexStringToColor('9546C4'),
              hexStringToColor('5E61F4'),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget('assets/logo.png'),
                SizedBox(
                  height: 30,
                ),
                reusableTextField('Enter UserName', Icons.person_outline, false,
                    emailController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    'Enter PassWord', Icons.lock, true, passwordController),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, () {signIn(emailController, passwordController);


                }),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen(favoriteMeal: [],)));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
  signIn(TextEditingController email,TextEditingController password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TabScreen(widget.favoriteMeal)));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: 'your password or email are wrong',gravity: ToastGravity.BOTTOM);
    }
  }
}
