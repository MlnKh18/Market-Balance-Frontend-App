import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/animation/right.dart';
import 'package:uas_market_balance_flutter/controllers/getx/home_controller.dart';
import 'package:uas_market_balance_flutter/controllers/getx/signIn_controller.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';
import 'package:uas_market_balance_flutter/view/page/profile/change_password.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 140,
              color: primaryColor,
              child: Text(
                "Profile",
                style: fontPoppins.copyWith(
                    color: whiteColor, fontWeight: fWBold, fontSize: fSz16),
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundColor: backgroundColor,
                        child: Icon(
                          Icons.person,
                          size: 40,
                        ),
                      ),
                      title: Text(
                        "Lalu Maulana Khairuman Dwipa",
                        style: fontPoppins.copyWith(
                            color: primaryColor,
                            fontWeight: fW400,
                            fontSize: fSz11),
                      ),
                      subtitle: Text(
                        "maulanakhairuman@gmail.com",
                        style: fontPoppins.copyWith(
                            color: textGreyColor, fontSize: 9),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: textGreyColor,
                    ),
                    ListTile(
                      leading: const Icon(Icons.person_outline),
                      title: Text(
                        "Ubah Data Akun",
                        style: fontPoppins.copyWith(
                            color: primaryColor,
                            fontSize: fSz11,
                            fontWeight: fWBold),
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone_android),
                      title: Text(
                        "Ubah Nomer Telpon",
                        style: fontPoppins.copyWith(
                            color: primaryColor,
                            fontSize: fSz11,
                            fontWeight: fWBold),
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const RightAnimation(
                              delay: 1,
                              child: ChangePasswordScreen(),
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: const Icon(Icons.lock),
                        title: Text(
                          "Ubah sandi akun",
                          style: fontPoppins.copyWith(
                              color: primaryColor,
                              fontSize: fSz11,
                              fontWeight: fWBold),
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.call),
                      title: Text(
                        "Pusat bantuan",
                        style: fontPoppins.copyWith(
                            color: primaryColor,
                            fontSize: fSz11,
                            fontWeight: fWBold),
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
