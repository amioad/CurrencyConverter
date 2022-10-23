import 'package:currency_converter/controllers/currencyController.dart';
import 'package:get/get.dart';

class CurrencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CurrencyController());
  }
}
