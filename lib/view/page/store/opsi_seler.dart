
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_fonts.dart';

class OpsiSellerPage extends StatelessWidget {
  const OpsiSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: whiteColor,
            child: ListTile(
              leading: const CircleAvatar(
                  child: Icon(
                Icons.person,
                color: blackColor,
              )),
              title: Text(
                "Maulana_Strore.id",
                style: fontPoppins.copyWith(
                    fontWeight: fWBold, fontSize: fSz12, color: fiveColor),
              ),
              subtitle: Text(
                "120 Pengikut || 4.5 Rating",
                style: fontPoppins.copyWith(
                    fontWeight: fWBold, fontSize: 10, color: fiveColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Status Pemesanan",
              style: fontPoppins.copyWith(
                fontWeight: fWBold,
                color: fiveColor,
                fontSize: fSz12,
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BoxStatusStore(number: 3, title: "Perlu Dikirim"),
              BoxStatusStore(number: 3, title: "Pembatalan"),
              BoxStatusStore(number: 3, title: "Pengembalian"),
              BoxStatusStore(number: 3, title: "Perlu dibayar"),
            ],
          ),
          const Gap(40),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  BoxFiturStore(
                    icon: Icons.account_balance_wallet_rounded,
                  ),
                  BoxFiturStore(
                    icon: Icons.account_balance_wallet_rounded,
                  ),
                  BoxFiturStore(
                    icon: Icons.account_balance_wallet_rounded,
                  ),
                  BoxFiturStore(
                    icon: Icons.account_balance_wallet_rounded,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BoxFiturStore extends StatelessWidget {
  final IconData icon;
  const BoxFiturStore({
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: fiveColor),
      child: Icon(
        icon,
        size: 40,
        color: whiteColor,
      ),
    );
  }
}

class BoxStatusStore extends StatelessWidget {
  final int number;
  final String title;
  const BoxStatusStore({
    required this.number,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: 80,
      height: 85,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              number.toString(),
              style: fontPoppins.copyWith(
                fontWeight: fWBold,
                fontSize: fSz16,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: fontPoppins.copyWith(
                fontWeight: fWBold,
                fontSize: 9,
              ),
            ),
          ]),
    );
  }
}
