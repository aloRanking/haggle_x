import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:haggle_x/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset('assets/images/app_logo.png'),

                Gap(14),

                Text('HaggleX',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: kWhiteColor
                ),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
