import 'package:flutter/material.dart';
import 'package:nextbus_passenger/pages/pointsBalancePage.dart';

import '../colors.dart';
import '../methods/sizes.dart';
import 'homePage.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getPageWidth(context),
        height: 550,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)
        ),
        child: Column(
          children: [
            SizedBox(height: 45,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PointsBalance()),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: AppColor.iconColor,
                      )),
                ),

                Text(
                  'Point Top Up',
                  style: TextStyle(fontSize: 22, color: AppColor.iconColor),
                ),
              ],
            ),



          ],
        ),
      ),
    );
  }
}
