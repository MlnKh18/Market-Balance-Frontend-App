import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_market_balance_flutter/view/page/history/history.dart';
import 'package:uas_market_balance_flutter/view/page/favorite/favorite_page.dart';
import 'package:uas_market_balance_flutter/view/page/home/home_page.dart';
import 'package:uas_market_balance_flutter/view/page/profile/profile_page.dart';

class MainScreenNavController extends GetxController {
  final currentIndex = 0.obs;
  final List<Widget> screens = [
    HomePage(),
    const HistoryTransactionPage(),
    const FavoritePage(),
    ProfilePage(),
  ].obs;
  final List<IconData> icons = [
    Icons.home,
    Icons.history_edu,
    Icons.favorite,
    Icons.person,
  ].obs;
}
