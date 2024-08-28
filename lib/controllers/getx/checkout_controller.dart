import 'package:get/get.dart';

class CheckOutController extends GetxController {
  var selectedArmada = "".obs;
  var selectedPayment = "".obs;
  final cartItems = <Map<String, String>>[].obs;

  void selectArmada(String armada) {
    selectedArmada.value = armada;
  }

  void selectPayment(String payment) {
    selectedPayment.value = payment;
  }
}
