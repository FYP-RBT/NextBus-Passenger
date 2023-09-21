import 'package:flutter/material.dart';
import 'package:nextbus_passenger/authPages/createAccountPage.dart';
import 'package:nextbus_passenger/colors.dart';
import 'package:nextbus_passenger/componants/button.dart';
import 'package:nextbus_passenger/methods/sizes.dart';

import '../authPages/loginPage.dart';
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
             width: 230,
              height: 130,
              child: Image.asset('images/VerLogoBlue.png',)),
          SizedBox(
            height: 500, // Set a fixed height for the PageView
            child: PageView(
              children: [
                SizedBox(
                  height: 500,
                  child: Image.asset('images/CarP1.png'),
                ),
                SizedBox(
                  height: 500,
                  child: Image.asset('images/CarP2.png'),
                ),
                SizedBox(
                  height: 500,
                  child: Image.asset('images/CarP3.png'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20,),

          MyButton(onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateAccount()),
            );
          }, childText: 'Create an Account', width: 280,),

          const SizedBox(height: 10,),

          SizedBox(width: getPageWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?',style: TextStyle(fontSize: 18),),
                TextButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }, child: const Text('Login',style: TextStyle(fontSize: 18),))
              ],
            ),
          )
        ],
      ),
    );
  }
}
