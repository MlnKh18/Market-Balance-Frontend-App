import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/utils/resource/material_path_assets.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';
import 'package:uas_market_balance_flutter/widgets/button.dart';
import 'package:uas_market_balance_flutter/widgets/outline_button.dart';
import 'package:gap/gap.dart';
import '../../../controllers/getx/cart_controller.dart';
import '../../../controllers/getx/favorited_controller.dart';
import '../../../models/product_model.dart';

class DetailsProductCommodities extends StatelessWidget {
  final ProductModel product;

  DetailsProductCommodities({super.key, required this.product});

  final FavoriteController favoriteController = Get.find<FavoriteController>();
  final CartController cartController = Get.find(); // Initialize CartController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 140,
              color: primaryColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: whiteColor,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    "Detail Product",
                    style: fontPoppins.copyWith(
                      color: whiteColor,
                      fontWeight: fWBold,
                      fontSize: fSz16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: 80,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Penjual",
                      style: fontPoppins.copyWith(
                        color: fiveColor,
                        fontWeight: fWBold,
                        fontSize: fSz10,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      product.nama_toko!,
                      style: fontPoppins.copyWith(
                        color: fiveColor,
                        fontWeight: fWBold,
                        fontSize: fSz12,
                      ),
                    ),
                    const Gap(20),
                    SizedBox(
                      height: 80,
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    _getImagePath(product.nama_kategori)),
                                fit: BoxFit.contain,
                              ),
                              color: greyColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const Gap(10),
                          Text(
                            product.nama_kategori ?? '',
                            style: fontPoppins.copyWith(
                              color: fiveColor,
                              fontWeight: fWBold,
                              fontSize: fSz10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kuantitas",
                              style: fontPoppins.copyWith(
                                color: fiveColor,
                                fontWeight: fWBold,
                                fontSize: fSz10,
                              ),
                            ),
                            const Gap(5),
                            Text(
                              product.beratp.toString(),
                              style: fontPoppins.copyWith(
                                color: fiveColor,
                                fontWeight: fWBold,
                                fontSize: fSz14,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Harga Satuan",
                              style: fontPoppins.copyWith(
                                color: fiveColor,
                                fontWeight: fWBold,
                                fontSize: fSz10,
                              ),
                            ),
                            const Gap(5),
                            Text(
                              "${product.hargaPerkg} / Kg",
                              style: fontPoppins.copyWith(
                                color: fiveColor,
                                fontWeight: fWBold,
                                fontSize: fSz14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Produksi",
                              style: fontPoppins.copyWith(
                                color: fiveColor,
                                fontWeight: fWBold,
                                fontSize: fSz10,
                              ),
                            ),
                            const Gap(5),
                            Text(
                              product.expired != null
                                  ? "${product.expired}"
                                  : "N/A",
                              style: fontPoppins.copyWith(
                                color: fiveColor,
                                fontWeight: fWBold,
                                fontSize: fSz14,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Tanggal Kadaluarsa",
                              style: fontPoppins.copyWith(
                                color: fiveColor,
                                fontWeight: fWBold,
                                fontSize: fSz10,
                              ),
                            ),
                            const Gap(5),
                            Text(
                              product.expired != null
                                  ? "${product.expired}"
                                  : "N/A",
                              style: fontPoppins.copyWith(
                                color: fiveColor,
                                fontWeight: fWBold,
                                fontSize: fSz14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(
                          () => ButtonNavigation(
                            titleText: favoriteController.isFavorite(product)
                                ? "Favorited"
                                : "Favorite",
                            onpressed: () {
                              if (favoriteController.isFavorite(product)) {
                                favoriteController.removeFavorite(product);
                              } else {
                                favoriteController.addFavorite(product);
                              }
                            },
                            textColor: whiteColor,
                            hrzPadding: 15,
                            colorBackground: fiveColor,
                            vrtPadding: 8,
                            fontsz: fSz11,
                          ),
                        ),
                        ButtonNavigation(
                          titleText: "Tambah keranjang",
                          onpressed: () {
                            cartController.addToCart({
                              "title": product.namaProduk!,
                              "subtitle":
                                  "${product.beratp} x ${product.hargaPerkg}",
                              "store": product.nama_toko!,
                              "price": product.harga.toString(),
                              "imageCategory":
                                  _getImagePath(product.nama_kategori),
                            }); // Add product to cart
                            Get.snackbar(
                              "Cart",
                              "${product.nama_toko} added to cart",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          },
                          textColor: whiteColor,
                          hrzPadding: 8,
                          colorBackground: fiveColor,
                          vrtPadding: 8,
                          fontsz: fSz11,
                        ),
                      ],
                    ),
                    const Gap(40),
                    Align(
                      alignment: Alignment.center,
                      child: OutlineButtonWidget(
                        onPressed: () {},
                        hrzPadding: 10,
                        title: "Hubungi Penjual",
                        vrtPadding: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getImagePath(String? category) {
    switch (category) {
      case 'egg':
        return Assets.eggImage;
      case 'fish':
        return Assets.fishImage;
      case 'meat':
        return Assets.meatImage;
      case 'rice':
        return Assets.riceImage;
      case 'plant':
        return Assets.plantsImage;
      case 'chilli':
        return Assets.chilliImage;
      case 'sugar':
        return Assets.sugarImage;
      case 'potato':
        return Assets.potatoImage;
      case 'milk':
        return Assets.milkImage;
      case 'fruit':
        return Assets.fruitsImage;
      case 'corn':
        return Assets.cornImage;
      case 'sembako':
        return Assets.sembakoImage;
      default:
        return "Assets.defaultImage"; // Default image path
    }
  }
}
