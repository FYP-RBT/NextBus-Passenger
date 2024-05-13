import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


import '../methods/commonMethods.dart';
import '../pages/pointsBalancePage.dart';
import 'loading.dart';




class PaymentDialog extends StatefulWidget
{
  String fareAmount;

  PaymentDialog({super.key, required this.fareAmount,});

  @override
  State<PaymentDialog> createState() => _PaymentDialogState();
}



class _PaymentDialogState extends State<PaymentDialog>
{
  CommonMethods cMethods = CommonMethods();
  DatabaseReference? newPointsReference;

  payPoints() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => LoadingDialog(messageText: 'Paying your amount...'),
    );

    try {
      int fareAmount = int.tryParse(widget.fareAmount) ?? 0; // Parse the fare amount
      print('Fare Amount to deduct: $fareAmount');

      DatabaseReference newPointsReference = FirebaseDatabase.instance.ref()
          .child("users")
          .child(FirebaseAuth.instance.currentUser!.uid);

      // Retrieve the current points
      DataSnapshot snapshot = await newPointsReference!.child("points").get();
      int currentPoints = int.tryParse(snapshot.value.toString()) ?? 0;

      if (fareAmount > currentPoints) {
        Navigator.pop(context); // Dismiss the loading dialog
        snackBar(context, 'Not enough points to complete the transaction', Colors.red);
        return;
      }

      int updatedPoints = currentPoints - fareAmount;

      // Set the new points value in the database
      await newPointsReference!.child("points").set(updatedPoints);

      Navigator.pop(context); // Dismiss the loading dialog

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => PointsBalance()),
            (Route<dynamic> route) => false,
      ); // Navigates to PointsBalancePage without allowing a back navigation

      snackBar(context, 'Your payment was successful!', Colors.green.shade500);
    } catch (e) {
      Navigator.pop(context); // Dismiss the loading dialog
      snackBar(context, 'An error occurred during payment', Colors.red);
      print('Error paying points: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.black54,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            const SizedBox(height: 21,),

            const Text(
              "PAY CASH",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 21,),

            const Divider(
              height: 1.5,
              color: Colors.white70,
              thickness: 1.0,
            ),

            const SizedBox(height: 16,),

            Text(
              "Points: ${widget.fareAmount}",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "This is fare amount ( Points: ${widget.fareAmount} ) you have to pay to the driver.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey
                ),
              ),
            ),

            const SizedBox(height: 31,),

            ElevatedButton(
              onPressed: ()
              {
                payPoints();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                "PAY CASH",
              ),
            ),

            const SizedBox(height: 41,)

          ],
        ),
      ),
    );
  }
}


