import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uas_market_balance_flutter/widgets/app_bar_in_preferredsize.dart';
import 'package:uas_market_balance_flutter/widgets/card_item_transactions.dart';

import '../../../utils/theme/materials_colors.dart';
import '../../../utils/theme/materials_fonts.dart';

class DetailsTransactionsPage extends StatelessWidget {
  final String historyDate;
  final String titleProduct;
  final bool statusTransactions;
  final String storeName;
  final String deskProduct;
  final String priceProduct;
  final String paymentMethod;
  final String serviceFEE;
  final String totalBill;
  final String paymend;
  final String armada;

  const DetailsTransactionsPage({
    super.key,
    required this.historyDate,
    required this.titleProduct,
    required this.statusTransactions,
    required this.storeName,
    required this.deskProduct,
    required this.priceProduct,
    required this.paymentMethod,
    required this.serviceFEE,
    required this.totalBill,
    required this.paymend,
    required this.armada,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBarInPreferredSize(title: "Detail Transaction"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20)
                  .copyWith(top: 10, bottom: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Pesanan',
                        style: fontPoppins.copyWith(
                          color: fiveColor,
                          fontSize: fSz14,
                          fontWeight: fWBold,
                        ),
                      ),
                      const Gap(15),
                      Container(
                        width: 75,
                        height: 18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: (statusTransactions)
                              ? successBackgroundColor
                              : canceledBackgroundColor,
                        ),
                        child: Text(
                          statusTransactions ? "Berhasil" : "Gagal",
                          style: fontPoppins.copyWith(
                            color: (statusTransactions)
                                ? successTextColor
                                : canceledTextColor,
                            fontSize: 10,
                            fontWeight: fWBold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ProductItemTransactions(
                      historyDate: historyDate,
                      titleProduct: titleProduct,
                      statusTransactions: statusTransactions,
                      storeName: storeName,
                      deskProduct: deskProduct,
                      priceProduct: priceProduct,
                      ontap: () {},
                    ),
                  ),
                ],
              ),
            ),
            _buildInfoPengirimanSection(),
            _buildRincianPembayaranSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoPengirimanSection() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      height: 150,
      color: backgroundImageTransactionsColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Info Pengiriman",
            style: fontPoppins.copyWith(
              color: fiveColor,
              fontSize: 11,
              fontWeight: fWBold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Kurir",
                        style: fontPoppins.copyWith(
                          color: textGreyColor,
                          fontSize: 10,
                          fontWeight: fWBold,
                        ),
                      ),
                      Text(
                        "No Resi",
                        style: fontPoppins.copyWith(
                          color: textGreyColor,
                          fontSize: 10,
                          fontWeight: fWBold,
                        ),
                      ),
                      Text(
                        "Alamat",
                        style: fontPoppins.copyWith(
                          color: textGreyColor,
                          fontSize: 10,
                          fontWeight: fWBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        armada,
                        style: fontPoppins.copyWith(
                          color: fiveColor,
                          fontSize: 10,
                          fontWeight: fWBold,
                        ),
                      ),
                      Text(
                        "24234234324",
                        style: fontPoppins.copyWith(
                          color: fiveColor,
                          fontSize: 10,
                          fontWeight: fWBold,
                        ),
                      ),
                      Text(
                        """
Maulana Khairuman
623324234234
Reyan, Gerung""",
                        style: fontPoppins.copyWith(
                          color: fiveColor,
                          fontSize: 10,
                          fontWeight: fWBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRincianPembayaranSection() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      height: 150,
      color: backgroundImageTransactionsColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rincian Pembayaran",
            style: fontPoppins.copyWith(
              color: fiveColor,
              fontSize: 11,
              fontWeight: fWBold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Metode Pembayaran",
                        style: fontPoppins.copyWith(
                          color: fiveColor,
                          fontSize: 10,
                          fontWeight: fWBold,
                        ),
                      ),
                      Text(
                        "Total Harga",
                        style: fontPoppins.copyWith(
                          color: textGreyColor,
                          fontSize: 10,
                          fontWeight: fWBold,
                        ),
                      ),
                      Text(
                        "Total Biaya Pengiriman",
                        style: fontPoppins.copyWith(
                          color: textGreyColor,
                          fontSize: 10,
                          fontWeight: fWBold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Total Belanja",
                        style: fontPoppins.copyWith(
                          color: textGreyColor,
                          fontSize: 10,
                          fontWeight: fWBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        paymend,
                        style: fontPoppins.copyWith(
                          color: textGreyColor,
                          fontSize: 10,
                          fontWeight: fWBold,
                        ),
                      ),
                      Text(
                        "Rp.$priceProduct",
                        style: fontPoppins.copyWith(
                          color: fiveColor,
                          fontSize: 10,
                          fontWeight: fWBold,
                        ),
                      ),
                      Text(
                        "Rp$serviceFEE",
                        style: fontPoppins.copyWith(
                          color: fiveColor,
                          fontSize: 10,
                          fontWeight: fWBold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Rp$totalBill",
                        style: fontPoppins.copyWith(
                          color: textGreyColor,
                          fontSize: 10,
                          fontWeight: fWBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
