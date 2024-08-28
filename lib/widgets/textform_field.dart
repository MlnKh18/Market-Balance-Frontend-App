import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../utils/theme/materials_colors.dart';
import '../../../../../utils/theme/materials_fonts.dart';

class FormFieldOutline extends StatelessWidget {
  final TextEditingController controller;
  final double? widthTextField;
  final VoidCallback? onpressed;
  final String label;
  final bool? obscureText;
  final IconData? iconsuffix;
  final String? Function(String?) validator;

  const FormFieldOutline({
    super.key,
    required this.validator,
    required this.controller,
    required this.label,
    this.widthTextField,
    this.obscureText = false,
    this.onpressed,
    this.iconsuffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: fontPoppins.copyWith(
              fontSize: fSz13, fontWeight: fW600, color: fiveColor),
        ),
        SizedBox(
          width: widthTextField ?? double.infinity,
          height: 50,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText!,
            autofocus: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: whiteColor,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 0.8),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: fiveColor, width: 1),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber, width: 1),
              ),
              suffixIcon: iconsuffix != null
                  ? IconButton(
                      onPressed: onpressed,
                      icon: FaIcon(iconsuffix),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 12, horizontal: 16), // Sesuaikan dengan kebutuhan
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
