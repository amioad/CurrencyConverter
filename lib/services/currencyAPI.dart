import 'package:currency_converter/models/currencyModel.dart';
import 'package:currency_converter/services/databaseService.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;

class CurrencyAPI extends GetConnect {
  static var client = http.Client();

  static Future<List<CurrencyModel>?> fetchCurrencyData() async {
    var data = DBProvider.db.getAllCurrencies();
    return data;
  }

  static Future<CurrencyModel> insertCurrencyData() async {
    var response = await http.get(
      Uri.parse(
          "https://v6.exchangerate-api.com/v6/bd6c2336a196bf9dd8aaad55/latest/USD"),
    );
    final result = currencyModelFromJson(response.body);
    return result;
  }

  static String currecnyConvert(Map<String, dynamic> exchangeRates,
      String amount, String currencybase, String currencyfinal) {
    String output = (double.parse(amount) /
            exchangeRates[currencybase] *
            exchangeRates[currencyfinal])
        .toStringAsFixed(2)
        .toString();

    return output;
  }
}
