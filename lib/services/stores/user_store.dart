import 'package:flutter/material.dart';
import 'package:pokedex/protocols/iuser_store.dart';

class UserStore extends ValueNotifier<UserStoreState> implements IUserStore {
  UserStore() : super(UserStoreState.empty()) {
    fetchUser();
  }

  @override
  Future<void> fetchUser() async {
    value = value.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 4), () {
      value = value.copyWith(
        isLoading: false,
        productId: "1",
      );
    });
  }
}
