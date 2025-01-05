class PokemonModel {
      int weight;
      int baseExperience;
      int height;
      int id;
      bool isDefault;
      String name;
      int order;
      int pokemonSpeciesId;

  PokemonModel({
    required this.weight,
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.name,
    required this.order,
    required this.pokemonSpeciesId,
  });

  static PokemonModel pokemonFromMap(Map<String, dynamic> map) {
    return PokemonModel(
      weight: map['weight'],
      baseExperience: map['base_experience'],
      height: map['height'],
      id: map['id'],
      isDefault: map['is_default'],
      name: map['name'],
      order: map['order'],
      pokemonSpeciesId: map['pokemon_species_id'],
    );
  }
}