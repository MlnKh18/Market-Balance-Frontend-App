import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:uas_market_balance_flutter/config/api/api_url.dart';
import 'package:uas_market_balance_flutter/models/kategori_model.dart';
import 'package:uas_market_balance_flutter/models/product_model.dart';
import 'package:uas_market_balance_flutter/models/user_model.dart';
import 'package:uas_market_balance_flutter/controllers/getx/signIn_controller.dart';
import 'package:uas_market_balance_flutter/utils/resource/material_path_assets.dart';

class HomeController extends GetxController {
  final signInController = Get.find<SignInController>();

  final List<KategoriModel> imageCategory = [
    KategoriModel(namaKategori: 'egg', image: Assets.eggImage),
    KategoriModel(namaKategori: 'fish', image: Assets.fishImage),
    KategoriModel(namaKategori: 'meat', image: Assets.meatImage),
    KategoriModel(namaKategori: 'rice', image: Assets.riceImage),
    KategoriModel(namaKategori: 'plant', image: Assets.plantsImage),
    KategoriModel(namaKategori: 'chilli', image: Assets.chilliImage),
    KategoriModel(namaKategori: 'sugar', image: Assets.sugarImage),
    KategoriModel(namaKategori: 'potato', image: Assets.potatoImage),
    KategoriModel(namaKategori: 'milk', image: Assets.milkImage),
    KategoriModel(namaKategori: 'fruit', image: Assets.fruitsImage),
    KategoriModel(namaKategori: 'corn', image: Assets.cornImage),
    KategoriModel(namaKategori: 'sembako', image: Assets.sembakoImage),
  ];
  final List<ProductModel> products = [];

  Map<String, String> categoryImages = {
    'egg': Assets.eggImage,
    'fish': Assets.fishImage,
    'meat': Assets.meatImage,
    'rice': Assets.riceImage,
    'plant': Assets.plantsImage,
    'chilli': Assets.chilliImage,
    'sugar': Assets.sugarImage,
    'potato': Assets.potatoImage,
    'milk': Assets.milkImage,
    'fruit': Assets.fruitsImage,
    'corn': Assets.cornImage,
    'sembako': Assets.sembakoImage,
  };

  final user = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
    fetchProducts(); // Fetch products on initialization
  }

  void fetchUser() {
    user.value = signInController.user.value;
  }

  Future<void> fetchProducts() async {
    try {
      var apiUrl = product_get_all;
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body)['data'];
        print(jsonData);

        if (jsonData is List) {
          List<ProductModel> fetchedProducts =
              jsonData.map((item) => ProductModel.fromJson(item)).toList();

          products.assignAll(fetchedProducts);
          print('List of Products:');
          for (var product in products) {
            print('${product.namaProduk}: ${product.harga}');
          }
        } else {
          throw Exception('Expected a list of products');
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
      Get.snackbar(
        'Error',
        'Failed to load products',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  String getCategoryImage(String category) {
    return categoryImages[category] ??
        ''; // Replace with your default image if needed
  }
}
