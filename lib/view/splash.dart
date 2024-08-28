import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/resource/material_path_assets.dart';
import '../../../../../utils/theme/materials_colors.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key}) {
    Get.put(SplashController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      body: Center(
        child: Container(
          width: 170,
          height: 170,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.logoApp), fit: BoxFit.cover,)),
        ),
      ),
    );
  }
}

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), () => Get.offAndToNamed('/opening'));
  }
}
