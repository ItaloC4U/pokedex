import 'package:get_it/get_it.dart';

typedef FactoryFunc<T extends Object> = T Function();

abstract class IInject {
  T get<T extends Object>();
  Future<T> getAsync<T extends Object>();

  void registerFactory(FactoryFunc factoryFunc);
  void registerSingleton<T extends Object>(T instance);
}

IInject? _inject;

// ignore: non_constant_identifier_names
IInject get Inject {
  _inject ??= _InjectImpl();
  return _inject!;
}

class _InjectImpl implements IInject {
  final getIt = GetIt.instance;

  @override
  T get<T extends Object>() => getIt.get<T>();

  @override
  Future<T> getAsync<T extends Object>() async => await getIt.getAsync<T>();

  @override
  void registerFactory(FactoryFunc factoryFunce) =>
      getIt.registerFactory(factoryFunce);

  @override
  void registerSingleton<T extends Object>(T instance) =>
      getIt.registerSingleton<T>(instance);
}
