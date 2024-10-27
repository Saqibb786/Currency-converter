import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  final TextEditingController textEditingController = TextEditingController();

  String selectedCurrency = "PKR";
  double result = 0;

  void convert() {
    if (kDebugMode) {
      setState(() {
        if (selectedCurrency == 'PKR') {
          result = double.parse(textEditingController.text) * 278.75;
        } else if (selectedCurrency == 'INR') {
          result = double.parse(textEditingController.text) * 83.95;
        } else if (selectedCurrency == 'EUR') {
          result = double.parse(textEditingController.text) * 0.92;
        } else if (selectedCurrency == 'AUD') {
          result = double.parse(textEditingController.text) * 1.52;
        }
      });
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(5),
    );

    return Scaffold(
      backgroundColor: Colors.lime,
      appBar: AppBar(
        backgroundColor: Colors.lime,
        elevation: 0,
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$selectedCurrency ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                    style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  Container(
                    width: 80,
                    padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: DropdownButton<String>(
                      value: selectedCurrency,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                      underline:
                          const SizedBox(), // Removes the default underline
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCurrency = newValue!;
                        });
                      },
                      items: <String>[
                        'PKR',
                        'INR',
                        'EUR',
                        'AUD',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(4),
                child: TextField(
                  controller: textEditingController,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter amount is USD',
                    hintStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(Icons.monetization_on_outlined),
                    prefixIconColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: (convert),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text("Convert"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
