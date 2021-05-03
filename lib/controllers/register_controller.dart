import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_x/model/country_model.dart';
import 'package:haggle_x/model/user.dart';
import 'package:haggle_x/utils/colors.dart';
import 'package:haggle_x/utils/graphql_config.dart';
import 'package:haggle_x/utils/graphql_queries.dart';

import 'authentication_controller.dart';

class RegisterController extends GetxController {
  final AuthenticationController _authController = Get.find();

  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation addMutation = QueryMutation();

  String errorMssg;
  var userEmail = '';
  var token = '';
  var callingCodex = '234'.obs;
  var flagUrl = 'https://restcountries.eu/data/nga.svg'.obs;

  var countryList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getC();
  }

  Future getC() async {
    var items = await _getActiveCoutries();

    countryList.addAll(items.getActiveCountries);

    print("${countryList[0]}");
  }

  void apiRegister(User user) async {
    Get.dialog(
        Center(
            child: SpinKitFadingCube(
          color: kWhiteColor,
        )),
        barrierDismissible: false);

    bool isRegistered = await _createAccountPressed(user);

    if (isRegistered) {
      Get.back();
      Get.toNamed('/verifyView', arguments: [userEmail, _authController.token]);
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

  Future<bool> _createAccountPressed(User user) async {
    print(
        'The user wants to create an account with ${user.email} and ${user.password}');
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.mutate(
      MutationOptions(
        //document: addMutation.register(user),
        document: gql(addMutation.register(user)),
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

    userEmail = result.data["register"]["user"]["email"];
    _authController.token.value = result.data["register"]["token"];

    print(
        'The user was created succesfully with $userEmail and ${_authController.token.value}!');
    // print('${result.data["data"]["register"]["user"][0]}');
    return true;
  }

  Future<CountryModel> _getActiveCoutries() async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        //document: addMutation.register(user),
        document: gql(addMutation.getCountries()),
      ),
    );
    if (result.hasException) {
      /* if (result.exception.linkException is ServerException) {
        // handle network issues, maybe
        errorMssg = 'Network Error, Please check your internet connection';

        return
      }*/

      /*if (result.exception.graphqlErrors != null) {
        errorMssg = result.exception.graphqlErrors.first.message;
        print('$errorMssg');
        return false;
      }*/
    }

    return CountryModel.fromJson(result.data);
  }
}
