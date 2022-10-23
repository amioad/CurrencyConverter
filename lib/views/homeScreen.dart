import 'package:currency_converter/controllers/currencyController.dart';
import 'package:currency_converter/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final curencyController = Get.find<CurrencyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(
                  (() {
                    if (curencyController.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 70),
                            child: TextField(
                              cursorColor: Colors.blueGrey,
                              cursorHeight: 30,
                              controller: curencyController.amountController,
                              decoration: const InputDecoration(
                                hintText: "Enter Your Amount..",
                                hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                icon: Icon(
                                    size: 40,
                                    color: Colors.blueGrey,
                                    Icons.currency_exchange),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CurrencyDropdownButton(
                            currency: curencyController.currencyList[0],
                            fromValue: curencyController.dropdownValue1.value,
                            toValue: curencyController.dropdownValue2.value,
                            fromCallback: (String? value) {
                              curencyController.dropdownValue1.value = value!;
                            },
                            toCallback: (String? value) {
                              curencyController.dropdownValue2.value = value!;
                            },
                          ),
                          const SizedBox(height: 25),
                          InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.blueGrey,
                              ),
                              child: const Text(
                                "Convert",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            onTap: () {
                              curencyController.currecnyConvert(
                                  curencyController
                                      .currencyList[0].conversionRates!,
                                  curencyController.amountController.text,
                                  curencyController.dropdownValue1.value,
                                  curencyController.dropdownValue2.value);
                            },
                          ),
                          const SizedBox(height: 25),
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  offset: Offset(0, 0),
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Text(
                              curencyController.answer.value,
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
