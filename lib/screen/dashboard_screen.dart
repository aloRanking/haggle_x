import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:haggle_x/utils/colors.dart';
import 'package:haggle_x/utils/myTextSytle.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                            border: Border.all(color: kWhiteColor, width: 1)),
                      ),
                      Positioned(
                        top: 3,
                        bottom: 3,
                        left: 3, right: 3,
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
              padding: const EdgeInsets.only(left: 30,bottom: 8,
              top: 36),
              child: Text(
                'Total portfolio balance',
                style: kRegularTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 32, bottom: 8),
              child: Row(
                children: [
                  Text(
                    '\$***',
                    style: kRegularTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 25
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 132,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [

                  Container(
                    child: SvgPicture.asset('assets/images/otc.svg'),

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
