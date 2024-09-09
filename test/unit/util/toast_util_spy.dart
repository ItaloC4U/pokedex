import 'dart:ui';

import 'package:pokedex/utils/toast_util.dart';

class ToastUtilSpy implements IToastUtil {
  String? message;
  ToastVariant? variant;

  @override
  void show(String message, {ToastVariant variant = ToastVariant.info}) {
    this.message = message;
    this.variant = variant;
  }

  @override
  void showFromError(Object error, VoidCallback? onRetry) {
    message = error.toString();
  }
}
