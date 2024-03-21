import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nextbus_passenger/comman_var.dart';
import 'package:nextbus_passenger/componants/button.dart';
import 'package:nextbus_passenger/componants/navBarHome.dart';

import '../colors.dart';
import '../methods/sizes.dart';
import 'homePage.dart';
import 'landingPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          Container(
            width: getPageWidth(context),
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColor.lightBlueBack),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: AppColor.iconColor,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.5),
                  child: Text(
                    'Profile',
                    style: TextStyle(fontSize: 22, color: AppColor.iconColor),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey.shade300),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.person_3_rounded,
                      size: 40,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    height: 80,
                    width: 3,
                    color: AppColor.lightBlueBack,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userName,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      Text(userEmail,style: TextStyle(fontSize: 16,),),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          MyButton(onTap: (){
            FirebaseAuth.instance.signOut();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LandingPage()),
            );
          }, childText: 'Logout', width: 200)
        ],
      ),
      bottomNavigationBar: MyNavBar(
        selectedIndex: 3,
      ),
    );
  }
}
