import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../app.dart';
import '../../../../../utils/theme/materials_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MarketBalance());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: blackColor,
      systemNavigationBarColor: blackColor,
    ),
  );
}
