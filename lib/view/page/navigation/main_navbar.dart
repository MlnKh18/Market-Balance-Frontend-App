import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/controllers/getx/main_nav_controller.dart';

class MainNavBar extends StatelessWidget {
  final MainScreenNavController controller = Get.put(MainScreenNavController());

  MainNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screens[controller.currentIndex.value]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(
          Icons.store,
          color: whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: fiveColor,
        notchMargin: 10,
        child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  controller.icons.length,
                  (index) => CircleAvatar(
                        backgroundColor: controller.currentIndex.value == index
                            ? secondaryColor
                            : transparantColor,
                        child: IconButton(
                          icon: Icon(
                            controller.icons[index],
                          ),
                          onPressed: () =>
                              controller.currentIndex.value = index,
                          color: controller.currentIndex.value == index
                              ? primaryColor
                              : whiteColor,
                        ),
                      )),
            )),
      ),
    );
  }
}
