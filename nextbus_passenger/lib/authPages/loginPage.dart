import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nextbus_passenger/authPages/createAccountPage.dart';
import 'package:nextbus_passenger/comman_var.dart';
import 'package:nextbus_passenger/pages/homePage.dart';

import '../colors.dart';
import '../componants/button.dart';
import '../componants/imageTile.dart';
import '../componants/loading.dart';
import '../componants/textfeild.dart';
import '../methods/commonMethods.dart';
import '../methods/sizes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailOrPhoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool _showPassword = false;

  CommonMethods cMethods = CommonMethods();

  checkIfNetworkIsAvailable() {
    cMethods.checkConnectivity(context);
    signInFormValidation();
  }

  signInFormValidation() {
    if (!emailOrPhoneController.text.contains('@')) {
      snackBar(context, 'Please enter a valid email', Colors.redAccent);
    } else if (passwordController.text.trim().length < 6) {
      snackBar(context, 'Your password must be 6 or more characters',
          Colors.redAccent);
    } else {
      signInUser();
      // Proceed with the sign-up process as all validations are passed
    }
  }

  signInUser()async{
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          LoadingDialog(messageText: 'Allowing you to login...'),
    );

    final User? userFirebase = (await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: emailOrPhoneController.text.trim(),
      password: passwordController.text.trim(),
    ).catchError((errorMsg){
      Navigator.pop(context);
      snackBar(context, 'Incorrect email or password!', Colors.red);
    })
    ).user;

    if(!context.mounted)return;
    Navigator.pop(context);

    if(userFirebase != null){
      DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users').child(userFirebase.uid);
      userRef.once().then((snap){
        if(snap.snapshot.value!=null){
          if((snap.snapshot.value as Map)['blockStatus']=='no'){
            userName = (snap.snapshot.value as Map)['name'];
            userEmail = (snap.snapshot.value as Map)['email'];
            userPhone = (snap.snapshot.value as Map)['phone'];
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );

        }
          else{
            snackBar(context, 'You are blocked, Contact admin!',
                Colors.redAccent);
            FirebaseAuth.instance.signOut();

          }

        }
        else{
          FirebaseAuth.instance.signOut();
          snackBar(context, 'Your record do not exist as user..',
              Colors.redAccent);
        }
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 230,
                  height: 130,
                  child: Image.asset(
                    'images/VerLogoBlue.png',
                  )),
              SizedBox(
                  width: 200,
                  child: Image.asset(
                    'images/bro.png',
                  )),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: emailOrPhoneController,
                hintText: 'Enter your email',
                obscureText: false,
                suffixIcon: Icon(
                  Icons.person_outline_rounded,
                  color: AppColor.iconColor,
                ), keyboardType: TextInputType.emailAddress,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                child: TextField(
                  controller: passwordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColor.iconColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.textFieldBlue),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10)),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter Your Password',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MyButton(
                  onTap: () {

                    checkIfNetworkIsAvailable();
                  },
                  childText: 'Log In',
                  width: 180),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Image.asset('images/Or.png')),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  SquareTile(imagePath: 'images/Google.png'),

                  SizedBox(width: 15),

                  // apple button
                  SquareTile(imagePath: 'images/Facebook.png')
                ],
              ),
              SizedBox(
                width: getPageWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an Account?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateAccount()),
                          );
                        },
                        child: const Text(
                          'Create an Account',
                          style: TextStyle(fontSize: 18),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
