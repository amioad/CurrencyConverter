import 'package:currency_converter/models/currencyModel.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class CurrencyDropdownButton extends StatelessWidget {
  final CurrencyModel? currency;
  final String? fromValue;
  late final String? fromFlag;
  late final String? toFlag;
  final String? toValue;
  final void Function(String?)? fromCallback;
  final void Function(String?)? toCallback;
  CurrencyDropdownButton({
    super.key,
    this.currency,
    this.fromValue,
    this.toValue,
    this.fromCallback,
    this.toCallback,
  });

  @override
  Widget build(BuildContext context) {
    fromFlag = fromValue!.substring(0, 2);
    toFlag = toValue!.substring(0, 2);
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 50,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(
                      color: Colors.blueGrey,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    items: currency!.conversionRates!.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: fromValue,
                    elevation: 16,
                    icon: Flag.fromString(fromFlag!, height: 12, width: 16),
                    iconSize: 24,
                    onChanged: fromCallback,
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 50,
                  width: 340,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 1,
                      )),
                  child: DropdownButton<String>(
                    items: currency!.conversionRates!.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: toValue,
                    elevation: 16,
                    icon: Flag.fromString(toFlag!, height: 12, width: 16),
                    iconSize: 24,
                    onChanged: toCallback,
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
