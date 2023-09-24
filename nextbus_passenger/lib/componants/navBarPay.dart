import 'package:flutter/material.dart';

import '../colors.dart';
import '../pages/homePage.dart';
import '../pages/paymentPage.dart';
import 'navBarHome.dart';

class MyNavBarPayment extends StatefulWidget {
  const MyNavBarPayment({super.key});

  @override
  State<MyNavBarPayment> createState() => _MyNavBarPaymentState();
}

class _MyNavBarPaymentState extends State<MyNavBarPayment> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 80,
      child: Stack(
        clipBehavior: Clip.none, children: [
        CustomPaint(
          size: Size(size.width, 80),
          painter: BNBCustomPainter(),
        ),
        Center(
          heightFactor: 0.6,
          child: FloatingActionButton(backgroundColor: AppColor.iconColor, child: Icon(Icons.location_on), elevation: 0.1, onPressed: () {}),
        ),
        Container(
          width: size.width,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color:  Colors.grey.shade400,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage()),
                  );

                },
                splashColor: Colors.white,
              ),
              IconButton(
                  icon: Icon(
                    Icons.dashboard_rounded,
                    color:  Colors.grey.shade400,
                  ),
                  onPressed: () {

                  }),
              Container(
                width: size.width * 0.20,
              ),
              IconButton(
                  icon: Icon(
                    Icons.attach_money_rounded,
                    color:  AppColor.iconColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentPage()),
                    );

                  }),
              IconButton(
                  icon: Icon(
                    Icons.person_2_rounded,
                    color:  Colors.grey.shade400,
                  ),
                  onPressed: () {

                  }),
            ],
          ),
        )
      ],
      ),
    );
  }
}
