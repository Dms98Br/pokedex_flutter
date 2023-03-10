import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pokedex/helpers/generateColors.dart';
import 'package:pokedex/models/formatting_pokeapi/poke_api.dart';
import 'package:pokedex/models/pokemon_evolution.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:pokedex/services/web_client.dart';
import '../models/pokemon_stats.dart';

class PokemonService {
  String url = WebClient.url;
  static const String resource = 'pokemon';
  //static const String limit = '11';
  //static const String offset = '0';
  static const String pokemonSpecies = 'pokemon-species';
  http.Client client = WebClient().client;

  String getUrlPokemon() {
    return "$url/$resource";
  }

  Future<List<Pokemons>> getAll(String limit, int offset) async {
    final pokemons = await _getUrl('', limit, offset);
    List<Pokemons> list = [];
    final requestFormat = PokeApiFormated.fromJson(pokemons);

    for (var fromJson in requestFormat.results) {
      http.Response pokemonDetails =
          await client.get(Uri.parse(fromJson['url']));
      List abilities = [];
      List types = [];
      Map<String, dynamic> decodedPokemon = json.decode(pokemonDetails.body);

      for (var type in decodedPokemon['types']) {
        types.add(type['type']['name']);
      }

      for (var ability in decodedPokemon['abilities']) {
        abilities.add(ability['ability']['name']);
      }

      final pokemonStats = PokemonStats(
        hp: decodedPokemon['stats'][0]['base_stat'],
        attack: decodedPokemon['stats'][1]['base_stat'],
        defense: decodedPokemon['stats'][2]['base_stat'],
        speed: decodedPokemon['stats'][5]['base_stat'],
        specialAttack: decodedPokemon['stats'][3]['base_stat'],
        specialDefense: decodedPokemon['stats'][4]['base_stat'],
      );
      final image = decodedPokemon['sprites']['other']['official-artwork']
              ['front_default']
          .toString();
      final imageShiny = decodedPokemon['sprites']['other']['official-artwork']
              ['front_shiny']
          .toString();
      final color = await generateColor().getColorImage(image: image);
      final evolutions =
          await _getEvolutions(decodedPokemon['name'], limit, offset);
      list.add(Pokemons(
        id: decodedPokemon['id'].toString(),
        name: decodedPokemon['name'],
        type: types,
        image: image,
        imageShiny: imageShiny,
        color: [color],
        abilities: abilities,
        evolutions: evolutions,
        stats: pokemonStats,
      ));
    }
    return list;
  }

  Future _getEvolutions(String pokemonName, limit, offset) async {
    List evolutions = [];

    http.Response response = await client.get(
      Uri.parse("$url/$pokemonSpecies/$pokemonName"),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    Map<String, dynamic> evolutionChain = await _JsonDecode(response.body);

    final urlEvolutions = evolutionChain['evolution_chain']['url'];

    http.Response getEvolutions = await client.get(
      Uri.parse(urlEvolutions),
      headers: {
        HttpHeaders.connectionHeader: 'application/json',
      },
    );

    final evolutionChainJson = await _JsonDecode(getEvolutions.body);

    final getEvolutionDetails = await _getUrl(
        evolutionChainJson['chain']['species']['name'], limit, offset);

    final pokemonEvolutionDetailsJson = await _JsonDecode(getEvolutionDetails);

    final typeEvolution = await _formatedTypePokemon(getEvolutionDetails);

    final images = await _formatedImage(getEvolutionDetails);

    evolutions.add(
      PokemonEvolution(
        id: pokemonEvolutionDetailsJson['id'].toString(),
        name: pokemonEvolutionDetailsJson['name'],
        type: typeEvolution,
        image: images[0],
      ),
    );

    if (evolutionChainJson['chain']['evolves_to'].length > 0) {
      for (var evolves1 in evolutionChainJson['chain']['evolves_to']) {
        final getEvolutionDetails =
            await _getUrl(evolves1['species']['name'], limit, offset);
        final pokemonEvolutionDetailsJson =
            await _JsonDecode(getEvolutionDetails);

        final typeEvolution = await _formatedTypePokemon(getEvolutionDetails);

        final images = await _formatedImage(getEvolutionDetails);
        evolutions.add(
          PokemonEvolution(
            id: pokemonEvolutionDetailsJson['id'].toString(),
            name: pokemonEvolutionDetailsJson['name'],
            type: typeEvolution,
            image: images[0],
          ),
        );

        if (evolves1['evolves_to'].length > 0) {
          for (var evolves2 in evolves1['evolves_to']) {
            final getEvolutionDetails =
                await _getUrl(evolves2['species']['name'], limit, offset);
            final pokemonEvolutionDetailsJson =
                await _JsonDecode(getEvolutionDetails);

            final typeEvolution =
                await _formatedTypePokemon(getEvolutionDetails);

            final images = await _formatedImage(getEvolutionDetails);
            evolutions.add(
              PokemonEvolution(
                id: pokemonEvolutionDetailsJson['id'].toString(),
                name: pokemonEvolutionDetailsJson['name'],
                type: typeEvolution,
                image: images[0],
              ),
            );
          }
        }
      }
    }
    return evolutions;
  }

  Future _getUrl(String pokemonName, String limit, int offset) async {
    http.Response response;
    if (pokemonName.isEmpty) {
      response = await client.get(
        Uri.parse("$url/$resource?limit=$limit&offset=$offset"),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
    } else {
      response = await client.get(
        Uri.parse("$url/$resource/$pokemonName"),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
    }
    if (response.statusCode != 200) {
      throw HttpException(response.body);
    }
    return response.body;
  }

  Future _formatedTypePokemon(String requestFormat) async {
    final formated = await _JsonDecode(requestFormat);
    List types = [];
    for (var type in formated['types']) {
      types.add(type['type']['name']);
    }
    return types;
  }

  Future _JsonDecode(String jsonToFormat) async {
    final formated = await json.decode(jsonToFormat);
    return formated;
  }

  Future _formatedImage(String requestFormated) async {
    Map<String, dynamic> imagesJson = await _JsonDecode(requestFormated);
    final image = imagesJson['sprites']['other']['official-artwork']
            ['front_default']
        .toString();
    final imageShiny = imagesJson['sprites']['other']['official-artwork']
            ['front_shiny']
        .toString();
    return [image, imageShiny];
  }
}
