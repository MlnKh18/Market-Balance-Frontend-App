import 'package:get/get.dart';
import '../../models/product_model.dart';

class FilterController extends GetxController {
  final products = <ProductModel>[].obs;
  final filteredProducts = <ProductModel>[].obs;

  void setProducts(List<ProductModel> productList) {
    products.assignAll(productList);
    filteredProducts.assignAll(productList);
  }

  void filterByLowestPrice() {
    filteredProducts.assignAll(products);
    filteredProducts.sort((a, b) => a.hargaPerkg!.compareTo(b.hargaPerkg!));
  }

  void filterByHighestPrice() {
    filteredProducts.assignAll(products);
    filteredProducts.sort((a, b) => b.hargaPerkg!.compareTo(a.hargaPerkg!));
  }

  void searchProduct(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(products);
    } else {
      filteredProducts.assignAll(products
          .where((product) =>
              product.nama_toko!.toLowerCase().contains(query.toLowerCase()) ||
              product.nama_kategori!
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList());
    }
  }
}
