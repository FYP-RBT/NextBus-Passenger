import 'package:flutter/material.dart';

import '../colors.dart';
import '../componants/button.dart';
import '../componants/imageTile.dart';
import '../componants/textfeild.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailOrPhoneController = TextEditingController();
  final passwordController = TextEditingController();

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
                  child: Image.asset('images/VerLogoBlue.png',)),

              SizedBox(
                  width: 250,
                  child: Image.asset('images/bro.png',)),

              const SizedBox(
                height: 20,
              ),

              MyTextField(
                controller: emailOrPhoneController,
                hintText: 'Email or Phone Number',
                obscureText: false,
                suffixIcon: Icon(Icons.person_outline_rounded,color: AppColor.iconColor,),),

              MyTextField(
                controller:passwordController,
                hintText: 'Enter Your Password',
                obscureText: true,
                suffixIcon: Icon(Icons.password_outlined,color: AppColor.iconColor,),),

              const SizedBox(
                height: 20,
              ),

              MyButton(onTap: (){}, childText: 'Log In', width: 180),

              SizedBox(height: 25,),

              Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Image.asset('images/Or.png')),

              SizedBox(height: 20,),

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


            ],
          ),
        ),
      ),

    );
  }
}
