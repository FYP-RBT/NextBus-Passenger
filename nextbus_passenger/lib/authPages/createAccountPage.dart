import 'package:flutter/material.dart';
import 'package:nextbus_passenger/authPages/loginPage.dart';
import 'package:nextbus_passenger/colors.dart';
import 'package:nextbus_passenger/componants/button.dart';
import 'package:nextbus_passenger/componants/textfeild.dart';
import 'package:nextbus_passenger/methods/commonMethods.dart';

import '../componants/imageTile.dart';
import '../methods/sizes.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final enterNameController = TextEditingController();
  final enterEmailController = TextEditingController();
  final enterMobileNumberController = TextEditingController();
  final enterPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _showPassword = false;

  CommonMethods cMethods = CommonMethods();

  checkIfNetworkIsAvailable(){
    cMethods.checkConnectivity(context);
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical:5 ),
                child: TextField(
                  controller: enterNameController,
                  obscureText: false,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.person_3_outlined,
                        color: AppColor.iconColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.textFieldBlue),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10)),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter Your Name',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical:5 ),
                child: TextField(
                  controller: enterEmailController,
                  obscureText: false,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.email_outlined,color: AppColor.iconColor,),
                      enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.textFieldBlue),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter Your Email',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical:5 ),
                child: TextField(
                  controller: enterMobileNumberController,
                  obscureText: false,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.phone_android_rounded,color: AppColor.iconColor,),
                      enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.textFieldBlue),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter Your Mobile Number',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical:5 ),
                child: TextField(
                  controller: enterPasswordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword ? Icons.visibility : Icons.visibility_off,color: AppColor.iconColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                      enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.textFieldBlue),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter Your Password',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical:5 ),
                child: TextField(
                  controller: confirmPasswordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword ? Icons.visibility : Icons.visibility_off,color: AppColor.iconColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                      enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.textFieldBlue),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Confirm Your Password',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
              ),


              SizedBox(
                height: 25,
              ),
              MyButton(onTap: () {
                checkIfNetworkIsAvailable();

              }, childText: 'Sign Up', width: 180),
              SizedBox(
                height: 25,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Image.asset('images/Or.png')),
              SizedBox(
                height: 20,
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
                    const Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
