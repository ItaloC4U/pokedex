import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DefaultAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const DefaultAppBarWidget({
    super.key,
    this.showBackButton = false,
    required this.title,
  });

  final String title;
  final bool showBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      elevation: 2,
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(),
            )
          : null,
    );
  }
}
