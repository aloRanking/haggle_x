import 'package:flutter/material.dart';
import 'package:haggle_x/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text('Welcome',
              style: TextStyle(
                fontSize: 40,
                color: kWhiteColor,
                fontWeight: FontWeight.bold
              ),),

              Container(
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: kWhiteColor),


                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: kWhiteColor
                            )
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

              Text('Forgot Password?',
              )


            ],
          ),
        ),
      ),

    );
  }
}
