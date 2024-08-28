import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/view/page/cart/cart_page.dart';
import 'package:uas_market_balance_flutter/view/page/history/detail_transactions.dart';
import 'package:uas_market_balance_flutter/widgets/search_form.dart';
import '../../../utils/theme/materials_colors.dart';
import '../../../widgets/card_item_transactions.dart';
import '../../../controllers/getx/history_controller.dart';

class HistoryTransactionPage extends StatelessWidget {
  const HistoryTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryController historyController = Get.find();
    final List<Map<String, dynamic>> transactions =
        historyController.historyItems.toList();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: SearchWidget(
                            onchanged: (value) {},
                            hintText: "Cari transaksi",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CircleAvatar(
                            backgroundColor: fiveColor,
                            child: IconButton(
                              onPressed: () {
                                print(transactions);
                              },
                              icon: const Icon(
                                Icons.notifications,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: fiveColor,
                          child: IconButton(
                            onPressed: () => Get.to(() => const CartPage()),
                            icon: const Icon(
                              Icons.shopping_cart_rounded,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    final List<dynamic> items = transaction['items'];

                    return Column(
                      children: [
                        if (items.isNotEmpty)
                          ProductItemTransactions(
                            historyDate: transaction["date"].toString(),
                            titleProduct: items[0]["title"],
                            statusTransactions:
                                transaction["status"], // Status dari data
                            storeName: items[0]["store"],
                            deskProduct: items[0]["subtitle"],
                            priceProduct: items[0]["price"].toString(),
                            ontap: () => Get.to(() => DetailsTransactionsPage(
                                  historyDate: transaction["date"].toString(),
                                  titleProduct: items[0]["title"],
                                  statusTransactions: transaction["status"],
                                  storeName: items[0]["store"],
                                  deskProduct: items[0]["subtitle"],
                                  priceProduct: items[0]["price"].toString(),
                                  paymentMethod: transaction[
                                      "paymentMethod"], // Tambahkan parameter ini
                                  serviceFEE: transaction["serviceFEE"]
                                      .toString(), // Tambahkan parameter ini
                                  totalBill:
                                      transaction["totalBill"].toString(),
                                  armada: transaction['Armada'],
                                  paymend: transaction[
                                      'Paymend'], // Tambahkan parameter ini
                                )),
                          ),
                        const SizedBox(height: 20),
                        Text(
                          "Total Pembayaran: Rp. ${transaction["totalBill"].toString()}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
