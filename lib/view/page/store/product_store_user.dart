import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/utils/resource/material_path_assets.dart';
import 'package:uas_market_balance_flutter/widgets/card_product.dart';

class ProductUserStore extends StatelessWidget {
  const ProductUserStore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8 / 1.5,
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 3,
                ),
                itemBuilder: (BuildContext, index) {
                  return CardProduct(
                    imageUrl: Assets.chilliImage,
                    locations: "Mataram",
                    storeName: "Maul_id",
                    scales: 20,
                    price: "10.000",
                    massUnit: "Kg",
                    productDate: "13-05-2024",
                    expiredDate: "13-05-2024",
                    goDetails: () => Get.to(() => "DetailsProductCommodities()"),
                  );
                }),
          ),
        )
      ],
    );
  }
}
