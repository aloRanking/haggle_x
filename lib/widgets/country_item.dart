import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:haggle_x/utils/myTextSytle.dart';

class CountryItem extends StatelessWidget {
  var data;
  var index;

  CountryItem(this.data, this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back(result: data[index]);
      },
      child: Container(
        width: Get.width,
        height: 53,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 33, top: 16, bottom: 15),
              child: SvgPicture.network(
                data[index].flag,
                width: 32,
                height: 22,
              ),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.only(top: 22, bottom: 17),
              child: Text(
                '(+${data[index].callingCode}) ${data[index].name}',
                style: kRegularTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
