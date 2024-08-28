import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/theme/materials_colors.dart';
import '../utils/theme/materials_fonts.dart';

class ProductItemTransactions extends StatelessWidget {
  final String historyDate;
  final String titleProduct;
  final bool? statusTransactions;
  final String storeName;
  final VoidCallback ontap;
  final String deskProduct;
  final String priceProduct;

  const ProductItemTransactions({
    required this.historyDate,
    required this.ontap,
    required this.titleProduct,
    required this.statusTransactions,
    required this.storeName,
    required this.deskProduct,
    required this.priceProduct,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: blackColor, width: 0.5),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(
                0.3,
              ), // Warna bayangan dengan transparansi
              spreadRadius: 2, // Radius penyebaran bayangan
              blurRadius: 5, // Radius blur bayangan
              offset: const Offset(0, 3), // Posisi offset bayangan
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.shopping_basket_rounded,
                color: secondaryColor,
                size: 28,
              ),
              title: Text(
                "Transaksi",
                style: fontPoppins.copyWith(
                    color: fiveColor, fontSize: fSz11, fontWeight: fWBold),
              ),
              subtitle: Text(
                historyDate,
                style: fontPoppins.copyWith(
                    color: greyColor, fontSize: fSz11, fontWeight: fwRegular),
              ),
              trailing: Container(
                width: 75,
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: (statusTransactions == true
                      ? successBackgroundColor
                      : canceledBackgroundColor),
                ),
                child: Text(
                  (statusTransactions == true ? "Berhasil" : "Gagal"),
                  style: fontPoppins.copyWith(
                      color: (statusTransactions == true
                          ? successTextColor
                          : canceledTextColor),
                      fontSize: 10,
                      fontWeight: fWBold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Divider(
              height: 1,
              color: greyColor,
            ),
            const Gap(10),
            Row(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.all(10),
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                      color: backgroundImageProductColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.featured_play_list_sharp,
                      color: fiveColor,
                      size: 30,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      titleProduct,
                      style: fontPoppins.copyWith(
                        color: fiveColor,
                        fontSize: fSz13,
                        fontWeight: fWBold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: 100,
                      height: 21,
                      decoration: BoxDecoration(
                        color: fiveColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        storeName,
                        style: fontPoppins.copyWith(
                            color: whiteColor,
                            fontSize: fSz11,
                            fontWeight: fWBold),
                      ),
                    ),
                    Text(
                      deskProduct,
                      style: fontPoppins.copyWith(
                        color: greyColor,
                        fontSize: fSz11,
                        fontWeight: fwRegular,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(
                    16.0), // Ubah nilai padding sesuai kebutuhan
                child: RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Total Belanja\n',
                        style: fontPoppins.copyWith(
                          color: greyColor,
                          fontSize: fSz11,
                          fontWeight: fWBold,
                        ),
                      ),
                      TextSpan(
                        text: priceProduct,
                        style: fontPoppins.copyWith(
                          color: primaryColor,
                          fontSize: fSz13,
                          fontWeight: fWBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
