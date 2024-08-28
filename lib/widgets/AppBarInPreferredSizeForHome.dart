import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';

class AppBarInPreferredSizeForHome extends StatelessWidget {
  final List<Widget>? actionForAppBar;
  final Widget title;
  final Widget? leading;
  final PreferredSizeWidget? bottom; // Update the type to PreferredSizeWidget
  const AppBarInPreferredSizeForHome({
    this.actionForAppBar,
    this.leading,
    this.bottom,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      leading: leading ?? IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back,
          color: whiteColor,
        ),
      ),
      title: title,
      actions: actionForAppBar,
      bottom: bottom,
    );
  }
}
