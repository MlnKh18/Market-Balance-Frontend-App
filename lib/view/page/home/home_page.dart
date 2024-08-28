import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/controllers/getx/home_controller.dart';
import 'package:uas_market_balance_flutter/utils/resource/material_path_assets.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';
import 'package:uas_market_balance_flutter/view/page/comodities/product_commodities_page.dart';
import 'package:uas_market_balance_flutter/view/page/verifyAccount/store/register_store/register_store.dart';
import 'package:uas_market_balance_flutter/widgets/carousel_widget.dart';
import 'package:uas_market_balance_flutter/widgets/diagram_chart.dart';
import 'package:uas_market_balance_flutter/widgets/menu_selected_for_home.dart';

import '../../../models/user_model.dart';

class HomePage extends StatelessWidget {
  final HomeController homeC = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAccountVerified(UserModel user) {
      return user.nomorKtp == null &&
          user.tempatLahir == null &&
          user.namaLengkap == null &&
          user.noTelp == null &&
          user.photo == null &&
          user.tanggalLahir == null;
    }

    final user = homeC.user.value;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: fiveColor,
          leading: Container(
            margin: const EdgeInsets.all(6),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(
                  Assets.logoApp2,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Obx(() {
            final username = homeC.user.value.username ?? 'Guest';
            return Text(
              username,
              style: const TextStyle(color: Colors.white),
            );
          }),
          actions: [
            CircleAvatar(
              backgroundColor: fiveColor,
              child: IconButton(
                onPressed: () {
                  print(homeC.user.value);
                },
                icon: const Icon(
                  Icons.notifications,
                  color: secondaryColor,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 20),
              child: CircleAvatar(
                backgroundImage: AssetImage(Assets.pofileImage),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: ExpansionTile(
                  title: Text(
                    'Lombok',
                    style: fontPoppins.copyWith(
                      fontSize: fSz13,
                      fontWeight: fWBold,
                    ),
                  ),
                  children: const <Widget>[
                    ListTile(
                      title: Text('Mataram'),
                    ),
                    ListTile(
                      title: Text('Mataram'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Toko Saya!",
                      style: fontPoppins.copyWith(
                        fontSize: fSz14,
                        fontWeight: fWBold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 20),
                      child: Text(
                        'Daftarkan toko untuk berjualan product',
                        style: fontPoppins.copyWith(
                            color: textGreyColor, fontSize: fSz12),
                      ),
                    ),
                    OptionStatusAccount(
                      gestureVerifyPage: () => Get.toNamed('/verify_data_user'),
                      icon: Icons.verified,
                      title: isAccountVerified(user)
                          ? 'Akun belum verify'
                          : user.namaLengkap ?? '',
                      trailingText:
                          isAccountVerified(user) ? 'Verify Sekarang' : '',
                    ),
                    OptionStatusAccount(
                      gestureVerifyPage: () =>
                          Get.to(() => const RegisterStorePage()),
                      icon: Icons.store,
                      title: "Belum ada Toko",
                      trailingText: "Daftakan Segera",
                    ),
                    const CarouselCustomeWidget(),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 4.0,
                        runSpacing: 4.0,
                        children: List.generate(
                          homeC.imageCategory.length,
                          (index) => InkWell(
                            onTap: () {
                              Get.to(() => ProductCommoditiesPage(
                                    imageUrl:
                                        '${homeC.imageCategory[index].image}', // Replace with your IP
                                    category: homeC.imageCategory[index]
                                            .namaKategori ??
                                        '',
                                  ));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 45,
                                height: 50,
                                child: Image.asset(
                                  '${homeC.imageCategory[index].image}', // Replace with your IP
                                  width: 40,
                                  height: 10.0,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.error,
                                        color: Colors.red);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MenuSelectedForHome(
                          icon: Icons.money_outlined,
                          title: "Catatan Financial",
                          color: secondaryColor,
                          ontap: () {},
                        ),
                        MenuSelectedForHome(
                          icon: Icons.info,
                          title: "About Applications",
                          color: primaryColor,
                          ontap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(30),
              const ChartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionStatusAccount extends StatelessWidget {
  final IconData icon;
  final String title;
  final String trailingText;
  final VoidCallback gestureVerifyPage;

  const OptionStatusAccount({
    required this.icon,
    required this.title,
    required this.trailingText,
    required this.gestureVerifyPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: primaryColor,
          size: 20,
        ),
        title: Text(
          title,
          style: fontPoppins.copyWith(
            color: primaryColor,
            fontWeight: fWBold,
            fontSize: fSz11,
          ),
        ),
        trailing: GestureDetector(
          onTap: gestureVerifyPage,
          child: Text(
            trailingText,
            style: fontPoppins.copyWith(
              color: secondaryColor,
              fontWeight: fWBold,
            ),
          ),
        ),
      ),
    );
  }
}
