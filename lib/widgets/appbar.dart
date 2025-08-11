import 'package:flutter/material.dart';
import 'package:vocabulift/constants.dart';
import 'package:vocabulift/widgets/text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  const CustomAppBar({super.key, this.title, this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: CustomText(text: title ?? "Vocabulift", fontSize: 24),
      actions: actions,
      backgroundColor: colors[1],
    );
  }
}
