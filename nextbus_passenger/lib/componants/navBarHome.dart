import 'package:flutter/material.dart';
import 'package:nextbus_passenger/colors.dart';
import 'package:nextbus_passenger/pages/startTripPage.dart';

import '../pages/homePage.dart';
import '../pages/paymentPage.dart';

class MyNavBarHome extends StatefulWidget {
  const MyNavBarHome({super.key});

  @override
  State<MyNavBarHome> createState() => _MyNavBarHomeState();
}

class _MyNavBarHomeState extends State<MyNavBarHome> {
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
            child: FloatingActionButton(
                backgroundColor: AppColor.iconColor, child: Icon(Icons.location_on), elevation: 0.1,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapView(),
                    ),
                  );
                }),
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
                    color:  AppColor.iconColor,
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
                      color:  Colors.grey.shade400,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(),
                        ),
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


class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

