import 'package:currency_converter/binding/currencyBinding.dart';
import 'package:currency_converter/views/homeScreen.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(
      name: '/homeScreen',
      page: () => HomeScreen(),
      binding: CurrencyBinding(),
    ),
  ];
}
