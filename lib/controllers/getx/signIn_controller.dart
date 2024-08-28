import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/api/api_url.dart';
import '../../models/user_model.dart';
import '../../widgets/snackbar_custome.dart';

class SignInController extends GetxController {
  late TextEditingController emailC, passwordC;
  final isVisible = true.obs;
  var user = UserModel().obs;
  String? authToken;

  SignInController() {
    emailC = TextEditingController();
    passwordC = TextEditingController();
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }

  void changeVisibility() {
    isVisible.value = !isVisible.value;
  }

  void checkLoginForm() {
    if (emailC.text.isEmpty || passwordC.text.isEmpty) {
      CustomeSnackBar('Error', 'All fields are required', 'error');
    } else {
      Get.showOverlay(
        asyncFunction: login,
        loadingWidget: const CircularProgressIndicator(),
      );
    }
  }

  Future<void> login() async {
    try {
      var response = await http.post(
        Uri.parse(auth_login),
        body: {
          'email': emailC.text,
          'password': passwordC.text,
        },
      );
      print('Response Status Code: ${response.statusCode}'); // Debugging
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        var status = responseBody;
        var token = responseBody['token'];
        authToken = token; // Simpan token ke dalam authToken
        print('Token: $token');
        print('Status: $status');

        if (status != null) {
          Get.snackbar(
            'Info',
            'Login Berhasil',
            backgroundColor: const Color.fromARGB(255, 28, 65, 1),
            colorText: Colors.white,
          );
          getUserByEmail();
          Future.delayed(
            const Duration(milliseconds: 1000),
            () => Get.offNamed('/main'),
          );
        } else {
          Get.snackbar(
            'Info',
            'Login Gagal',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Failed to connect to server',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'Failed to connect to server',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> getUserByEmail() async {
    try {
      var response = await http.get(
        Uri.parse(
            user_get_by_token), // Ganti dengan endpoint yang sesuai di server Anda
        headers: {
          'Authorization':
              'Bearer $authToken', // Menggunakan token untuk otorisasi
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var userData = jsonDecode(response.body);
        print(userData);
        print(userData['data']);

        user.value = UserModel.fromJson(userData['data']); // Update user data
        print('User Data: ${user.value}');
      } else {
        Get.snackbar('Error', 'Failed to get user data',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', 'Failed to connect to server',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
