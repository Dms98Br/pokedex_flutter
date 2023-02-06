import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/services/pokemon_service.dart';

void main() {
  test('list all pokemons', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final pokemons = PokemonService();
    final result = await pokemons.getAll('1', 1);
    //expect(result.length, 11);
  });

  // test('list of pokemons by region', () async {
  //   TestWidgetsFlutterBinding.ensureInitialized();
  //   final pokemons = PokemonService();
  //   final result = await pokemons.filterPokemon('', 'kanto');
  //   expect(result.length, 6);
  // });

  // test('list of pokemons by type', () async {
  //   TestWidgetsFlutterBinding.ensureInitialized();
  //   final pokemons = PokemonService();
  //   pokemons.getAll();
  //   final result = await pokemons.filterPokemon('fire', '');
  //   //expect(result.length, 1);
  // });
}
