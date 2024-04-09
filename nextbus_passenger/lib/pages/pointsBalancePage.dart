import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nextbus_passenger/componants/button.dart';
import 'package:nextbus_passenger/methods/sizes.dart';
import 'package:nextbus_passenger/pages/topUpPage.dart';

import '../colors.dart';
import 'homePage.dart';

class PointsBalance extends StatefulWidget {
  const PointsBalance({super.key});

  @override
  State<PointsBalance> createState() => _PointsBalanceState();
}

class _PointsBalanceState extends State<PointsBalance> {
  int currentPoints = 0;

  @override
  void initState() {
    super.initState();
    getCurrentPoints();
  }

  Future<void> getCurrentPoints() async {
    DatabaseReference pointsReference = FirebaseDatabase.instance.ref()
        .child("users")
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child("points");

    // Fetch the points from Firebase and update the state
    DataSnapshot snapshot = await pointsReference.get();
    if (snapshot.exists) {
      setState(() {
        currentPoints = int.tryParse(snapshot.value.toString()) ?? 0;
      });
    }
  }

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
                              builder: (context) => HomePage()),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: AppColor.iconColor,
                      )),
                ),
              ],
            ),

            Image.asset('images/pana.png',width: 215,),
            
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text('CURRENT POINTS',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),

            Text('$currentPoints.00',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),

            SizedBox(height: 15,),

            MyButton(onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TopUpPage()),
              );
            }, childText: 'Top up my Points', width: 230)


          ],
        ),
      ),
    );
  }
}
