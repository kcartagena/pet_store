import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pet_store/graphql_config.dart';
import 'package:pet_store/models/pokemon.dart';

class GraphqlService {
  static GraphqlConfig graphqlConfig = GraphqlConfig();
  GraphQLClient client = graphqlConfig.clientToQuery();

  Future<List<PokemonModel>> getPokemon() async {
    try {
      final query = gql("""
      query Pokemon_v2_pokemon(\$where: pokemon_v2_pokemon_bool_exp) {
        pokemon_v2_pokemon(where: \$where) {
          weight
          base_experience
          height
          id
          is_default
          name
          order
          pokemon_species_id
        }
}
""");

      final variables = {
        "where": {
          "id": {"_eq": 4}
        },
      };

      final result = await client.query(
        QueryOptions(
            fetchPolicy: FetchPolicy.noCache,
            document: query,
            variables: variables),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      }

      List? res = result.data?['pokemon_v2_pokemon'];

      if (res == null || res.isEmpty) {
        return [];
      }
      List<PokemonModel> pokemon = res.map((pokemon) => PokemonModel.pokemonFromMap(pokemon)).toList();
      return pokemon;

    } catch (e) {
      throw Exception(e);
    }
  }
}
