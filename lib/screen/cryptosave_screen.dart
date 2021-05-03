import 'package:flutter/material.dart';
import 'package:haggle_x/utils/myTextSytle.dart';

class CryptoSaveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CryptoSave Screen',
                style: kBoldTextStyle.copyWith(
                  fontSize: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
