import 'package:dio/dio.dart';
import 'package:flutter_class/repository/pokemon_response.dart';

class PokemonRepository {
  final _dio = Dio();

  Future<List<Results>?> populatePokemon() async {
    var response = await _dio.get('https://pokeapi.co/api/v2/pokemon');

    var responseObject = PokemonResponse.fromJson(response.data);
    return responseObject.results;
  }
}
