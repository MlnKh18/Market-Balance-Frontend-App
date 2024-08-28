import 'package:flutter/material.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';

class MenuSelectedForHome extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback ontap;
  const MenuSelectedForHome({
    required this.icon,
    required this.title,
    required this.color,
    required this.ontap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          width: 155,
          height: 35,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(5),),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: fontPoppins.copyWith(fontSize: fSz11, fontWeight: fW600),
                ),
              ),
            ],
          )),
    );
  }
}