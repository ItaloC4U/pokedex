import 'package:dio/dio.dart';

class PokeBaseApi {
  final http = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2',
    ),
  );
}
