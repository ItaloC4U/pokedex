import 'package:flutter/material.dart';
import 'package:pokedex/protocols/iuser_store.dart';

class UserStore with ChangeNotifier implements IUserStore {
  UserStore() {
    fetchUser();
  }

  String _productId = "";
  bool _isLoading = false;

  @override
  Future<void> fetchUser() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 4), () {
      _productId = "1";
      _isLoading = false;
      notifyListeners();
    });
  }

  @override
  String get productId => _productId;
  @override
  bool get isLoading => _isLoading;
}
