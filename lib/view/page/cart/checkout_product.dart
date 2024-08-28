import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:uas_market_balance_flutter/utils/resource/material_path_assets.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';
import 'package:uas_market_balance_flutter/view/page/navigation/main_navbar.dart';
import '../../../controllers/getx/cart_controller.dart';
import '../../../controllers/getx/checkout_controller.dart';
import '../../../controllers/getx/history_controller.dart';
import '../../../widgets/button.dart';

class CheckOutProduct extends StatelessWidget {
  CheckOutProduct({super.key});

  final CheckOutController checkOutController = Get.find();
  final CartController cartController = Get.find();
  final HistoryController historyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: fiveColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: whiteColor,
            size: 25,
          ),
        ),
        title: Text(
          "CheckOut",
          style: fontPoppins.copyWith(
            color: whiteColor,
            fontSize: fSz16,
            fontWeight: fWBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: fiveColor, width: 0.7),
                ),
                child: PopupMenuButton<String>(
                  color: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onSelected: (value) {
                    checkOutController.selectArmada(value);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        value: 'J&T Express',
                        child: Obx(() {
                          return RadioListTile<String>(
                            title: const Text('J&T Express'),
                            value: 'J&T Express',
                            groupValue: checkOutController.selectedArmada.value,
                            onChanged: (value) {
                              checkOutController.selectArmada(value!);
                              Get.back();
                            },
                          );
                        }),
                      ),
                      PopupMenuItem(
                        value: 'SiCepat REC',
                        child: Obx(() {
                          return RadioListTile<String>(
                            title: const Text("SiCepat REC"),
                            value: 'SiCepat REC',
                            groupValue: checkOutController.selectedArmada.value,
                            onChanged: (value) {
                              checkOutController.selectArmada(value!);
                              Get.back();
                            },
                          );
                        }),
                      ),
                      PopupMenuItem(
                        value: 'JNE Reguler',
                        child: Obx(() {
                          return RadioListTile<String>(
                            title: const Text('JNE Reguler'),
                            value: 'JNE Reguler',
                            groupValue: checkOutController.selectedArmada.value,
                            onChanged: (value) {
                              checkOutController.selectArmada(value!);
                              Get.back();
                            },
                          );
                        }),
                      ),
                    ];
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.local_car_wash,
                        size: 26,
                        color: fiveColor,
                      ),
                      Obx(() {
                        return Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text(
                            checkOutController.selectedArmada.value.isEmpty
                                ? "Pilih Armada"
                                : checkOutController.selectedArmada.value,
                            style: fontPoppins.copyWith(
                              color: fiveColor,
                              fontSize: fSz16,
                              fontWeight: fWBold,
                            ),
                          ),
                        );
                      }),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: fiveColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            height: 100,
            color: greyColor,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_pin),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    """
Perumahan Bukit Menok GANG 3
Reyan Gerung, Lombok Barat, NTB
""",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pembayaran",
                  style: fontPoppins.copyWith(
                    fontSize: fSz16,
                    fontWeight: fWBold,
                    color: fiveColor,
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(() => ListTile(
                        leading: Image.asset(
                          Assets.paymentDebit,
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                        title: Text(
                          "Credit Card",
                          style: fontPoppins.copyWith(
                            fontWeight: fWBold,
                            color: fiveColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Radio<String>(
                          value: "debit",
                          groupValue: checkOutController.selectedPayment.value,
                          onChanged: (String? value) {
                            checkOutController.selectPayment(value!);
                          },
                        ),
                      )),
                ),
                const Gap(5),
                Card(
                  child: Obx(() => ListTile(
                        leading: Image.asset(
                          Assets.paymentVisa,
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                        title: Text(
                          "Visa",
                          style: fontPoppins.copyWith(
                            fontWeight: fWBold,
                            color: fiveColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Radio<String>(
                          value: "visa",
                          groupValue: checkOutController.selectedPayment.value,
                          onChanged: (String? value) {
                            checkOutController.selectPayment(value!);
                          },
                        ),
                      )),
                ),
                const Gap(5),
                Card(
                  child: Obx(() => ListTile(
                        leading: Image.asset(
                          Assets.paymentPaypal,
                          width: 30.0,
                          height: 30.0,
                          fit: BoxFit.contain,
                        ),
                        title: Text(
                          "PayPal",
                          style: fontPoppins.copyWith(
                            fontWeight: fWBold,
                            color: fiveColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Radio<String>(
                          value: "paypal",
                          groupValue: checkOutController.selectedPayment.value,
                          onChanged: (String? value) {
                            checkOutController.selectPayment(value!);
                          },
                        ),
                      )),
                ),
                const Gap(20),
              ],
            ),
          ),
          ButtonNavigation(
            titleText: "Buy",
            onpressed: () {
// Show dialog with checkout summary
              Get.defaultDialog(
                title: "Checkout Summary",
                content: Column(
                  children: [
                    const Text(
                      "Total Pembayaran:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "Rp. ${cartController.totalBill.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}'"),
                    const SizedBox(height: 20),
                    const Text(
                      "Metode Pembayaran:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(checkOutController.selectedPayment.value),
                  ],
                ),
                confirm: ElevatedButton(
                  onPressed: () {
// Add transaction to history and clear cart
                    cartController.checkout(
                        checkOutController.selectedArmada.value,
                        checkOutController.selectedPayment.value);
                    Get.snackbar('Success',
                        'Transaction completed and moved to history');
                    Navigator.pop(context);
                    Get.offAll(() => MainNavBar());
                  },
                  child: const Text('Buy'),
                ),
              );
            },
            textColor: whiteColor,
            hrzPadding: 60,
            vrtPadding: 10,
            fontsz: fSz12,
            colorBackground: secondaryColor,
          ),
        ],
      ),
    );
  }
}
