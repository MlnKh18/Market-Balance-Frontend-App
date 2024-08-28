import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';

CustomeSnackBar(title, msg, type) {
  Get.snackbar(title, msg,
      snackPosition: SnackPosition.TOP,
      titleText :Text(
      title,
      style: const TextStyle(
        color: Colors.white,  // Sesuaikan warna teks snackbar sesuai kebutuhan
        fontSize: 16,
      ),),
      messageText: Text(
      msg,
      style: const TextStyle(
        color: Colors.white,  // Sesuaikan warna teks snackbar sesuai kebutuhan
        fontSize: 16,
      ),),
      duration: const Duration(seconds: 1),
      backgroundColor: type == 'error' ? errorBackgroundColor : successBackgroundColor);
}
