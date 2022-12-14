import 'package:currency_converter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:currency_converter/utils/constants.dart' as constants;

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: constants.mainAppTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'homeScreen',
      getPages: Routes.routes,
    );
  }
}
