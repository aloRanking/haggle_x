import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:haggle_x/utils/colors.dart';
import 'package:haggle_x/utils/myTextSytle.dart';

enum Currency { Naira, USD }

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Currency selectedCurrency = Currency.Naira;

  //Currency selectedCurrency

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                color: Color(0xff463279)),
                          ),
                          Icon(
                            Icons.notifications,
                            color: kWhiteColor,
                            size: 22,
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
                  margin: EdgeInsets.only(left: 32, bottom: 17, right: 31),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedCurrency == Currency.Naira
                                  ? "\u20A6 0.00"
                                  : '\$*** ',
                              style: selectedCurrency == Currency.Naira
                                  ? kBoldTextStyle.copyWith(fontSize: 25)
                                  : kRegularTextStyle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25),
                            ),
                            Gap(5),
                            Text(
                              selectedCurrency == Currency.Naira ? "NGN" : '',
                              style: kRegularTextStyle.copyWith(fontSize: 9),
                            ),
                          ],
                        ),
                      ),
                      Gap(35),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(2.41, 1.6, 3.5, 2.34),
                          width: 89,
                          height: 31,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              color: kWhiteColor),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCurrency = Currency.USD;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: selectedCurrency == Currency.USD
                                      ? 42.51
                                      : 38,
                                  height: 27.06,
                                  decoration: selectedCurrency == Currency.USD
                                      ? BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          color: kOrangeColor,
                                          border: Border.all(
                                              color: kWhiteColor, width: 1),
                                          boxShadow: [
                                              BoxShadow(
                                                color: Color(0xff00000029),
                                                blurRadius: 6,
                                                offset: Offset(0, 3),
                                              )
                                            ])
                                      : null,
                                  child: Text('USD',
                                      style: selectedCurrency == Currency.USD
                                          ? kBoldTextStyle.copyWith(
                                              fontSize: 6, color: kBlackColor)
                                          : kRegularTextStyle.copyWith(
                                              fontSize: 6, color: kBlackColor)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCurrency = Currency.Naira;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: selectedCurrency == Currency.Naira
                                      ? 42.51
                                      : 38,
                                  height: 27.06,
                                  decoration: selectedCurrency == Currency.Naira
                                      ? BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          color: kOrangeColor,
                                          border: Border.all(
                                              color: kWhiteColor, width: 1),
                                          boxShadow: [
                                              BoxShadow(
                                                color: Color(0xff00000029),
                                                blurRadius: 6,
                                                offset: Offset(0, 3),
                                              )
                                            ])
                                      : null,
                                  child: Text('NGN',
                                      style: selectedCurrency == Currency.Naira
                                          ? kBoldTextStyle.copyWith(
                                              fontSize: 6, color: kBlackColor)
                                          : kRegularTextStyle.copyWith(
                                              fontSize: 6, color: kBlackColor)),
                                ),
                              )
                            ],
                          ),
                        ),
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
                      child: Image.asset('assets/images/otc-2.png')),
                  Container(
                      width: 335,
                      margin:
                          EdgeInsets.only(right: 0, left: 5, top: 8, bottom: 7),
                      child: Image.asset('assets/images/otc.png')),
                  Container(
                      width: 335,
                      margin:
                          EdgeInsets.only(right: 0, left: 5, top: 8, bottom: 7),
                      child: Image.asset(
                          'assets/images/3.0x/haggleX ambassadoe-1.png'))
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: kWhiteColor,
                //height: 200,
                child: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gap(22),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 23.0, top: 22, bottom: 21),
                      child: Text(
                        'Market',
                        style: kBoldTextStyle.copyWith(
                            color: kBlackColor, fontSize: 15),
                      ),
                    ),

                    MarketIem(
                      coinImg: 'haggle.png',
                      coinName: 'Haggle (HAG)',
                      price: 'NGN 380',
                      imgChart: 'Group 875-1.png',
                    ),

                    Divider(
                      indent: 12,
                      endIndent: 17,
                    ),

                    MarketIem(
                      coinImg: 'bitcoin.png',
                      coinName: 'Bitcoin (BTC)',
                      price: 'NGN 4,272,147.00',
                      rate: '+2.34%',
                      imgChart: 'Group 876-1.png',
                    ),
                    Divider(
                      indent: 12,
                      endIndent: 17,
                    ),

                    MarketIem(
                      coinImg: 'usdt.png',
                      coinName: 'Tether (USDT)',
                      price: 'NGN 4,272,147.00',
                      rate: '+2.34%',
                      imgChart: 'Group 876.png',
                    ),

                    Divider(
                      indent: 12,
                      endIndent: 17,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MarketIem extends StatelessWidget {
  MarketIem(
      {this.coinImg, this.coinName, this.price, this.rate, this.imgChart});

  final String coinImg;
  final String coinName;
  final String price;
  final String rate;
  final String imgChart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 17, bottom: 20, top: 15),
      child: Container(
        padding: EdgeInsets.only(left: 7, right: 4),
        child: Row(
          children: [
            Container(
                child: Image.asset(
              'assets/images/$coinImg',
              width: 40,
              height: 40,
            )),
            Gap(17.2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coinName,
                  style: kRegularTextStyle.copyWith(
                      color: kBlackColor, fontSize: 13),
                ),
                Gap(8),
                Row(
                  children: [
                    Text(
                      price,
                      style: kRegularTextStyle.copyWith(
                          color: kBlackColor.withOpacity(0.5), fontSize: 9),
                    ),
                    Gap(5),
                    Text(
                      rate ?? '',
                      style: kRegularTextStyle.copyWith(
                          color: Color(0xff52CB35), fontSize: 9),
                    ),
                  ],
                ),
              ],
            ),
            Gap(80),
            Expanded(
              child: Container(
                  child: Image.asset(
                'assets/images/$imgChart',
                width: 79.53,
                height: 23.28,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
