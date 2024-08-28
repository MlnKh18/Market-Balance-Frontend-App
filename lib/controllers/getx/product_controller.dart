import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/controllers/getx/signIn_controller.dart';
import 'package:uas_market_balance_flutter/models/product_model.dart';
import 'package:uas_market_balance_flutter/config/api/api_url.dart';
import 'package:flutter/material.dart';

class AddProductController extends GetxController {
  final signC = Get.find<SignInController>();
  final productNameController = TextEditingController();
  final categoryController = TextEditingController();
  final unitPriceController = TextEditingController();
  final quantityController = TextEditingController();
  final stockController = TextEditingController();
  final shippingCostController = TextEditingController();
  final productionDateController = TextEditingController();
  final expiryDateController = TextEditingController();

  String? validateProductName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a product name';
    }
    return null;
  }

  String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a category';
    }
    return null;
  }

  String? validateUnitPrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a unit price';
    }
    return null;
  }

  String? validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a quantity';
    }
    return null;
  }

  String? validateStock(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a stock';
    }
    return null;
  }

  String? validateShippingCost(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a shipping cost';
    }
    return null;
  }

  String? validateProductionDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a production date';
    }
    return null;
  }

  String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an expiry date';
    }
    return null;
  }

  void submitForm() {
    if (productNameController.text.isEmpty ||
        categoryController.text.isEmpty ||
        unitPriceController.text.isEmpty ||
        quantityController.text.isEmpty ||
        stockController.text.isEmpty ||
        shippingCostController.text.isEmpty ||
        productionDateController.text.isEmpty ||
        expiryDateController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in all required fields');
    } else {
      addProductInStore();
    }
  }

  Future<void> addProductInStore() async {
    try {
      final url = Uri.parse(store_add_product);
      final product = ProductModel(
        namaProduk: productNameController.text,
        nama_kategori: categoryController.text,
        hargaPerkg: int.parse(unitPriceController.text),
        beratp: int.parse(quantityController.text),
        stock: int.parse(stockController.text),
        harga: int.parse(shippingCostController.text),
        createdAt: productionDateController.text,
        expired: expiryDateController.text,
      );

      print('Sending product data: ${product.toJson()}');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${signC.authToken}',
        },
        body: jsonEncode(product.toJson()),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Product added successfully');
        // Lakukan navigasi atau tindakan lain setelah produk ditambahkan
      } else {
        Get.snackbar(
            'Error', 'Failed to add product: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error adding product: $e');
      Get.snackbar('Error', 'An error occurred while adding product');
    }
  }

  @override
  void onClose() {
    productNameController.dispose();
    categoryController.dispose();
    unitPriceController.dispose();
    quantityController.dispose();
    stockController.dispose();
    shippingCostController.dispose();
    productionDateController.dispose();
    expiryDateController.dispose();
    super.onClose();
  }
}
