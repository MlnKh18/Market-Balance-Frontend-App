import 'package:get/get.dart';
import '../../../models/product_model.dart';

class FavoriteController extends GetxController {
  var favoriteProducts = <ProductModel>[].obs;

  void addFavorite(ProductModel product) {
    if (!favoriteProducts.contains(product)) {
      favoriteProducts.add(product);
    }
  }

  void removeFavorite(ProductModel product) {
    favoriteProducts.remove(product);
  }

  bool isFavorite(ProductModel product) {
    return favoriteProducts.contains(product);
  }
}
