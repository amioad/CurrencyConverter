import 'package:currency_converter/models/currencyModel.dart';
import 'package:currency_converter/services/currencyAPI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyController extends GetxController {
  var isLoading = true.obs;
  var currencyList = <CurrencyModel>[].obs;
  final amountController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  var dropdownValue1 = 'USD'.obs;
  var dropdownValue2 = 'EUR'.obs;
  var answer = ''.obs;

  @override
  void onInit() {
    fetchCurrencyData();
    super.onInit();
  }

  void fetchCurrencyData() async {
    try {
      isLoading(true);
      var currency = await CurrencyAPI.insertCurrencyData();
      if (currency != null) {
        currencyList.add(currency);
      }
    } finally {
      isLoading(false);
    }
  }

  void currecnyConvert(Map<String, dynamic> exchangeRates, String amount,
      String currencybase, String currencyfinal) async {
    try {
      answer.value = CurrencyAPI.currecnyConvert(
          exchangeRates, amount, currencybase, currencyfinal);
    } finally {}
  }
}
