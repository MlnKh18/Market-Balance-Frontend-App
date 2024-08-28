import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:uas_market_balance_flutter/controllers/getx/signIn_controller.dart';
import 'package:uas_market_balance_flutter/config/api/api_url.dart';
import 'package:http_parser/http_parser.dart'; // Import untuk MediaType
import 'package:uas_market_balance_flutter/view/page/verifyAccount/store/product_store/add_product_page.dart';
import '../../widgets/snackbar_custome.dart';

class RegisterStoreController extends GetxController {
  final signC = Get.find<SignInController>();
  final formKey = GlobalKey<FormState>();
  final storeNameController = TextEditingController();
  final storeAddressController = TextEditingController();
  final storeProfileImage = Rx<File?>(null);

  void pickImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      storeProfileImage.value = File(pickedImage.path);
    }
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      registerStoreUser();
      Get.off(() => AddProductPage());
    } else {
      Get.snackbar('Error', 'Please fill in all required fields');
    }
  }

  @override
  void onClose() {
    storeNameController.dispose();
    storeAddressController.dispose();
    super.onClose();
  }

  Future<void> registerStoreUser() async {
    final url = Uri.parse(store_create);

    var request = http.MultipartRequest('POST', url)
      ..headers[HttpHeaders.authorizationHeader] = 'Bearer ${signC.authToken}'
      ..fields['nama_toko'] = storeNameController.text
      ..fields['alamat'] = storeAddressController.text;

    if (storeProfileImage.value != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'logo',
        storeProfileImage.value!.path,
        contentType: MediaType('image', 'jpeg'), // Definisi MediaType
      ));
    }

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var res = await http.Response.fromStream(response);
        var resBody = jsonDecode(res.body);
        print(resBody['result']);
        CustomeSnackBar(
            'success', 'Store has been registered successfully', 'success');
        Get.to(() => AddProductPage());
      } else {
        var res = await http.Response.fromStream(response);
        print('Failed to register: ${res.reasonPhrase}');
        CustomeSnackBar(
            'error', 'Failed to register: ${res.reasonPhrase}', 'error');
      }
    } catch (e) {
      print('Error occurred: $e');
      CustomeSnackBar('error', 'An error occurred: $e', 'error');
    }
  }
}
