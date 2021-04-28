import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:haggle_x/utils/colors.dart';
import 'package:haggle_x/utils/myTextSytle.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 37,
                            height: 37,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff2E1963),
                                border:
                                    Border.all(color: kWhiteColor, width: 1)),
                          ),
                          Positioned(
                            top: 3,
                            bottom: 3,
                            left: 3,
                            right: 3,
                            child: Container(
                              alignment: Alignment.center,
                              width: 29,
                              height: 29,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffE9BBFF),
                              ),
                              child: Text(
                                'SV',
                                style: kBoldTextStyle.copyWith(
                                    color: Color(0xff2E1963), fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'HaggleX',
                        style: kBoldTextStyle.copyWith(fontSize: 18),
                      ),
                      Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 23.85,
                            height: 23.85,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffD7C8FF38).withAlpha(50)),
                          ),
                          Icon(
                            Icons.notifications,
                            color: kWhiteColor,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 8, top: 36),
                  child: Text(
                    'Total portfolio balance',
                    style: kRegularTextStyle.copyWith(fontSize: 9),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 32, bottom: 17),
                  child: Row(
                    children: [
                      Text(
                        '\$***',
                        style: kRegularTextStyle.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 25),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              //padding: EdgeInsets.only(top: 4, bottom: 4),
              color: Color(0xffF3F3F3),
              height: 145,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                      width: 335,
                      margin:
                          EdgeInsets.only(right: 0, left: 5, top: 8, bottom: 7),
                      child: Image.asset('assets/images/otc.png')),
                  Container(
                      width: 335,
                      margin:
                          EdgeInsets.only(right: 0, left: 5, top: 8, bottom: 7),
                      child: Image.asset('assets/images/otc-2.png')),
                  Container(
                      width: 335,
                      margin:
                          EdgeInsets.only(right: 0, left: 5, top: 8, bottom: 7),
                      child: Image.asset(
                          'assets/images/3.0x/haggleX ambassadoe-1.png'))
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: kWhiteColor,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gap(22),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 23.0, top: 22, bottom: 21),
                    child: Text(
                      'Market',
                      style: kBoldTextStyle.copyWith(
                          color: kBlackColor, fontSize: 15),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 17),
                    child: Container(
                      padding: EdgeInsets.only(left: 7, right: 4),
                      child: Row(
                        children: [
                          Container(
                              child: Image.asset('assets/images/biTCOIN.png')),
                          Gap(17.2),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Haggle (HAG)',
                                style: kRegularTextStyle.copyWith(
                                    color: kBlackColor, fontSize: 13),
                              ),
                              Gap(8),
                              Row(
                                children: [
                                  Text(
                                    'NGN 380',
                                    style: kRegularTextStyle.copyWith(
                                        color: kBlackColor.withOpacity(0.5),
                                        fontSize: 9),
                                  ),
                                  Gap(5),
                                  Text(
                                    '+2.34%',
                                    style: kRegularTextStyle.copyWith(
                                        color: Color(0xff52CB35), fontSize: 9),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Gap(100),
                          Container(
                              child:
                                  Image.asset('assets/images/Group 875-1.png')),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
