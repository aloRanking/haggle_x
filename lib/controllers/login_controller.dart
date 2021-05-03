import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_x/controllers/authentication_controller.dart';
import 'package:haggle_x/utils/colors.dart';
import 'package:haggle_x/utils/graphql_config.dart';
import 'package:haggle_x/utils/graphql_queries.dart';

class LoginController extends GetxController {
  final AuthenticationController _authController = Get.find();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation addQMutation = QueryMutation();

  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  var isPasswordVisible = false.obs;

  String errorMssg;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();

    emailTextController.text = 'alo2@gmail.com';
    passwordTextController.text = 'alo12345';

    super.onInit();
  }

  void apiLogin() async {
    Get.dialog(
        Center(
            child: SpinKitFadingCube(
          color: kWhiteColor,
        )),
        barrierDismissible: false);

    bool isLoggedIn =
        await _login(emailTextController.text, passwordTextController.text);

    if (isLoggedIn) {
      Get.back();
      //Get.snackbar('Code verified', '');

      Get.toNamed('/haggleView');
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

  Future<bool> _login(String email, String password) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.mutate(
      MutationOptions(
        //document: addMutation.register(user),
        document: gql(addQMutation.login(email, password)),
      ),
    );

    if (result.hasException) {
      if (result.exception.linkException is ServerException) {
        // handle network issues, maybe
        errorMssg = 'Network Error, Please check your internet connection';
        print('$errorMssg');
        return false;
      }

      if (result.exception.graphqlErrors != null) {
        errorMssg = result.exception.graphqlErrors.first.message;
        print('$errorMssg');
        return false;
      }
    }

    _authController.token.value = result.data['login']['token'];

    print('${_authController.token.value}');

    //_authController.isAuthenticated.value = true;

    return true;
  }
}
