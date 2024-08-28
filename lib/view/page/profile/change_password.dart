import 'package:flutter/material.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';
import 'package:uas_market_balance_flutter/widgets/button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 140,
              color: primaryColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets
                          .zero, // Menghilangkan padding bawaan ListTile
                      title: Text(
                        "Ubah Kata Sandi",
                        style: fontPoppins.copyWith(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: fSz16,
                        ),
                      ),
                      subtitle: Text(
                        """
Kata sandi Anda harus paling tidak 6
karakter dan harus kombinasi angka, huruf,
dan karakter khusus (!\$@%).
""",
                        style: fontPoppins.copyWith(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: fSz11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Kata sandi saat ini",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Kata sandi baru",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Tulis ulang kata sandi baru",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Lupa sandi?",
                          style: fontPoppins.copyWith(
                              color: secondaryColor, fontWeight: fW600),
                        )),
                  ),
                  const Spacer(),
                  ButtonNavigation(
                      titleText: "Ubah kata sandi",
                      onpressed: () {},
                      textColor: whiteColor,
                      hrzPadding: 100,
                      colorBackground: secondaryColor)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
