import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/utils/theme/materials_colors.dart';
import 'package:uas_market_balance_flutter/view/page/store/opsi_seler.dart';
import 'package:uas_market_balance_flutter/view/page/store/product_store_user.dart';
import '../../../controllers/getx/user_store_controller.dart';
import '../../../widgets/app_bar_in_preferredsize.dart';

class UserStore extends StatelessWidget {
  UserStore({super.key});

  final UserStoreController controller = Get.put(UserStoreController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140),
          child: AppBarInPreferredSize(
            title: "My Store",
            bottom: TabBar(
              unselectedLabelColor: textGreyColor,
              indicatorColor: secondaryColor,
              dividerColor: secondaryColor,
              labelColor: secondaryColor,
              controller: controller.tabController,
              tabs: const [
                Tab(text: "Opsi Seller"),
                Tab(text: "Product"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: const [
            OpsiSellerPage(),
            ProductUserStore(),
          ],
        ),
      ),
    );
  }
}
