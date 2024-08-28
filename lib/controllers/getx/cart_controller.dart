import 'package:get/get.dart';
import 'dart:math';
import 'history_controller.dart';

class CartController extends GetxController {
  final cartItems = <Map<String, String>>[].obs;
  final HistoryController historyController = Get.find();


  double get totalPrice {
    return cartItems.fold(0, (sum, item) {
      return sum + double.parse(item["price"]!.replaceAll(".", ""));
    });
  }

  double get serviceFee => 5000;

  double get totalBill => totalPrice + serviceFee;

  void addToCart(Map<String, String> newItem) {
    cartItems.add(newItem);
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
  }

  String generatePaymentMethod() {
    Random random = Random();
    int min = 10000000; // Batas bawah untuk 8 digit
    int max = 99999999; // Batas atas untuk 8 digit
    int randomNumber = min + random.nextInt(max - min);
    return randomNumber.toString();
  }

  void checkout(String armada, paymend) {
    if (cartItems.isNotEmpty) {
      // Create a copy of cartItems to avoid clearing the original list
      List<Map<String, String>> cartItemsCopy = List.from(cartItems);

      Map<String, dynamic> transaction = {
        'id': generatePaymentMethod(),
        'items': cartItemsCopy, // Use the copied list
        'totalPrice': totalPrice,
        'serviceFee': serviceFee,
        'totalBill': totalBill,
        'date': DateTime.now().toString(),
        'status': true,
        'paymentMethod': generatePaymentMethod(),
        'serviceFEE': serviceFee,
        'Armada': armada,
        'Paymend': paymend
      };

      historyController.addTransaction(transaction);
      clearCart();
    }
  }

  void clearCart() {
    cartItems.clear();
  }
}
