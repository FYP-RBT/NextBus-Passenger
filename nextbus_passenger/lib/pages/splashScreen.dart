import 'package:flutter/material.dart';
import 'package:nextbus_passenger/colors.dart';
import 'package:nextbus_passenger/pages/landingPage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Add any necessary initialization code here
    // For example, you can load data or perform any other tasks
    // that need to be done before showing the main screen.

    // Simulate a delay of 3 seconds using a Future.delayed
    Future.delayed(Duration(seconds: 5), () {
      // After the delay, navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.background,
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/fullLogo.png',
              height: 400,
              width: 400,),

            SizedBox(
              height: 50,
            ),

            Image.asset('images/busGif.gif',
              height: 200,
              width: 200,),
          ],
        ),
      ),
    );
  }
}
