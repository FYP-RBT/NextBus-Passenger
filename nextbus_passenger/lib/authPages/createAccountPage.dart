import 'package:flutter/material.dart';
import 'package:nextbus_passenger/colors.dart';
import 'package:nextbus_passenger/componants/button.dart';
import 'package:nextbus_passenger/componants/textfeild.dart';

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

              MyTextField(
                controller: enterNameController,
                hintText: 'Enter Your Name',
                obscureText: false,
                suffixIcon: Icon(Icons.person_2_rounded,color: AppColor.iconColor,),),

              MyTextField(
                controller: enterEmailController,
                hintText: 'Enter Your Email',
                obscureText: false,
                suffixIcon: Icon(Icons.email_outlined,color: AppColor.iconColor,),),

              MyTextField(
                controller:enterMobileNumberController,
                hintText: 'Enter Your Mobile Number',
                obscureText: false,
                suffixIcon: Icon(Icons.phone_android_rounded,color: AppColor.iconColor,),),

              MyTextField(
                controller:enterPasswordController,
                hintText: 'Enter Your Password',
                obscureText: true,
                suffixIcon: Icon(Icons.password_outlined,color: AppColor.iconColor,),),

              MyTextField(
                controller:confirmPasswordController,
                hintText: 'Confirm Your Password',
                obscureText: true,
                suffixIcon: Icon(Icons.password_outlined,color: AppColor.iconColor,),),

              SizedBox(height: 25,),

              MyButton(onTap: (){}, childText: 'Sign Up', width: 180),

              SizedBox(height: 25,),
              
              Padding(padding: EdgeInsets.symmetric(horizontal: 25),
              child: Image.asset('images/Or.png')),

              SizedBox(width: getPageWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?',style: TextStyle(fontSize: 18),),
                    TextButton(onPressed: (){}, child: const Text('Login',style: TextStyle(fontSize: 18),))
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
