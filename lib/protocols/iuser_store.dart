abstract class IUserStore {
  String get productId;
  bool get isLoading;

  Future<void> fetchUser();
}
