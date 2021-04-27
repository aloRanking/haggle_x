import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:haggle_x/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Gap(154),
                Container(
                  margin: EdgeInsets.only(left: 29),
                  child: Text('Welcome!',
                  style: TextStyle(
                    fontSize: 40,
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                Gap(33),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 36),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(
                            color: kWhiteColor
                          ),
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(color: kWhiteColor),

                            //hintText: 'Email Address',
                            //hintStyle:  TextStyle(color: kWhiteColor),

                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: kWhiteColor
                              )
                            ),
                            enabledBorder: UnderlineInputBorder(

                              borderSide: BorderSide(
                                color:kWhiteColor,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(

                              borderSide: BorderSide(
                                color:Color(0xffBA3AF9),
                              ),
                            ),

                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.0,
                              ),
                            ),
                          ),






                        ),
                        TextFormField(
                          style: TextStyle(
                              color: kWhiteColor
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,

                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: kWhiteColor),
                            //ixIcon:
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kWhiteColor
                                )
                            ),
                            enabledBorder: UnderlineInputBorder(

                              borderSide: BorderSide(
                                color:kWhiteColor,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(

                              borderSide: BorderSide(
                                color:Color(0xffBA3AF9),
                              ),
                            ),

                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.0,
                              ),
                            ),
                          ),






                        )
                      ],
                    ),
                  ),
                ),
                Gap(32.5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 41),
                      child: Text('Forgot Password?',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 11
                        ),
                      ),
                    ),
                  ],
                ),

                Gap(44),

                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 36),
                  decoration: BoxDecoration(
                    color: Color(0xffFFC175),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Center(
                    child: Text(
                        'LOG IN',
                      style: TextStyle(
                          color: Color(0xff3E0606),
                        fontWeight: FontWeight.bold
                      ),
                      ),
                  ),
                ),
                Gap(33),
                Center(
                  child: Text(
                    'New User?Create a new account',
                    style: TextStyle(
                      color: kWhiteColor
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
