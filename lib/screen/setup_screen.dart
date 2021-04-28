import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:haggle_x/utils/myTextSytle.dart';
import 'package:haggle_x/utils/strings.dart';

class SetupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: SvgPicture.asset('assets/images/check_color.svg'),
              ),
              Text(
                MyString.setup_txt,
                style: kBoldTextStyle,
              ),
              Gap(16),
              Text(
                MyString.thank_you_setup_txt,
                style: kRegularTextStyle,
              ),
              Gap(222),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 36),
                  decoration: BoxDecoration(
                      color: Color(0xffFFC175),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Center(
                    child: Text(
                      MyString.start_exploring_txt.toUpperCase(),
                      style: TextStyle(
                          color: Color(0xff3E0606),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
