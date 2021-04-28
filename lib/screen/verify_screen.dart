import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:haggle_x/utils/colors.dart';
import 'package:haggle_x/widgets/custom_textField.dart';

class VerifyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left:36.0, top: 50, bottom: 35),
                  child: SvgPicture.asset('assets/images/back_arrow.svg'),
                ),

                Container(
                  margin: EdgeInsets.only(left:44,bottom: 33 ),
                  child: Text(
                    'Verify your account',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: kWhiteColor,

                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 12),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 13, right: 12),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Gap(40),
                          SvgPicture.asset('assets/images/check.svg'),
                           Gap(35),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 52),
                            child: Text('We just sent a verification code to your email. Please enter the code',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                            ),),
                          ),
                          //Gap(40),
                          Padding(
                            padding: const EdgeInsets.only(left: 38,right: 38,top: 30, bottom: 30),
                            child: CustomTextField(
                              labelText: 'Verification code',
                              keyBoardType: TextInputType.number,

                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 42),
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(6)),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  //stops: [0.1, 0.5, 0.7, 0.9],
                                  colors: [Color(0xffF432B7B), Color(0xff6A4BBC)],
                                ),
                              ),
                              child: Text(
                                'VERIFY ME',
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          Gap(20),

                          Text(
                            'This code will expire in 10 minutes',
                            style: TextStyle(
                              fontSize: 9
                            ),
                          ),



                          Gap(20),

                          Text('Resend Code',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              decoration: TextDecoration.underline
                            ),
                              ),
                          Gap(30),


                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
