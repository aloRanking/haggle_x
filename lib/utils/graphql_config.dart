import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_x/controllers/authentication_controller.dart';

class GraphQLConfiguration extends GetxController {
  final AuthenticationController authController = Get.find();
  Link link;

  static HttpLink httpLink = HttpLink(
    "https://hagglex-backend-staging.herokuapp.com/graphql",
  );

  // AuthLink authLink ;

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: httpLink,
    );
  }

  GraphQLClient clientToMutate(String token) {
    final AuthLink authLink = AuthLink(
      getToken: () => 'Bearer $token',
    );
    link = authLink.concat(httpLink);

    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: link,
    );
  }
}
