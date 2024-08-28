import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/view/page/cart/checkout_product.dart';
import 'package:uas_market_balance_flutter/widgets/app_bar_in_preferredsize.dart';
import 'package:uas_market_balance_flutter/widgets/button.dart';
import 'package:uas_market_balance_flutter/widgets/cart_list_item.dart';
import 'package:uas_market_balance_flutter/controllers/getx/cart_controller.dart';
import 'package:uas_market_balance_flutter/controllers/getx/checkout_controller.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    final CheckOutController checkOutController = Get.find();

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBarInPreferredSize(title: "Cart"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Obx(() {
              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return CartListItem(
                    title: item["title"]!,
                    subtitle: item["subtitle"]!,
                    price: item["price"]!,
                    imageCategory: item["imageCategory"]!,
                    onpressed: () {
                      cartController.removeItem(index);
                    },
                  );
                },
              );
            }),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: whiteColor,
              child: Obx(() {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Barang",
                          style: fontPoppins.copyWith(
                            fontSize: fSz12,
                            fontWeight: fWBold,
                          ),
                        ),
                        Text(
                          "Rp ${formatCurrency(cartController.totalPrice)}",
                          style: fontPoppins.copyWith(
                            fontSize: fSz12,
                            fontWeight: fWBold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Biaya Layanan",
                            style: fontPoppins.copyWith(
                              fontSize: fSz12,
                              fontWeight: fWBold,
                            ),
                          ),
                          Text(
                            "Rp ${formatCurrency(cartController.serviceFee)}",
                            style: fontPoppins.copyWith(
                              fontSize: fSz12,
                              fontWeight: fWBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Tagihan",
                          style: fontPoppins.copyWith(
                            fontSize: fSz12,
                            fontWeight: fWBold,
                          ),
                        ),
                        Text(
                          "Rp ${formatCurrency(cartController.totalBill)}",
                          style: fontPoppins.copyWith(
                            fontSize: fSz12,
                            fontWeight: fWBold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ButtonNavigation(
                      titleText: "Checkout",
                      onpressed: () {
                        checkOutController.cartItems
                            .assignAll(cartController.cartItems);
                        Get.to(() => CheckOutProduct());
                      },
                      textColor: whiteColor,
                      hrzPadding: 60,
                      vrtPadding: 10,
                      fontsz: fSz12,
                      colorBackground: secondaryColor,
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  String formatCurrency(double amount) {
    return " ${amount.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}";
  }
}
