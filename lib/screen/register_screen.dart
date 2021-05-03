import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:haggle_x/controllers/register_controller.dart';
import 'package:haggle_x/model/country_model.dart';
import 'package:haggle_x/model/user.dart';
import 'package:haggle_x/utils/colors.dart';
import 'package:haggle_x/utils/myTextSytle.dart';
import 'package:haggle_x/widgets/custom_textField.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController regController = Get.put(RegisterController());

  User newUser = User();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(19),
              Padding(
                padding: const EdgeInsets.only(left: 36),
                child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset('assets/images/back_arrow.svg')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 15, top: 20),
                child: Card(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(50),
                        Container(
                          margin: EdgeInsets.only(left: 27),

                          child: Text(
                            'Create a new account',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 34),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  labelText: 'Email Address',
                                  keyBoardType: TextInputType.emailAddress,
                                  onValidate: (value) {
                                    if (value.isEmpty) {
                                      return 'Email field can\'t be blank';
                                    }
                                    return null;
                                  },
                                  onSave: (String value) =>
                                      newUser.email = value,
                                ),
                                CustomTextField(
                                  labelText: 'Password (Min 8 characters)',
                                  keyBoardType: TextInputType.visiblePassword,
                                  shudObscure: true,
                                  onValidate: (value) {
                                    if (value.isEmpty) {
                                      return 'Password field can\'t be blank';
                                    }
                                    if (value.toString().length < 8) {
                                      return 'Password is too short';
                                    }
                                    return null;
                                  },
                                  onSave: (String value) =>
                                      newUser.password = value,
                                ),
                                CustomTextField(
                                  labelText: 'Create a username',
                                  keyBoardType: TextInputType.name,
                                  onValidate: (value) {
                                    if (value.isEmpty) {
                                      return 'Username field can\'t be blank';
                                    }
                                    return null;
                                  },
                                  onSave: (String value) =>
                                      newUser.username = value,
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.ideographic,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        var result = await Get.toNamed(
                                            '/countryView',
                                            arguments: [
                                              regController.countryList
                                            ]);

                                        if (result == null) {
                                          return;
                                        }

                                        GetActiveCountries returnedData =
                                            result;

                                        regController.callingCodex.value =
                                            returnedData.callingCode;
                                        regController.flagUrl.value =
                                            returnedData.flag;
                                        newUser.currency =
                                            returnedData.currencyDetails.name;
                                        newUser.country = returnedData.name;
                                      },
                                      child: Container(
                                        width: 75,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2)),
                                          color: Color(0xffE8E8E8),
                                        ),
                                        child: Obx(() {
                                          return Row(
                                            children: [
                                              Gap(11),
                                              SvgPicture.network(
                                                regController.flagUrl.value,
                                                width: 19,
                                                height: 13,
                                              ),
                                              Gap(5),
                                              Text(
                                                '(+${regController.callingCodex.value})',
                                                style:
                                                    kRegularTextStyle.copyWith(
                                                        color: kBlackColor,
                                                        fontSize: 9),
                                              )
                                            ],
                                          );
                                        }),
                                      ),
                                    ),
                                    Gap(6),
                                    Flexible(
                                      child: CustomTextField(
                                        labelText: 'Phonenumber',
                                        keyBoardType: TextInputType.number,
                                        onValidate: (value) {
                                          if (value.isEmpty) {
                                            return 'Phonenumber field can\'t be blank';
                                          }
                                          return null;
                                        },
                                        onSave: (String value) =>
                                            newUser.phonenumber = value,
                                      ),
                                    ),
                                  ],
                                ),
                                CustomTextField(
                                  labelText: 'Referral code (optional)',
                                  labelColor: kBlackColor.withOpacity(0.4),
                                  onValidate: (value) {
                                    if (value.isEmpty) {
                                      value = '';
                                      return null;
                                    }
                                    return null;
                                  },
                                  onSave: (String value) =>
                                      newUser.referralCode = value,
                                ),
                                Gap(26),
                                Text(
                                  'By signing, you agree to HaggleX terms and privacy policy.',
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                        Gap(30),
                        GestureDetector(
                          onTap: () {
                            print("${newUser.referralCode}");

                            /* if (newUser.referralCode == null) {
                              newUser.referralCode = '';

                            }*/

                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              regController.apiRegister(newUser);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                //stops: [0.1, 0.5, 0.7, 0.9],
                                colors: [Color(0xffF432B7B), Color(0xff6A4BBC)],
                              ),
                            ),
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Gap(30)
                      ],

                    ),
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
