import 'package:flutter/material.dart';
import 'package:haggle_x/utils/myTextSytle.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Wallet Screen',
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
