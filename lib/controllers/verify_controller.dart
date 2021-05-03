import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_x/utils/colors.dart';
import 'package:haggle_x/utils/graphql_config.dart';
import 'package:haggle_x/utils/graphql_queries.dart';

import 'authentication_controller.dart';

class VerifyController extends GetxController {
  final AuthenticationController _authController = Get.find();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation addQMutation = QueryMutation();
  String errorMssg;

  String email = '';
  final TextEditingController verifyCodeText = new TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    var data = Get.arguments;
    email = data[0];
    _authController.token = data[1];
  }

  void resendCode() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    bool isCodeResent = await _resendVerificationCode(email);

    if (isCodeResent) {
      Get.back();
      Get.snackbar('Code Resent', '');
    } else {
      Get.back();
      Get.snackbar('Error', '$errorMssg',
          backgroundColor: Colors.red,
          colorText: kWhiteColor,
          icon: Icon(
            Icons.clear_rounded,
            color: kWhiteColor,
          ));
    }
  }

  void verifyNewUser() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    int code = int.parse(verifyCodeText.text);

    print('$code');

    bool isCodeVerified = await _verifyCode(code);

    if (isCodeVerified) {
      Get.back();
      Get.offNamed('/setupView');
    } else {
      Get.back();
      Get.snackbar('Error', '$errorMssg',
          backgroundColor: Colors.red,
          colorText: kWhiteColor,
          icon: Icon(
            Icons.clear_rounded,
            color: kWhiteColor,
          ));
    }
  }

  Future<bool> _verifyCode(int code) async {
    GraphQLClient _client =
        graphQLConfiguration.clientToMutate(_authController.token.value);
    try {
      QueryResult result = await _client.mutate(
        MutationOptions(
          //document: addMutation.register(user),
          document: gql(addQMutation.verifyUser(code)),
        ),
      );

      if (result.hasException) {
        if (result.exception.linkException is ServerException) {
          // handle network issues, maybe
          errorMssg = 'Network Error, Please check your internet connection';

          return false;
        }

        if (result.exception.graphqlErrors != null) {
          errorMssg = result.exception.graphqlErrors.first.message;
          print('$errorMssg');
          return false;
        }
      }
      if (result.data["verifyUser"] != null) {
        print('the code has been verified');

        return true;
      }
      return false;
    } on NoSuchMethodError catch (e) {
      print('error caught');
      return false;
    } on Exception catch (e) {
      // TODO
      print(e);
      return false;
    }
  }

  Future<bool> _resendVerificationCode(String email) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    try {
      QueryResult result = await _client.query(
        QueryOptions(
          //document: addMutation.register(user),
          document: gql(addQMutation.resendCode(email)),
        ),
      );
      if (result.hasException) {
        if (result.exception.linkException is ServerException) {
          // handle network issues, maybe
          errorMssg = 'Network Error, Please check your internet connection';

          return false;
        }

        if (result.exception.graphqlErrors != null) {
          errorMssg = result.exception.graphqlErrors.first.message;
          print('$errorMssg');
          return false;
        }
      }
      if (result.data["resendVerificationCode"] == true) {
        return true;
      }
      return false;
    } on Exception catch (e) {
      // TODO
      print(e);
      return false;
    }
  }
}
