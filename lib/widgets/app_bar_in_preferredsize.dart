import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';

class AppBarInPreferredSize extends StatelessWidget {
  final List<Widget>? actionForAppBar;
  final String title;
  final Widget? leading;
  final PreferredSizeWidget? bottom; // Update the type to PreferredSizeWidget
  const AppBarInPreferredSize({
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
      title: Text(
        title,
        textAlign: TextAlign.end,
        style: fontPoppins.copyWith(
          fontWeight: fWBold,
          color: whiteColor,
          fontSize: 18,
        ),
      ),
      actions: actionForAppBar,
      bottom: bottom,
    );
  }
}
