class UserStoreState {
  final String productId;
  final bool isLoading;

  UserStoreState({
    required this.productId,
    required this.isLoading,
  });

  UserStoreState.empty()
      : productId = "",
        isLoading = false;

  UserStoreState copyWith({
    String? productId,
    bool? isLoading,
  }) {
    return UserStoreState(
      productId: productId ?? this.productId,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

abstract class IUserStore {
  Future<void> fetchUser();
}
