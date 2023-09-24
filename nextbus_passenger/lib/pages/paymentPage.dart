import 'package:flutter/material.dart';
import 'package:nextbus_passenger/componants/navBarPay.dart';
import 'package:nextbus_passenger/methods/sizes.dart';

import '../colors.dart';
import '../componants/navBarHome.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
              color: AppColor.lightBlueBack
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_rounded,color: AppColor.iconColor,)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.5),
                  child: Text('Payment',style: TextStyle(
                    fontSize: 22,
                    color: AppColor.iconColor
                  ),),
                )
              ],
            ),
          )
        ],
      ),

      bottomNavigationBar: MyNavBarPayment(),
    );
  }
}
