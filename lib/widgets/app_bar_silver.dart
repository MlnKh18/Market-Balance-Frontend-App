import 'package:flutter/material.dart';
import 'package:uas_market_balance_flutter/utils/resource/material_path_assets.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';

class SilverAppBar extends StatelessWidget {
  const SilverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return
            CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 140,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  "Maulana Khairuman",
                  style: fontPoppins.copyWith(fontSize: fSz13),
                ),
                background: Container(
                  color: primaryColor,
                ),
              ),
              backgroundColor: primaryColor,
              leading: Container(
                margin: const EdgeInsets.all(6),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage(
                      Assets.logoApp2,
                    ),
                    fit: BoxFit
                        .cover, // Menggunakan BoxFit.contain untuk mempertahankan aspek rasio gambar
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 400,
                  width: double.infinity,
                  color: Colors.amber,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 400,
                  width: double.infinity,
                  color: Colors.amber,
                ),
              ),
            ),
          ],
        );
  }
}