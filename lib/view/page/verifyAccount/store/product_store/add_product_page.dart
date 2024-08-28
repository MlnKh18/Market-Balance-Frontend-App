import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:uas_market_balance_flutter/controllers/getx/product_controller.dart';
import 'package:uas_market_balance_flutter/widgets/textform_field.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/widgets/button.dart';
import 'package:uas_market_balance_flutter/widgets/outline_button.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});
  final addProductC = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 15,
                runSpacing: 20,
                children: [
                  FormFieldOutline(
                    controller: addProductC.productNameController,
                    label: "Nama Produk",
                    widthTextField: 150,
                    validator: addProductC.validateProductName,
                  ),
                  FormFieldOutline(
                    controller: addProductC.categoryController,
                    label: "Nama Kategori",
                    widthTextField: 150,
                    validator: addProductC.validateCategory,
                  ),
                  FormFieldOutline(
                    controller: addProductC.unitPriceController,
                    label: "Harga per Kg",
                    widthTextField: 150,
                    validator: addProductC.validateUnitPrice,
                  ),
                  FormFieldOutline(
                    controller: addProductC.quantityController,
                    label: "Berat (gram)",
                    widthTextField: 150,
                    validator: addProductC.validateQuantity,
                  ),
                  FormFieldOutline(
                    controller: addProductC.stockController,
                    label: "Stok",
                    widthTextField: 150,
                    validator: addProductC.validateStock,
                  ),
                  FormFieldOutline(
                    controller: addProductC.shippingCostController,
                    label: "Harga",
                    widthTextField: 150,
                    validator: addProductC.validateShippingCost,
                  ),
                  FormFieldOutline(
                    controller: addProductC.productionDateController,
                    label: "Tanggal Produksi",
                    widthTextField: 150,
                    validator: addProductC.validateProductionDate,
                  ),
                  FormFieldOutline(
                    controller: addProductC.expiryDateController,
                    label: "Tanggal Kadaluarsa",
                    widthTextField: 150,
                    validator: addProductC.validateExpiryDate,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButtonWidget(
                  hrzPadding: 55,
                  title: "Cancel",
                  onPressed: () => Get.back(),
                ),
                ButtonNavigation(
                  onpressed: () {
                    addProductC.submitForm();
                  },
                  titleText: "Submit",
                  textColor: whiteColor,
                  hrzPadding: 55,
                  colorBackground: fiveColor,
                ),
              ],
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
