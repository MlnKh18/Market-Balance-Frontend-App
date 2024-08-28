import 'package:flutter/material.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;
  final Function(String) onchanged;
  const SearchWidget({

    required this.hintText,
    required this.onchanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: TextFormField(onChanged: onchanged,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: greyColor,
          hintText: hintText,
          hintStyle: fontPoppins.copyWith(fontSize: fSz13),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: greyColor),
          ),
          border: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 1, color: greyColor),
          ),
        ),
      ),
    );
  }
}
