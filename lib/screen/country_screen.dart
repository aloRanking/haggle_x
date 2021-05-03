import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:haggle_x/utils/colors.dart';
import 'package:haggle_x/utils/myTextSytle.dart';
import 'package:haggle_x/widgets/country_item.dart';

class CountrySelectionScreen extends StatefulWidget {
  @override
  _CountrySelectionScreenState createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  var data = Get.arguments;
  List results = [];

  var rows = [];
  String query = '';
  TextEditingController tc;

  void setResults(String query) {
    results = rows
        .where((elem) =>
            elem.name.toString().toLowerCase().contains(query.toLowerCase()) ||
            elem.callingCode
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    tc = TextEditingController();

    rows = data[0];
  }

  @override
  Widget build(BuildContext context) {
    var countries = data[0];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 28, 36, 20),
              child: Container(
                width: double.infinity,
                height: 43,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  color: kWhiteColor.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 21.0, top: 16, bottom: 10),
                        child: TextField(
                            style: kRegularTextStyle.copyWith(
                              fontSize: 10,
                            ),
                            decoration: InputDecoration(
                                hintText: 'Search for Country',
                                hintStyle: kRegularTextStyle.copyWith(
                                  color: kWhiteColor.withOpacity(0.8),
                                  fontSize: 10,
                                ),
                                // suffixIcon: Icon(Icons.search, color: kWhiteColor,),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                            onChanged: (v) {
                              setState(() {
                                query = v;
                                setResults(query);
                              });
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 13, bottom: 12, right: 21.95),
                      child: Icon(
                        Icons.search,
                        color: kWhiteColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Divider(
                color: kWhiteColor,
              ),
            ),
            Expanded(
              child: Container(
                child: query.isEmpty
                    ? ListView.builder(
                        itemCount: countries.length,
                        itemBuilder: (context, index) {
                          return CountryItem(countries, index);
                        },
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: results.length,
                        itemBuilder: (con, index) {
                          return GestureDetector(
                            onTap: () {
                              //Get.back(result: data[index]);
                            },
                            child: Container(
                              width: Get.width,
                              height: 53,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 33, top: 16, bottom: 15),
                                    child: SvgPicture.network(
                                      results[index].flag,
                                      width: 32,
                                      height: 22,
                                    ),
                                  ),
                                  Gap(20),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 22, bottom: 17),
                                    child: Text(
                                      '(+${results[index].callingCode}) ${results[index].name}',
                                      style: kRegularTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
