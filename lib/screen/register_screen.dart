import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:haggle_x/utils/colors.dart';
import 'package:haggle_x/widgets/custom_textField.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(50),
              SvgPicture.asset('assets/images/back_arrow.svg'),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 15, top: 20),
                child: Card(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(50),
                        Container(
                          margin: EdgeInsets.only(left: 27),

                          child: Text(
                            'Create a new account',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 34),
                          child: Form(
                            child: Column(
                                children: [
                                  CustomTextField(
                                    labelText: 'Email Address',
                              keyBoardType: TextInputType.emailAddress,
                                    onValidate: (value) {
                                      if (value.isEmpty) {
                                        return 'Email field can\'t be blank';
                                      }
                                      return null;
                                    },

                                  ),
                                  CustomTextField(
                                    labelText: 'Password (Min 8 characters)',
                                    keyBoardType: TextInputType.visiblePassword,
                                    shudObscure: true,
                                    onValidate: (value) {
                                      if (value.isEmpty) {
                                        return 'Email field can\'t be blank';
                                      }
                                      return null;
                                    },

                                  ),

                                  CustomTextField(
                                    labelText: 'Create a username',
                                    keyBoardType: TextInputType.name,
                                    onValidate: (value) {
                                      if (value.isEmpty) {
                                        return 'Email field can\'t be blank';
                                      }
                                      return null;
                                    },

                                  ),
                          CustomTextField(
                            labelText: 'Referral code (optional)',
                            labelColor: kBlackColor.withAlpha(40),

                          ),
                                  Gap(26),
                                  Text('By signing, you agree to HaggleX terms and privacy policy.',style: TextStyle(
                                    fontSize: 10
                                  ),)
                                ],
                            ),
                          ),

                        ),

                        Gap(44),

                        Container(
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
                            'SIGN UP',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Gap(30)
                      ],

                    ),
                  ),
                ),
              )





            ],
          ),
        ),
      ),
    );
  }
}
