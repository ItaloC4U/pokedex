import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/presentation/protocols/ipokemon_controller.dart';
import 'package:pokedex/presentation/ui/controllers/pokemon_controller.dart';
import 'package:pokedex/utils/toast_util.dart';

import '../../../infra/providers/get_pokemons_spy.dart';
import '../../../infra/providers/log_data_spy.dart';
import '../../../util/toast_util_spy.dart';

void main() {
  late IPokemonController sut; // Sytem Under Test
  late LogDataSpy logData;
  late IToastUtil toastUtil;
  late GetPokemonsSpy getPokemonsData;

  setUp(() {
    logData = LogDataSpy();
    toastUtil = ToastUtilSpy();
    getPokemonsData = GetPokemonsSpy();

    sut = PokemonController(
      logData: logData,
      toastUtil: toastUtil,
      getPokemonsData: getPokemonsData,
    );
  });

  test(
    'Should throw if IGetPokemonsData throws',
    () async {
      getPokemonsData.error = Exception('ERRO DESCONHECIDO');

      await sut.fetchPokemons();
      expect(getPokemonsData.count, 1);

      expect(logData.message, getPokemonsData.error.toString());
      expect(sut.value.isLoading, false);
    },
  );

  test(
    'Should notify listeners on loading change',
    () async {
      expect(sut.value.isLoading, false);

      final promise = sut.fetchPokemons();

      expect(sut.value.isLoading, true);

      await promise;

      expect(sut.value.isLoading, false);
    },
  );

  test(
    'Should has success on fetch pokemons',
    () async {
      expect(getPokemonsData.count, 0);
      await sut.fetchPokemons();
      expect(getPokemonsData.count, 1);

      expect(sut.value.pokemons, isNotEmpty);
      expect(sut.value.isLoading, false);
    },
  );
}
