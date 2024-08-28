import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../animation/left.dart';
import '../../../../../utils/resource/material_path_assets.dart';
import '../../../../../utils/theme/materials_colors.dart';
import '../../../../../utils/theme/materials_fonts.dart';
import '../../../../../controllers/getx/signUp_controller.dart';
import '../../../../../view/auth/login/signIn_page.dart';
import '../../../../../widgets/button.dart';
import '../../../../../widgets/textform_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final signUpC = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final formState = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 230,
                  height: 150,
                  child: Image.asset(
                    Assets.signupIlustrations,
                    fit: BoxFit.contain,
                  ),
                ),
                Form(
                  key: formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sign-Up",
                          style: fontPoppins.copyWith(
                            fontSize: fSz32,
                            fontWeight: fWBold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      FormFieldOutline(
                        label: "Username",
                        controller: signUpC.usernameC,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      FormFieldOutline(
                        label: "Email atau No. Hp",
                        controller: signUpC.emailC,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email or phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Obx(() {
                        return FormFieldOutline(
                          onpressed: () => signUpC.changeVisibility(),
                          iconsuffix: (signUpC.isVisible.value)
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          label: "Password",
                          controller: signUpC.passwordC,
                          obscureText: signUpC.isVisible.value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        );
                      }),
                      const SizedBox(height: 10),
                      Obx(() {
                        return FormFieldOutline(
                          onpressed: () => signUpC.changeVisibility(),
                          iconsuffix: (signUpC.isVisible.value)
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          label: "Confirm Password",
                          controller: signUpC.confirmPasswordC,
                          obscureText: signUpC.isVisible.value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != signUpC.passwordC.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        );
                      }),
                      const SizedBox(height: 20),
                      ButtonNavigation(
                        vrtPadding: 12,
                        titleText: 'Submit',
                        onpressed: () {
                          if (formState.currentState!.validate()) {
                            signUpC.checkRegister();
                            print(signUpC.passwordC.text);
                          }
                        },
                        textColor: whiteColor,
                        hrzPadding: 120,
                        colorBackground: primaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: fontPoppins.copyWith(fontSize: fSz13),
                            children: [
                              const TextSpan(
                                text: "Have an account? ",
                                style: TextStyle(color: blackColor),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return LeftAnimation(
                                              delay: 1, child: SignInPage());
                                        },
                                      ),
                                    );
                                  },
                                text: "Sign In",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
