import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nextbus_passenger/componants/button.dart';
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

  final List<int> amounts = [100, 200, 300, 400, 500, 600];
  int? selectedAmount;
  final otherAmountController = TextEditingController();

  DatabaseReference? newPointsReference;

  @override
  void dispose() {
    otherAmountController.dispose();
    super.dispose();
  }

  Widget amountButton(int amount) {
    bool isSelected = selectedAmount == amount;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: isSelected ? Colors.blue : Colors.grey[300],
        onPrimary: isSelected ? Colors.white : Colors.black,
      ),
      onPressed: () {
        setState(() {
          selectedAmount = amount;
          otherAmountController.clear();
        });
      },
      child: Text('${amount}Pts'),
    );
  }

  void addPoints() {
    int finalAmount =
        selectedAmount ?? int.tryParse(otherAmountController.text) ?? 0;
    print('Selected top-up amount: LKR $finalAmount');
    otherAmountController.clear();
    // Here you can add your code to handle the selected amount.
    newPointsReference = FirebaseDatabase.instance.ref()
        .child("users")
        .child(FirebaseAuth.instance.currentUser!.uid);

    newPointsReference!.child("points").set(finalAmount);

  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColor.iconColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PointsBalance()),
            );
          },
        ),
        title: Text(
          'Point topup',
          style: TextStyle(color: AppColor.iconColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Wrap(
              spacing: 15.0,
              children: amounts.map((amount) => amountButton(amount)).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: otherAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Other Amount',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) {
                setState(() {
                  selectedAmount = null;
                });
              },
            ),
            SizedBox(height: 20),

            MyButton(
              onTap: addPoints,
              childText: 'Submit', width: 200,

            ),
          ],
        ),
      ),
    );
  }
}
