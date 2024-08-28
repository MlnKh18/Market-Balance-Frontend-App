import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:uas_market_balance_flutter/config/api/api_url.dart';
import 'package:uas_market_balance_flutter/controllers/getx/signIn_controller.dart';
import 'package:uas_market_balance_flutter/view/page/navigation/main_navbar.dart';

class VerifyDataUserController extends GetxController {
  final SignInController signc = Get.find();
  final formKey = GlobalKey<FormState>();
  late TextEditingController nomorKtpController;
  late TextEditingController namaLengkapController;
  late TextEditingController tanggalLahirController;
  late TextEditingController tempatLahirController;
  late TextEditingController provinsiController;
  late TextEditingController kotaController;
  late TextEditingController kecamatanController;
  late TextEditingController kelurahanController;
  late TextEditingController kodePosController;
  late TextEditingController notelpon;

  final selectedGender = RxString('');
  final selectedImagePath = RxString('');

  @override
  void onInit() {
    nomorKtpController = TextEditingController();
    namaLengkapController = TextEditingController();
    tanggalLahirController = TextEditingController();
    tempatLahirController = TextEditingController();
    provinsiController = TextEditingController();
    kotaController = TextEditingController();
    kecamatanController = TextEditingController();
    kelurahanController = TextEditingController();
    kodePosController = TextEditingController();
    notelpon = TextEditingController();
    super.onInit();
  }

  void pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    if (pickedImage != null) {
      selectedImagePath.value = pickedImage.path;
    }
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      addDataPersonalUser(
        nomorKtpController.text,
        namaLengkapController.text,
        tanggalLahirController.text,
        tempatLahirController.text,
        notelpon.text,
        selectedGender.value,
        selectedImagePath.value,
      );
      addDataAlamat(
        provinsiController.text,
        kotaController.text,
        kecamatanController.text,
        kelurahanController.text,
        kodePosController.text,
      );
      Get.off(() => MainNavBar());
    }
  }

  @override
  void dispose() {
    nomorKtpController.dispose();
    namaLengkapController.dispose();
    tanggalLahirController.dispose();
    tempatLahirController.dispose();
    provinsiController.dispose();
    kotaController.dispose();
    kecamatanController.dispose();
    kelurahanController.dispose();
    kodePosController.dispose();
    notelpon.dispose();
    super.dispose();
  }

  Future<void> addDataPersonalUser(
    String nomorKtp,
    String namaLengkap,
    String tanggalLahir,
    String tempatLahir,
    String notelpon,
    String kelamin,
    String imagePath,
  ) async {
    try {
      var url = Uri.parse(
          user_update); // Ganti dengan endpoint API untuk data personal
      var response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer ${signc.authToken}', // Ganti dengan cara Anda mendapatkan token
        },
        body: jsonEncode({
          'nomor_ktp': nomorKtp,
          'nama_lengkap': namaLengkap,
          'tanggal_lahir': tanggalLahir,
          'tempat_lahir': tempatLahir,
          'notelpon': notelpon,
          'kelamin': kelamin,
          'photo': imagePath,
        }),
      );
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        print(res['result']);
        Get.snackbar('Success', 'Personal data added successfully');
      } else {
        print('Failed to add personal data: ${response.reasonPhrase}');
        Get.snackbar(
            'Error', 'Failed to add personal data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error occurred: $e');
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  Future<void> addDataAlamat(
    String provinsi,
    String kota,
    String kecamatan,
    String kelurahan,
    String kodePos,
  ) async {
    try {
      var url = Uri.parse(
          alamat_add_by_user); // Ganti dengan endpoint API untuk data alamat
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer ${signc.authToken}', // Ganti dengan cara Anda mendapatkan token
        },
        body: jsonEncode({
          'provinsi': provinsi,
          'kota': kota,
          'kecamatan': kecamatan,
          'kelurahan': kelurahan,
          'kodepos': kodePos,
          'no_telp': notelpon.text,
        }),
      );
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        print(res['result']);
        Get.snackbar('Success', 'Address data added successfully');
      } else {
        print('Failed to add address data: ${response.reasonPhrase}');
        Get.snackbar(
            'Error', 'Failed to add address data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error occurred: $e');
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }
}
