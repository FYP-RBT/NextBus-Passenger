import 'package:flutter/material.dart';
import 'package:nextbus_passenger/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBlueBack,

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Image.asset('images/colorLogo.png',width: 250,),
            
          ],
        ),
      ),

    );
  }
}
