
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nextbus_passenger/colors.dart';
import 'package:nextbus_passenger/methods/sizes.dart';
import 'package:nextbus_passenger/pages/landingPage.dart';
import 'package:nextbus_passenger/pages/pointsBalancePage.dart';
import 'package:nextbus_passenger/pages/startTripPage.dart';

import '../comman_var.dart';
import '../componants/navBarHome.dart';
import '../methods/commonMethods.dart'; // Assuming you have a file called bottomNavBar.dart

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String get userName => "Shahiru Edirisinghe";
  final destinationController = TextEditingController();

  void initState() {
    super.initState();
    getUserInfoAndCheckBlockStatus();
  }
  
  getUserInfoAndCheckBlockStatus() async{
    DatabaseReference userRef = FirebaseDatabase.instance.ref()
        .child('users')
        .child(FirebaseAuth.instance.currentUser!.uid);

    await userRef.once().then((snap){
      if(snap.snapshot.value!=null){
        if((snap.snapshot.value as Map)['blockStatus']=='no'){
          setState(() {
            userName = (snap.snapshot.value as Map)['name'];
            userEmail = (snap.snapshot.value as Map)['email'];
            userPhone = (snap.snapshot.value as Map)['phone'];
          });

        }
        else{
          snackBar(context, 'You are blocked, Contact admin!',
              Colors.redAccent);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LandingPage()),
          );

          FirebaseAuth.instance.signOut();

        }

      }
      else{
        FirebaseAuth.instance.signOut();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LandingPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: getPageWidth(context),
              height: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColor.lightBlueBack),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'images/colorLogo.png',
                    width: 250,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          'Welcome!',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 5),
                        child: Text(userName,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StarTripPage(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'images/StartTripButton.png',
                    width: 130,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    // Define the action on tap
                  },
                  child: Image.asset(
                    'images/FavouritesButton.png',
                    width: 130,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            // Row for Payment and Settings Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PointsBalance(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'images/PaymentButton.png',
                    width: 130,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    // Define the action on tap
                  },
                  child: Image.asset(
                    'images/SettingsButton.png',
                    width: 130,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: Text(
                    'Where are you going?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 45),
              child: TextField(
                controller: destinationController,
                obscureText: false,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.background),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    hintText: 'Enter your Destination!',
                    hintStyle: TextStyle(color: Colors.grey[500])),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyNavBar(selectedIndex: 0,),
    );
  }
}
