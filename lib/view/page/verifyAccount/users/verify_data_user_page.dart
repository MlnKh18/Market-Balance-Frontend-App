import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';
import 'package:uas_market_balance_flutter/view/page/verifyAccount/users/input_gender.dart';
import 'package:uas_market_balance_flutter/widgets/menu_selected_for_home.dart';
import 'package:uas_market_balance_flutter/widgets/outline_button.dart';

import '../../../../controllers/getx/verify_user_controller.dart';
import '../../../../widgets/app_bar_in_preferredsize.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/textform_field.dart';

class VerifyDataUserPage extends StatelessWidget {
  VerifyDataUserPage({super.key});

  final VerifyDataUserController controller =
      Get.put(VerifyDataUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBarInPreferredSize(
          title: "Verify account",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              _buildSectionTitle("Data Diri"),
              _buildFormField(
                label: "Nomer Sesuai KTP",
                controller: controller.nomorKtpController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your KTP number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              _buildFormField(
                label: "Nama Sesuai KTP",
                controller: controller.namaLengkapController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name as per KTP';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              _buildFormField(
                label: "Tanggal Lahir",
                controller: controller.tanggalLahirController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your birth date';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              _buildFormField(
                label: "Tempat Lahir",
                controller: controller.tempatLahirController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your birth place';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildSectionTitle("Alamat"),
              _buildFormField(
                label: "Provinsi",
                controller: controller.provinsiController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your province';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              _buildFormField(
                label: "Kota/Kabupaten",
                controller: controller.kotaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your city/district';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              _buildFormField(
                label: "Kecamatan",
                controller: controller.kecamatanController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your sub-district';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              _buildFormField(
                label: "Kelurahan",
                controller: controller.kelurahanController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your village';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              _buildFormField(
                label: "Kode Pos",
                controller: controller.kodePosController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your postal code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              _buildFormField(
                label: "Nomer Telpon",
                controller: controller.notelpon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your No.Telpon';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildSectionTitle("Jenis Kelamin"),
              const SizedBox(height: 10),
              _buildGenderSelection(),
              const SizedBox(height: 10),
              _buildPhotoSection(),
              const SizedBox(height: 60),
              _buildButtonRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return ListTile(
      leading: const Icon(Icons.supervised_user_circle),
      title: Text(
        title,
        style: fontPoppins.copyWith(fontSize: fSz11, color: fiveColor),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormFieldOutline(
          controller: controller,
          label: label,
          validator: validator!,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildGenderSelection() {
    return RadioListTileWidget(
      titleFirst: "Laki-laki",
      titleSecondary: "Perempuan",
      valueRadioOne: "laki-laki",
      valueRadioTwo: "Perempuan",
      onchanged: (value) {
        controller.selectedGender.value = value!;
        return null;
      },
    );
  }

  Widget _buildPhotoSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() {
          return CircleAvatar(
            backgroundColor: whiteColor,
            radius: 50,
            backgroundImage: controller.selectedImagePath.value.isNotEmpty
                ? FileImage(File(controller.selectedImagePath.value))
                : null,
            child: controller.selectedImagePath.value.isEmpty
                ? const Icon(
                    Icons.person,
                    size: 50,
                  )
                : null,
          );
        }),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MenuSelectedForHome(
              icon: Icons.camera_alt_rounded,
              title: "Ambil Photo",
              color: secondaryColor,
              ontap: () => controller.pickImage(ImageSource.camera),
            ),
            MenuSelectedForHome(
              icon: Icons.image,
              title: "Ambil Gambar",
              color: secondaryColor,
              ontap: () => controller.pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlineButtonWidget(
          hrzPadding: 55,
          title: "Cancel",
          onPressed: () => Get.back(),
        ),
        ButtonNavigation(
          titleText: "Submit",
          onpressed: () => controller.submitForm(),
          textColor: whiteColor,
          hrzPadding: 55,
          colorBackground: fiveColor,
        ),
      ],
    );
  }
}
