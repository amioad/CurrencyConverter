import 'dart:convert';

CurrencyModel currencyModelFromJson(String str) =>
    CurrencyModel.fromJson(json.decode(str));

class CurrencyModel {
  Map<String, dynamic>? conversionRates;

  CurrencyModel({
    this.conversionRates,
  });
  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      conversionRates: Map.from(json["conversion_rates"])
          .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    );
  }

  Map<String, dynamic> toJson() => {
        "conversion_rates": Map.from(conversionRates!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
