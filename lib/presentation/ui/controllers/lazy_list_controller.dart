import 'package:flutter/material.dart';
import 'package:pokedex/core/iuse_case.dart';
import 'package:pokedex/utils/toast_util.dart';

class AppState {
  final bool hasError;
  final bool isLoading;

  AppState({
    this.hasError = false,
    this.isLoading = false,
  });
}

class AppLazyListState<T> extends AppState {
  final int limit;
  final int offset;
  final bool hasMore;
  final List<T> data;
  final bool loadingNewPage;
  final bool hasThrowedNetworkErrorOnce;

  AppLazyListState({
    super.hasError,
    super.isLoading,
    this.data = const [],
    this.limit = 10,
    this.offset = 0,
    this.hasMore = true,
    this.loadingNewPage = false,
    this.hasThrowedNetworkErrorOnce = false,
  });

  AppLazyListState<T> copyWith({
    int? limit,
    int? offset,
    List<T>? data,
    bool? hasMore,
    bool? hasError,
    bool? isLoading,
    bool? loadingNewPage,
    bool? hasThrowedNetworkErrorOnce,
  }) {
    return AppLazyListState<T>(
      data: data ?? this.data,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      hasMore: hasMore ?? this.hasMore,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
      loadingNewPage: loadingNewPage ?? this.loadingNewPage,
      hasThrowedNetworkErrorOnce:
          hasThrowedNetworkErrorOnce ?? this.hasThrowedNetworkErrorOnce,
    );
  }
}

abstract class IAppLazyListController<T>
    extends ValueNotifier<AppLazyListState<T>> {
  // final ILogProvider logProvider;
  final IToastUtil toastUtil;
  final IUseCase<dynamic, Future<List<T>?>> useCase;

  IAppLazyListController({
    required this.useCase,
    // required this.logProvider,
    required this.toastUtil,
    required AppLazyListState<T> value,
  }) : super(value);

  void _setError(bool status) {
    value = value.copyWith(hasError: status);
  }

  void _setLoading(bool status) {
    value = value.copyWith(isLoading: status);
  }

  Future<void> handleRefresh(dynamic params) async {
    try {
      final data = await useCase.execute(params);

      if (data == null) return;

      value = value.copyWith(data: data);
      // } on DomainError catch (domainError) {
      //   handlerError.handle(error: domainError);
      //   _setError(true);
    } on Exception catch (error, _) {
      _setError(true);
      toastUtil.showFromError(error, null);

      // logProvider.logError(
      //   error: error,
      //   origin: '$runtimeType - fetchFeed',
      //   stackTrace: stackTrace,
      // );
    } finally {
      _setLoading(false);
    }
  }

  Future<void> fetchFeed(dynamic params) async {
    if (!value.hasMore || value.isLoading || value.loadingNewPage) {
      return;
    }

    if (value.hasError) _setError(false);
    if (value.data.isEmpty) _setLoading(true);
    if (value.data.isNotEmpty) value = value.copyWith(loadingNewPage: true);

    try {
      final data = await useCase.execute(params);

      if (data == null) return;

      final dataJoin = [...value.data, ...data];

      value = value.copyWith(
        data: dataJoin,
        offset: (value.offset + data.length),
        hasMore: data.isNotEmpty,
        isLoading: false,
        loadingNewPage: false,
        hasThrowedNetworkErrorOnce: false,
      );
      // } on DomainError catch (domainError) {
      //   _setError(true);
      //   value = value.copyWith(hasThrowedNetworkErrorOnce: true);
      //   handlerError.handle(error: domainError);
      //   return;
    } catch (error, _) {
      _setError(true);
      toastUtil.showFromError(error, null);

      // handlerError.handle(
      //   error: DomainError(
      //     message: 'Falha ao recuperar dados do feed! Tente mais tarde.',
      //     severity: ErrorSeverity.severe,
      //   ),
      // );

      // logProvider.logError(
      //   error: error,
      //   origin: '$runtimeType - fetchFeed',
      //   stackTrace: stackTrace,
      // );
    } finally {
      _setLoading(false);
    }
  }

  void clearList() {
    value = value.copyWith(
      data: [],
      limit: 10,
      offset: 0,
      hasMore: true,
      isLoading: false,
    );
  }
}


// IMPL exemple:

// import '../core/errors/app_lazy_list_controller.dart';
// import '../shared/domain/log/data/log_provider.dart';
// import '../shared/handler/snackbar_handler_error.dart';

// import '../../domain/entities/feed_entity.dart';
// import '../../domain/use_cases/get_feed_contents_use_case.dart';

// class FeedControllerState extends AppLazyListState<FeedEntity> {}

// class FeedLazyListController extends IAppLazyListController<FeedEntity> {
//   final GetFeedContentsUseCase getFeedContentsUseCase;

//   FeedLazyListController({
//     required ILogProvider logProvider,
//     required IHandlerError handlerError,
//     required this.getFeedContentsUseCase,
//   }) : super(
//           useCase: getFeedContentsUseCase,
//           logProvider: logProvider,
//           handlerError: handlerError,
//           value: FeedControllerState(),
//         );
// }
