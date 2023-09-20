import 'package:flutter/material.dart';
import 'package:nextbus_passenger/colors.dart';
import 'package:nextbus_passenger/componants/button.dart';
import 'package:nextbus_passenger/methods/sizes.dart';
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
             width: 230,
              height: 130,
              child: Image.asset('images/VerLogoBlue.png',)),
          Container(
            height: 500, // Set a fixed height for the PageView
            child: PageView(
              children: [
                Container(
                  height: 500,
                  child: Image.asset('images/CarP1.png'),
                ),
                Container(
                  height: 500,
                  child: Image.asset('images/CarP2.png'),
                ),
                Container(
                  height: 500,
                  child: Image.asset('images/CarP3.png'),
                ),
              ],
            ),
          ),

          SizedBox(height: 20,),

          MyButton(onTap: (){}, childText: 'Create an Account', width: 280,),

          SizedBox(height: 10,),

          SizedBox(width: getPageWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',style: TextStyle(fontSize: 18),),
                TextButton(onPressed: (){}, child: Text('Login',style: TextStyle(fontSize: 18),))
              ],
            ),
          )
        ],
      ),
    );
  }
}
