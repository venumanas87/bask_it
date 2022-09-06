import 'package:bask_it/pages/main_page.dart';
import 'package:bask_it/provider/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
        )
    );

    return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => ShopProvider()),
            ],
            child: GetMaterialApp(home: const MainPage())

      );
  }
}
