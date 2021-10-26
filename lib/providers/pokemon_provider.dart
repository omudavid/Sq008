import 'package:flutter/cupertino.dart';
import 'package:flutter_class/repository/pokemon_repository.dart';
import 'package:flutter_class/repository/pokemon_response.dart';
import 'dart:developer';

class PokemonProvider extends ChangeNotifier {
  List<Results> pokemons = [];
  final repository = PokemonRepository();

  PokemonProvider() {
    getPokemons();
  }

  Future<void> getPokemons() async {
    var pokemonList = await repository.populatePokemon();
    pokemons.addAll(pokemonList!);
    notifyListeners();
  }
}
