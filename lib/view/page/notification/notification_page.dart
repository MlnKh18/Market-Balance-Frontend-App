import 'package:flutter/material.dart';
import 'package:uas_market_balance_flutter/utils/resource/material_path_assets.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.nodataImage),
            Text(
              "Data Empty",
              style: fontPoppins.copyWith(
                  color: textGreyColor, fontWeight: fWBold),
            )
          ],
        ),
      ),
    );
  }
}
