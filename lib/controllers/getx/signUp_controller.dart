import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/config/api/api_url.dart';
import 'package:uas_market_balance_flutter/models/user_model.dart';
import '../../widgets/snackbar_custome.dart';

class SignUpController extends GetxController {
  final isVisible = true.obs;
  late TextEditingController usernameC, emailC, passwordC, confirmPasswordC;

  @override
  void onInit() {
    usernameC = TextEditingController();
    emailC = TextEditingController();
    passwordC = TextEditingController();
    confirmPasswordC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    usernameC.dispose();
    emailC.dispose();
    passwordC.dispose();
    confirmPasswordC.dispose();
    super.onClose();
  }

  void changeVisibility() {
    isVisible.value = !isVisible.value;
  }

  void checkRegister() {
    if (usernameC.text.isEmpty || emailC.text.isEmpty || passwordC.text.isEmpty) {
      CustomeSnackBar('Error', 'All fields are required', 'error');
    } else {
      Get.showOverlay(
          asyncFunction: () =>
              register(usernameC.text, emailC.text, passwordC.text),
          loadingWidget: const CircularProgressIndicator());
    }
  }

  Future<void> register(String username, String email, String password) async {
    UserModel user = UserModel(username: username, email: email, password: password);
    try {
      var response = await http.post(
        Uri.parse(auth_register),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        print(res['result']);
        CustomeSnackBar('success', 'Akun Sudah Ditambahkan', 'success');
        Get.toNamed('/login');
      } else {
        print('Gagal mendaftar: ${response.reasonPhrase}');
        CustomeSnackBar('error', 'Gagal mendaftar: ${response.reasonPhrase}', 'error');
      }
    } catch (e) {
      print('Ada error di $e');
      CustomeSnackBar('error', 'Terjadi kesalahan: $e', 'error');
    }
  }
}
