import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import '../../../../../controllers/getx/store_controller.dart';
import '../../../../../utils/theme/materials_fonts.dart';
import '../../../../../view/page/verifyAccount/store/product_store/add_product_page.dart';
import '../../../../../widgets/app_bar_in_preferredsize.dart';
import '../../../../../widgets/button.dart';
import '../../../../../widgets/menu_selected_for_home.dart';
import '../../../../../widgets/textform_field.dart';
import '../../../../../utils/theme/materials_colors.dart';

class RegisterStorePage extends StatelessWidget {
  const RegisterStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterStoreController controller =
        Get.put(RegisterStoreController());

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBarInPreferredSize(title: "Daftar Toko"),
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  return CircleAvatar(
                    backgroundColor: whiteColor,
                    radius: 50,
                    backgroundImage: controller.storeProfileImage.value != null
                        ? FileImage(controller.storeProfileImage.value!)
                        : null,
                    child: controller.storeProfileImage.value == null
                        ? const Icon(
                            Icons.person,
                            size: 50,
                          )
                        : null,
                  );
                }),
                const Gap(10),
                MenuSelectedForHome(
                  icon: Icons.image,
                  title: "Ambil Profile Toko",
                  color: secondaryColor,
                  ontap: () => controller.pickImage(),
                ),
                const Gap(25),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      FormFieldOutline(
                        controller: controller.storeNameController,
                        label: "Nama Toko",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the store name';
                          }
                          return null;
                        },
                      ),
                      const Gap(10),
                      FormFieldOutline(
                        controller: controller.storeAddressController,
                        label: "Alamat Toko",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the store address';
                          }
                          return null;
                        },
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  width: 100,
                  height: 120,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(() => AddProductPage()),
                        child: const Icon(
                          Icons.add,
                          size: 65,
                          color: greyColor,
                        ),
                      ),
                      Text(
                        "Tambah Product",
                        style: fontPoppins.copyWith(
                            color: greyColor, fontSize: fSz10),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                ButtonNavigation(
                  titleText: "Submit",
                  onpressed: () => controller.submitForm(),
                  textColor: whiteColor,
                  hrzPadding: 100,
                  colorBackground: fiveColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
