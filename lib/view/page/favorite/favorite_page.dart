import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/view/no_data_item_screen.dart';
import '../../../controllers/getx/favorited_controller.dart';
import '../../../utils/resource/material_path_assets.dart';
import '../../../utils/theme/materials_colors.dart';
import '../../../utils/theme/materials_fonts.dart';
import '../../../widgets/card_product.dart';
import '../comodities/details_product_commodities.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: fiveColor,
        centerTitle: true,
        title: Text(
          "Favorite Page",
          style: fontPoppins.copyWith(
              color: whiteColor, fontWeight: fWBold, fontSize: fSz16),
        ),
      ),
      body: Obx(() => favoriteController.favoriteProducts.isEmpty
          ? const NoDataPage()
          : GridView.builder(
              itemCount: favoriteController.favoriteProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8 / 1.5,
                mainAxisSpacing: 4,
                crossAxisSpacing: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                final product = favoriteController.favoriteProducts[index];
                return CardProduct(
                  imageUrl: _getImagePath(product.nama_kategori),
                  locations: product.alamat!,
                  storeName: product.nama_toko!,
                  scales: product.beratp!,
                  price: product.harga.toString(),
                  massUnit: "Kg",
                  productDate: product.expired != null
                      ? "${product.expired}"
                      : "N/A",
                  expiredDate: product.expired != null
                      ? "${product.expired}"
                      : "N/A",
                  goDetails: () =>
                      Get.to(() => DetailsProductCommodities(product: product)),
                );
              },
            )),
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
