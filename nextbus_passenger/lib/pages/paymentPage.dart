import 'package:flutter/material.dart';
import 'package:nextbus_passenger/componants/navBarPay.dart';
import 'package:nextbus_passenger/methods/sizes.dart';
import 'package:nextbus_passenger/pages/homePage.dart';
import 'package:nextbus_passenger/pages/topUpPage.dart';

import '../colors.dart';
import '../componants/navBarHome.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

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
                          MaterialPageRoute(
                              builder: (context) => HomePage()),
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
                    'Payment',
                    style: TextStyle(fontSize: 22, color: AppColor.iconColor),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Transform.scale(
                  scale: 35 / 24.0,
                  child: Checkbox(
                    value: isChecked1,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked1 = value ?? false;
                        print('isChecked1: $isChecked1');
                      });
                    },
                    activeColor: Colors.white, // Change the checkbox color
                    checkColor:
                        AppColor.iconColor, // Change the checkmark color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Change the shape to rounded rectangle
                      side: BorderSide(
                          color: AppColor.iconColor), // Change the border color
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Image.asset(
                    'images/cash.png',
                    height: 30,
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 2,
            height: 30,
            indent: 25,
            endIndent: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Transform.scale(
                  scale: 35 / 24.0,
                  child: Checkbox(
                    value: isChecked2,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked2 = value ?? false;
                        print('isChecked2: $isChecked2');
                      });
                    },
                    activeColor: Colors.white, // Change the checkbox color
                    checkColor:
                        AppColor.iconColor, // Change the checkmark color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Change the shape to rounded rectangle
                      side: BorderSide(
                          color: AppColor.iconColor), // Change the border color
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7.0),
                  child: Image.asset(
                    'images/points.png',
                    height: 28,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TopUpPage()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey.shade500,
                    ))
              ],
            ),
          ),
          Divider(
            thickness: 2,
            height: 30,
            indent: 25,
            endIndent: 25,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Transform.scale(
                  scale: 35 / 24.0,
                  child: Checkbox(
                    value: isChecked3,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked3 = value ?? false;
                        print('isChecked3: $isChecked3');
                      });
                    },
                    activeColor: Colors.white, // Change the checkbox color
                    checkColor:
                    AppColor.iconColor, // Change the checkmark color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Change the shape to rounded rectangle
                      side: BorderSide(
                          color: AppColor.iconColor), // Change the border color
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7.0,right: 11),
                  child: Image.asset(
                    'images/card.png',
                    height: 28,
                  ),
                ),


                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey.shade500,
                    ))
              ],
            ),
          ),
          Divider(
            thickness: 2,
            height: 30,
            indent: 25,
            endIndent: 25,
          ),

          Row(
            children: [
              SizedBox(width: 25,),
              TextButton(
                  onPressed: (){},
                  child: Text('Add payment method   +',style: TextStyle(fontSize: 18),)),
            ],
          )
        ],
      ),
      bottomNavigationBar: MyNavBarPayment(),
    );
  }
}
