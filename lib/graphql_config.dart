import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pet_store/models/pokemon.dart';

class GraphqlConfig {
  static HttpLink httpLink = HttpLink('https://beta.pokeapi.co/graphql/v1beta');

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );
  }
}