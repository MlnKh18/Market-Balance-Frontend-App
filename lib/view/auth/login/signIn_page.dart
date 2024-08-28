import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../utils/resource/material_path_assets.dart';
import '../../../../../utils/theme/materials_colors.dart';
import '../../../../../utils/theme/materials_fonts.dart';
import '../../../../../controllers/getx/signIn_controller.dart';
import '../../../../../view/auth/register/signUp_page.dart';
import '../../../../../widgets/button.dart';
import '../../../../../widgets/textform_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final signInC = Get.put(SignInController());

  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: fourtColor,
      body: SingleChildScrollView(
        reverse: true,
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              width: 170,
              height: 170,
              child: Image.asset(
                Assets.logoApp,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top / 1.3,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: _formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sign-In",
                        style: fontPoppins.copyWith(
                          fontSize: fSz32,
                          fontWeight: fWBold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    FormFieldOutline(
                      label: "Email atau No. Hp",
                      controller: signInC.emailC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email or phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Obx(() {
                      return FormFieldOutline(
                        onpressed: () => signInC.changeVisibility(),
                        iconsuffix: (signInC.isVisible.value == true)
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        label: "Password",
                        controller: signInC.passwordC,
                        obscureText: signInC.isVisible.value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      );
                    }),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forget Password",
                          style: fontPoppins.copyWith(
                            color: secondaryColor,
                            fontWeight: fWBold,
                            fontSize: fSz11,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    ButtonNavigation(
                      vrtPadding: 12,
                      titleText: 'Login',
                      onpressed: () {
                        if (_formState.currentState!.validate()) {
                          signInC.checkLoginForm();
                          // Navigasi setelah berhasil login menggunakan GetX navigation
                        }
                      },
                      textColor: whiteColor,
                      hrzPadding: 120,
                      colorBackground: primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: fontPoppins.copyWith(fontSize: fSz13),
                          children: [
                            const TextSpan(
                              text: "Don't have an account?, ",
                              style: TextStyle(color: blackColor),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => SignUpPage()),
                              text: "Sign Up",
                              style: TextStyle(
                                color: secondaryColor,
                                fontWeight: fWBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
