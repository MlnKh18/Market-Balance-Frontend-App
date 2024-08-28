import 'package:flutter/material.dart';
import '../../../../../utils/theme/materials_colors.dart';

class OutlineButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final double hrzPadding;
  final String title;
  final double vrtPadding;
  const OutlineButtonWidget({
    required this.onPressed,
    required this.hrzPadding,
    required this.title,
     this.vrtPadding = 15,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: hrzPadding, vertical: vrtPadding),
        foregroundColor: secondaryColor,
        side: const BorderSide(
          color: secondaryColor,
        ),
      ),
      onPressed: onPressed,
      child:  Text(title),
    );
  }
}