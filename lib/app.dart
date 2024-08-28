import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/controllers/getx/cart_controller.dart';
import 'package:uas_market_balance_flutter/controllers/getx/checkout_controller.dart';
import 'package:uas_market_balance_flutter/controllers/getx/history_controller.dart';
import 'package:uas_market_balance_flutter/view/page/store/user_store_page.dart';
import 'package:uas_market_balance_flutter/view/page/verifyAccount/users/verify_data_user_page.dart';
import 'package:uas_market_balance_flutter/view/auth/login/signIn_page.dart';
import 'package:uas_market_balance_flutter/view/auth/register/signUp_page.dart';
import 'package:uas_market_balance_flutter/view/opening_screen.dart';
import 'package:uas_market_balance_flutter/view/page/home/home_page.dart';
import 'package:uas_market_balance_flutter/view/page/navigation/main_navbar.dart';
import 'package:uas_market_balance_flutter/view/page/verifyAccount/store/register_store/register_store.dart';
import 'package:uas_market_balance_flutter/view/splash.dart';

import 'controllers/getx/favorited_controller.dart';

Future<void> _initializeDependencies() async {
  Get.put(FavoriteController());
  Get.put(CheckOutController());
  Get.put(HistoryController());
  Get.put(CartController());
}
class MarketBalance extends StatelessWidget {
  const MarketBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeDependencies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page: () => SplashScreen()),
              GetPage(name: '/login', page: () => SignInPage()),
              GetPage(name: '/opening', page: () => const OpeningScreen()),
              GetPage(name: '/register', page: () => SignUpPage()),
              GetPage(name: '/main', page: () => MainNavBar()),
              GetPage(name: '/home', page: () => HomePage()),
              GetPage(name: '/verify_data_user', page: () => VerifyDataUserPage()),
              GetPage(
                  name: '/register_store',
                  page: () => const RegisterStorePage()),
              GetPage(name: '/user_store', page: () => UserStore())
            ],
          );
        } else {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }
      },
    );
  }
}

void main() {
  runApp(const MarketBalance());
}
