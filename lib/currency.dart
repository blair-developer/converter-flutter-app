import 'package:flutter/material.dart';

class Currency extends StatefulWidget {
  const Currency({super.key});
  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  final TextEditingController Textcontroller = TextEditingController();
   double result = 0;
   Map<String, double> exchangeRates = {
    'KES': 158,
    'UGR': 3810,
    'NGR': 1700,
    'TZM': 190,
    'SOMA': 200,
    'RUP': 250,
    'EURO': 350,
    'TZ': 300,
    'GNU': 112,
    'DRC': 150,
    'ARG':234
  };
  String selectedCurrency = 'KES'; 

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2.0,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
                borderRadius: BorderRadius.circular(60)
              );   
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Center(
          child: Text('Currency Converter App'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           DropdownButton<String>(
            value: selectedCurrency,
            items: exchangeRates.keys.map((currency) {
              return DropdownMenuItem<String>(
                value: currency,
                child: Text(currency),
              );
            }).toList(),
            onChanged: (newCurrency) {
              setState(() {
                selectedCurrency = newCurrency!;
              });
            },
          ),
               Text('$selectedCurrency ${result.toStringAsFixed(2)}', style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: TextField(
              controller: Textcontroller,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'Enter the Amoun in USD',
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                prefixIcon: const Icon(Icons.monetization_on_outlined),
                prefixIconColor: Colors.black,
                filled: true,
                fillColor: Colors.white,
                focusedBorder: border,
                enabledBorder: border
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true
              ),
            ),
          ),
          TextButton(onPressed: (){
            setState(() {
              result = double.parse(Textcontroller.text) * exchangeRates[selectedCurrency]!;
            });
          }, 
          style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(15),
            backgroundColor: MaterialStatePropertyAll(Colors.black),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
            textStyle: MaterialStatePropertyAll(TextStyle(color:Colors.white)),
            fixedSize: MaterialStatePropertyAll(Size(200, 50))
          ),
          child: Center(child: Text('Convert', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)))
        ],
      ),
    );
  }
}