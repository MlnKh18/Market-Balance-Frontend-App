import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';

import '../../../../controllers/getx/verify_user_controller.dart';

class RadioListTileWidget extends StatelessWidget {
  final String titleFirst;
  final String titleSecondary;
  final String valueRadioOne;
  final String valueRadioTwo;
   final String? Function(String?) onchanged;

  const RadioListTileWidget({
    required this.onchanged,
    required this.titleFirst,
    required this.titleSecondary,
    required this.valueRadioOne,
    required this.valueRadioTwo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final VerifyDataUserController controller = Get.find();

    return Obx(() => Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: Text(titleFirst),
                activeColor: secondaryColor,
                value: valueRadioOne,
                groupValue: controller.selectedGender.value,
                onChanged: (value) {
                  controller.selectedGender.value = value!;
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: Text(titleSecondary),
                activeColor: secondaryColor,
                value: valueRadioTwo,
                groupValue: controller.selectedGender.value,
                onChanged:onchanged
              ),
            ),
          ],
        ));
  }
}
