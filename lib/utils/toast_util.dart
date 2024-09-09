import 'package:flutter/material.dart';

enum ToastVariant { severe, moderate, info, success }

abstract class IToastUtil {
  void show(String message, {ToastVariant variant = ToastVariant.info});
  void showFromError(Object error, VoidCallback? onRetry);
}

class _ToastIcon extends StatelessWidget {
  final ToastVariant variant;

  const _ToastIcon({required this.variant});

  IconData _getIcon() {
    switch (variant) {
      case ToastVariant.moderate:
      case ToastVariant.severe:
        return Icons.warning_amber_rounded;
      case ToastVariant.info:
        return Icons.info_outline_rounded;
      case ToastVariant.success:
        return Icons.check;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      _getIcon(),
      size: 20,
      color: Colors.white,
    );
  }
}

class ToastUtil implements IToastUtil {
  static GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey();

  @override
  void show(String message, {ToastVariant variant = ToastVariant.info}) {
    _showSnakbar(
      message: message,
      variant: variant,
    );
  }

  @override
  void showFromError(Object error, VoidCallback? onRetry) {
    _showSnakbar(
      message: 'Error',
      variant: ToastVariant.severe,
      onRetry: onRetry,
    );
  }

  Color _getColor(ToastVariant variant) {
    switch (variant) {
      case ToastVariant.severe:
        return Colors.red;
      case ToastVariant.success:
        return Colors.green;
      case ToastVariant.info:
        return Colors.blue;
      case ToastVariant.moderate:
        return Colors.yellow.shade800;
    }
  }

  void _showSnakbar({
    required String message,
    ToastVariant variant = ToastVariant.info,
    VoidCallback? onRetry,
  }) {
    if (scaffoldGlobalKey.currentContext == null) return;

    ScaffoldMessenger.of(scaffoldGlobalKey.currentContext!).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 2,
        backgroundColor: _getColor(variant),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Row(
          children: [
            _ToastIcon(variant: variant),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        action: onRetry == null
            ? null
            : SnackBarAction(
                label: 'TENTAR\nNOVAMENTE',
                textColor: Colors.white,
                onPressed: onRetry,
              ),
      ),
    );
  }
}
