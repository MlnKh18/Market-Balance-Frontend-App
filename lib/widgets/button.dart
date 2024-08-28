import 'package:flutter/material.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';

class ButtonNavigation extends StatelessWidget {
  final String titleText;
  final Color colorBackground, textColor;
  final double hrzPadding;
  final double vrtPadding;
  final VoidCallback onpressed;
  final double fontsz;
  const ButtonNavigation({
    super.key,
    required this.titleText,
    required this.onpressed,
    required this.textColor,
    required this.hrzPadding,
    this.colorBackground = fiveColor,
    this.vrtPadding = 18,
    this.fontsz = fSz14,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0), // Sudut content
          ),
        ),
        elevation: MaterialStateProperty.all(1),
        backgroundColor: MaterialStateProperty.all<Color>(colorBackground),
        padding: MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: hrzPadding, vertical: vrtPadding),
        ),
      ),
      child: Text(
        titleText,
        style: fontPoppins.copyWith(
          fontSize: fontsz,
          fontWeight: fW400,
          color: textColor,
        ),
      ),
    );
  }
}
