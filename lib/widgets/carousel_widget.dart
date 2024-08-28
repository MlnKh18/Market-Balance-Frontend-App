import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/view/page/home/show_more_page.dart';
import 'package:uas_market_balance_flutter/utils/resource/material_path_assets.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';

class CarouselCustomeWidget extends StatefulWidget {
  const CarouselCustomeWidget({
    super.key,
  });

  @override
  State<CarouselCustomeWidget> createState() => _CarouselCustomeWidgetState();
}

class _CarouselCustomeWidgetState extends State<CarouselCustomeWidget> {
  final carouselController = CarouselController();

  /// Baris `final int currentIndex = 0;` mendeklarasikan variabel integer akhir bernama `currentIndex`
  /// dan menginisialisasinya dengan nilai 0. Dalam konteks ini, sepertinya variabel tersebut dimaksudkan untuk itu
  /// menyimpan indeks widget carousel saat ini, namun tidak digunakan dalam kode yang disediakan
  /// cuplikan.
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> imageBanner = [
      Assets.bannerPromo,
      Assets.bannerDiskon,
      Assets.bannerPromo,
    ];
    return SizedBox(
      width: double.infinity,
      height: 232,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 180,
            child: CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  height: 300.0,
                  enlargeCenterPage: true,
                  scrollPhysics: const BouncingScrollPhysics(),
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) => setState(() {
                    currentIndex = index;
                  }),
                ),
                items: List.generate(
                    imageBanner.length,
                    (index) =>

                        /// `Builder` adalah widget di Flutter yang digunakan untuk membuat pohon widget
                        /// dari fungsi panggilan balik. Ini biasanya digunakan dalam skenario di mana Anda
                        /// perlu mengakses `BuildContext` dari leluhur terdekat `Builder`
                        /// widget. Dalam cuplikan kode yang disediakan, `Builder` digunakan di dalam
                        /// Metode `List.generate` untuk membuat `BuildContext` baru untuk setiap item
                        /// di penggeser korsel. Hal ini memungkinkan widget `Image.asset` untuk
                        /// mengakses `BuildContext` yang benar untuk merender gambar di dalam
                        /// penggeser korsel.
                        Builder(
                          builder: (BuildContext context) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                // onTap: () => print(currentIndex),
                                child: Image.asset(
                                  imageBanner[index],
                                  width: 370.0,
                                  height: 200.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ))),
          ),
          const Gap(3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(
                      imageBanner.length,
                      (index) => GestureDetector(
                          child: Container(
                        margin: const EdgeInsets.only(left: 3),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: currentIndex == index
                              ? blackColor.withOpacity(0.6)
                              : greyColor,
                        ),
                      )),
                    ),
                  )),
              TextButton(
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    fontPoppins.copyWith(
                        color: secondaryColor, fontSize: fSz12),
                  ),
                ),
                onPressed: () => Get.to(() => const ShowMoreAdsPage()),
                child: Text(
                  "Show More",
                  style: fontPoppins.copyWith(
                    color: secondaryColor,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
