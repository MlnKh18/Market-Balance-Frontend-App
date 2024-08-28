import 'package:flutter/material.dart';
import 'package:uas_market_balance_flutter/utils/resource/material_path_assets.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';
import 'package:uas_market_balance_flutter/view/auth/login/signIn_page.dart';
import 'package:uas_market_balance_flutter/widgets/button.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 100),
              width: 200,
              height: 200,
              child: Image.asset(Assets.openingIlustrations),
            ),
            Text(
              "Butuh Bantuan?",
              style: fontPoppins.copyWith(fontSize: fSz16, fontWeight: fW600),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 50, bottom: 150, left: 20, right: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: fontPoppins.copyWith(
                      fontSize: fSz13,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Hubungi ',
                        style: TextStyle(
                          color: blackColor,
                        ),
                      ),
                      TextSpan(
                          text: '082340779098 ',
                          style: TextStyle(
                            color: secondaryColor,
                            fontWeight: fWBold,
                          )),
                      const TextSpan(
                        text: 'atau ',
                        style: TextStyle(
                          color: blackColor,
                        ),
                      ),
                      const TextSpan(
                        text: 'Email maulanakhairuman2004@gmail.com ',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      const TextSpan(
                        text: ' jika ada yang perlu ditanyakan',
                        style: TextStyle(
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                )),
            ButtonNavigation(
              vrtPadding: 12,
              titleText: "Lanjutkan",
              onpressed: () {
                print("1");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SignInPage();
                    },
                  ),
                );
              },
              textColor: whiteColor,
              colorBackground: primaryColor,
              hrzPadding: 100,
            ),
          ],
        ),
      ),
    );
  }
}
