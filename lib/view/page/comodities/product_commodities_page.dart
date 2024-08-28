import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/controllers/getx/home_controller.dart';
import 'package:uas_market_balance_flutter/controllers/getx/filter_controller.dart';
import 'package:uas_market_balance_flutter/models/product_model.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';
import 'package:uas_market_balance_flutter/view/page/comodities/details_product_commodities.dart';
import 'package:uas_market_balance_flutter/widgets/app_bar_in_preferredsize.dart';
import 'package:uas_market_balance_flutter/widgets/card_product.dart';
import 'package:uas_market_balance_flutter/widgets/search_form.dart';


class ProductCommoditiesPage extends StatelessWidget {
  final String imageUrl;
  final String category;

  const ProductCommoditiesPage({
    required this.imageUrl,
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Mendapatkan instance HomeController
    final HomeController homeC = Get.find();
    // Debugging statement untuk memeriksa data homeC.products
    print('Total products in HomeController: ${homeC.products.length}');
    for (var product in homeC.products) {
      print(
          'Product: ${product.namaProduk}, Category: ${product.nama_kategori}');
    }

    // Inisialisasi FilterController dan set produk yang difilter
    final FilterController filterC = Get.put(FilterController());
    List<ProductModel> filteredProducts = homeC.products
        .where((product) => product.nama_kategori == category)
        .toList();

    // Set produk yang difilter di FilterController
    filterC.setProducts(filteredProducts);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBarInPreferredSize(
          title: "Commodities",
        ),
      ),
      body: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: SearchWidget(
                            hintText: "Search Product",
                            onchanged: (value) {
                              filterC.searchProduct(value);
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  width: double.infinity,
                                  height: 300,
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          onPressed: () => Get.back(),
                                          icon: const Icon(
                                            Icons.cancel,
                                            color: errorColor,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Filter",
                                        style: fontPoppins.copyWith(
                                          fontSize: 18,
                                          fontWeight: fWBold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      FilterOptions(
                                        title: "Harga Satuan Termurah",
                                        onPressed: () {
                                          print(homeC.products);
                                          filterC.filterByLowestPrice();
                                          Get.back();
                                        },
                                      ),
                                      const SizedBox(height: 30),
                                      FilterOptions(
                                        title: "Harga Satuan Termahal",
                                        onPressed: () {
                                          filterC.filterByHighestPrice();
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 7),
                            width: 80,
                            decoration: BoxDecoration(
                              color: fiveColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.filter_list_outlined,
                                  color: secondaryColor,
                                  size: 30,
                                ),
                                Text(
                                  "Filter",
                                  style: fontPoppins.copyWith(
                                    color: whiteColor,
                                    fontWeight: fWBold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Obx(() => GridView.builder(
                          itemCount: filterC.filteredProducts.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.8 / 1.5,
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 3,
                          ),
                          itemBuilder: (BuildContext context, index) {
                            final product = filterC.filteredProducts[index];
                            String category = product.nama_kategori ?? '';
                            String categoryImage =
                                homeC.getCategoryImage(category);

                            return CardProduct(
                              imageUrl: categoryImage,
                              locations: product.alamat ?? '',
                              storeName: product.nama_toko ?? '',
                              scales: product.beratp!,
                              price: product.harga.toString(),
                              massUnit: "Kg",
                              productDate: product.expired != null
                                  ? product.expired!
                                  : "N/A",
                              expiredDate: product.expired != null
                                  ? "${product.expired}"
                                  : "N/A",
                              goDetails: () => Get.to(() =>
                                  DetailsProductCommodities(product: product)),
                            );
                          },
                        )),
                  ),
                ),
              ],
            ),
    );
  }
}

class FilterOptions extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const FilterOptions({
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: fontPoppins.copyWith(color: fiveColor, fontWeight: fWBold),
          ),
          const Divider(
            height: 1,
            color: greyColor,
          )
        ],
      ),
    );
  }
}
