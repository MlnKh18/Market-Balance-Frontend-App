import 'package:flutter/material.dart';
import '../../../../../utils/resource/material_path_assets.dart';
import '../../../../../widgets/app_bar_in_preferredsize.dart';

class ShowMoreAdsPage extends StatelessWidget {
  const ShowMoreAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageBanner = [
      Assets.bannerPromo,
      Assets.bannerDiskon,
      Assets.bannerPromo,
      Assets.bannerDiskon,
    ];
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBarInPreferredSize(title: "Ads More")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: ScrollController(),
            child: Column(
              children: List.generate(
                imageBanner.length,
                (index) => Builder(
                  builder: (BuildContext context) {
                    return Card(
                      elevation: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          child: Image.asset(
                            imageBanner[index],
                            width: 370.0,
                            height: 200.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
