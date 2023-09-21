import 'package:flutter/material.dart';
import 'package:nextbus_passenger/colors.dart';
import 'package:nextbus_passenger/componants/textfeild.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
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
              hintText: 'Enter Your Name',
              obscureText: true,
              suffixIcon: Icon(Icons.person_2_rounded),)
          ],
        ),
      ),
    );
  }
}
