import 'package:flutter/material.dart';
import 'package:haggle_x/screen/dashboard_screen.dart';
import 'package:haggle_x/screen/wallet_screen.dart';
import 'package:haggle_x/utils/colors.dart';

import 'cryptosave_screen.dart';
import 'exchange_screen.dart';
import 'more_screen.dart';

class HaggleScreen extends StatefulWidget {
  @override
  _HaggleScreenState createState() => _HaggleScreenState();
}

class _HaggleScreenState extends State<HaggleScreen> {
  int currentIndex = 0;
  final List<Widget> _buildScreen = [
    DashboardScreen(),
    WalletScreen(),
    ExchangeScreen(),
    CryptoSaveScreen(),
    MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kWhiteColor,
          selectedItemColor: kBgcolor,
          unselectedItemColor: Colors.grey[400],
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/dasbboard.png'), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/wallet.png'), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/otc-1.png'), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/Savings.png'), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/Utilities.png'), label: ""),
          ]),
    );
  }
}
