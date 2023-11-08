import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({Key? key}) : super(key: key);

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      CurrencyConverterCupertinoPageState();
}

class CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  final TextEditingController textEditingController = TextEditingController();
  double res = 0;

  @override
  Widget build(BuildContext context) {
    print("rebuilt");

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Currency           Converter",
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "₹ ${res != 0 ? res.toStringAsFixed(3) : res.toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.activeBlue,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.white,
                  fontStyle: FontStyle.italic,
                ),
                keyboardType: TextInputType.number,
                placeholder: "Enter the amount in USD",
                placeholderStyle: const TextStyle(color: CupertinoColors.inactiveGray),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoColors.activeBlue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(40),
                  color: CupertinoColors.darkBackgroundGray,
                ),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                padding: const EdgeInsets.all(15),
                onPressed: () {
                  res = double.parse(textEditingController.text) * 81;
                  setState(() {});
                },
                color: CupertinoColors.activeBlue,
                borderRadius: BorderRadius.circular(40),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      CupertinoIcons.money_dollar,
                      color: CupertinoColors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Convert",
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
