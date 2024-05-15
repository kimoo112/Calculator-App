import 'package:flutter/material.dart';
import 'package:calculator/widgets/calculator_key.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  String printedText = "0";
  double? firstNumber;
  double? secondNumber;
  String? operator;

  bool isFloat(String str) {
    return str.contains(".");
  }

  double strToDouble(String str) {
    return double.parse(str);
  }

  int strToInt(String str) {
    return int.parse(str);
  }

  double calculate(double firstNumber, double secondNumber, String operator) {
    if (operator == "+") {
      return firstNumber + secondNumber;
    } else if (operator == "-") {
      return firstNumber - secondNumber;
    } else if (operator == "x") {
      return firstNumber * secondNumber;
    } else if (operator == "/") {
      return firstNumber / secondNumber;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: Text(
                printedText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                ),
              ),
            ),
            Row(children: <Widget>[
              CalculatorKey(
                text: "C",
                textColor: Colors.black,
                backgroundColor: Colors.grey,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    printedText = "0";
                    firstNumber = null;
                    secondNumber = null;
                    operator = null;
                  });
                },
              ),
              CalculatorKey(
                text: "±",
                textColor: Colors.black,
                backgroundColor: Colors.grey,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (isFloat(newText)) {
                      printedText =
                          (strToDouble(printedText) * (-1)).toStringAsFixed(5);
                    } else {
                      printedText = (strToInt(printedText) * (-1)).toString();
                    }
                  });
                },
              ),
              CalculatorKey(
                text: "%",
                textColor: Colors.black,
                backgroundColor: Colors.grey,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    firstNumber = strToDouble(printedText) / 100;
                    secondNumber = null;
                    printedText = firstNumber!.toStringAsFixed(5);
                  });
                },
              ),
              CalculatorKey(
                text: "/",
                textColor: Colors.white,
                backgroundColor: Colors.orange,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (firstNumber == null) {
                      firstNumber = strToDouble(printedText);
                      operator = "/";
                      printedText = "0";
                    } else if (operator == null) {
                      operator = "/";
                      printedText = "0";
                    } else if (secondNumber == null) {
                      secondNumber = strToDouble(printedText);
                      firstNumber =
                          calculate(firstNumber!, secondNumber!, operator!);
                      printedText = firstNumber!.toStringAsFixed(5);
                      secondNumber = null;
                      operator = null;
                    }
                  });
                },
              ),
            ]),
            Row(children: <Widget>[
              CalculatorKey(
                text: "7",
                textColor: Colors.white,
                backgroundColor: Colors.grey.shade800,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (isFloat(newText)) {
                      printedText = strToDouble(newText).toStringAsFixed(5);
                    } else {
                      printedText = strToInt(newText).toString();
                    }
                  });
                },
              ),
              CalculatorKey(
                text: "8",
                textColor: Colors.white,
                backgroundColor: Colors.grey.shade800,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (isFloat(newText)) {
                      printedText = strToDouble(newText).toStringAsFixed(5);
                    } else {
                      printedText = strToInt(newText).toString();
                    }
                  });
                },
              ),
              CalculatorKey(
                text: "9",
                textColor: Colors.white,
                backgroundColor: Colors.grey.shade800,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (isFloat(newText)) {
                      printedText = strToDouble(newText).toStringAsFixed(5);
                    } else {
                      printedText = strToInt(newText).toString();
                    }
                  });
                },
              ),
              CalculatorKey(
                text: "x",
                textColor: Colors.white,
                backgroundColor: Colors.orange,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (firstNumber == null) {
                      firstNumber = strToDouble(printedText);
                      operator = "x";
                      printedText = "0";
                    } else if (operator == null) {
                      operator = "x";
                      printedText = "0";
                    } else if (secondNumber == null) {
                      secondNumber = strToDouble(printedText);
                      firstNumber =
                          calculate(firstNumber!, secondNumber!, operator!);
                      printedText = firstNumber!.toStringAsFixed(5);
                      secondNumber = null;
                      operator = null;
                    }
                  });
                },
              ),
            ]),
            Row(children: <Widget>[
              CalculatorKey(
                text: "4",
                textColor: Colors.white,
                backgroundColor: Colors.grey.shade800,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (isFloat(newText)) {
                      printedText = strToDouble(newText).toStringAsFixed(5);
                      ;
                    } else {
                      printedText = strToInt(newText).toString();
                    }
                  });
                },
              ),
              CalculatorKey(
                text: "5",
                textColor: Colors.white,
                backgroundColor: Colors.grey.shade800,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (isFloat(newText)) {
                      printedText = strToDouble(newText).toStringAsFixed(5);
                    } else {
                      printedText = strToInt(newText).toString();
                    }
                  });
                },
              ),
              CalculatorKey(
                text: "6",
                textColor: Colors.white,
                backgroundColor: Colors.grey.shade800,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (isFloat(newText)) {
                      printedText = strToDouble(newText).toStringAsFixed(5);
                    } else {
                      printedText = strToInt(newText).toString();
                    }
                  });
                },
              ),
              CalculatorKey(
                text: "-",
                textColor: Colors.white,
                backgroundColor: Colors.orange,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (firstNumber == null) {
                      firstNumber = strToDouble(printedText);
                      operator = "-";
                      printedText = "0";
                    } else if (operator == null) {
                      operator = "-";
                      printedText = "0";
                    } else if (secondNumber == null) {
                      secondNumber = strToDouble(printedText);
                      firstNumber =
                          calculate(firstNumber!, secondNumber!, operator!);
                      printedText = firstNumber!.toStringAsFixed(5);
                      secondNumber = null;
                      operator = null;
                    }
                  });
                },
              ),
            ]),
            Row(children: <Widget>[
              CalculatorKey(
                text: "1",
                textColor: Colors.white,
                backgroundColor: Colors.grey.shade800,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (isFloat(newText)) {
                      printedText = strToDouble(newText).toStringAsFixed(5);
                    } else {
                      printedText = strToInt(newText).toString();
                    }
                  });
                },
              ),
              CalculatorKey(
                text: "2",
                textColor: Colors.white,
                backgroundColor: Colors.grey.shade800,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (isFloat(newText)) {
                      printedText = strToDouble(newText).toStringAsFixed(5);
                    } else {
                      printedText = strToInt(newText).toString();
                    }
                  });
                },
              ),
              CalculatorKey(
                text: "3",
                textColor: Colors.white,
                backgroundColor: Colors.grey.shade800,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (isFloat(newText)) {
                      printedText = strToDouble(newText).toStringAsFixed(5);
                    } else {
                      printedText = strToInt(newText).toString();
                    }
                  });
                },
              ),
              CalculatorKey(
                text: "+",
                textColor: Colors.white,
                backgroundColor: Colors.orange,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (firstNumber == null) {
                      firstNumber = strToDouble(printedText);
                      operator = "+";
                      printedText = "0";
                    } else if (operator == null) {
                      operator = "+";
                      printedText = "0";
                    } else if (secondNumber == null) {
                      secondNumber = strToDouble(printedText);
                      firstNumber =
                          calculate(firstNumber!, secondNumber!, operator!);
                      printedText = firstNumber.toString();
                      secondNumber = null;
                      operator = null;
                    }
                  });
                },
              ),
            ]),
            Row(children: <Widget>[
              CalculatorKey(
                text: "0",
                textColor: Colors.white,
                backgroundColor: Colors.grey.shade800,
                width: (MediaQuery.of(context).size.width / 4) * 2,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (isFloat(newText)) {
                      printedText = newText;
                    } else {
                      printedText = strToInt(newText).toString();
                    }
                  });
                },
              ),
              CalculatorKey(
                text: ".",
                textColor: Colors.white,
                backgroundColor: Colors.grey.shade800,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (!printedText.contains(".")) {
                      printedText = newText;
                    }
                  });
                },
              ),
              CalculatorKey(
                text: "=",
                textColor: Colors.white,
                backgroundColor: Colors.orange,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                printedText: printedText,
                onValueChanged: (String newText) {
                  setState(() {
                    if (firstNumber != null && operator != null) {
                      secondNumber = strToDouble(printedText);
                      firstNumber =
                          calculate(firstNumber!, secondNumber!, operator!);
                      printedText = firstNumber!.toStringAsFixed(5);
                      ;
                      secondNumber = null;
                      operator = null;
                    }
                  });
                },
              ),
            ]),
          ],
        ));
  }
}
