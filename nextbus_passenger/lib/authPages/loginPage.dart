import 'package:flutter/material.dart';

import '../colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          ],
        ),
      ),

    );
  }
}
