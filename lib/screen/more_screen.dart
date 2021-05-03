import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:haggle_x/controllers/authentication_controller.dart';
import 'package:haggle_x/utils/myTextSytle.dart';

class MoreScreen extends StatelessWidget {
  final AuthenticationController _authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thanks for coming',
                style: kBoldTextStyle.copyWith(
                  fontSize: 30,
                ),
              ),
              Gap(20),
              GestureDetector(
                onTap: () {
                  _authenticationController.token.value = "";

                  Get.offNamed('/loginView');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.deepOrange.shade400),
                  child: Text(
                    'LOG OUT',
                    style: kBoldTextStyle,
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
