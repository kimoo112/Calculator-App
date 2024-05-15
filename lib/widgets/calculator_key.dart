import 'package:flutter/material.dart';

class CalculatorKey extends StatelessWidget {
  CalculatorKey(
      {required this.text,
      required this.textColor,
      required this.backgroundColor,
      required this.width,
      required this.height,
      required this.printedText,
      required this.onValueChanged,
      super.key});

  final String text;
  final Color textColor;
  final Color backgroundColor;
  double width;
  double height;
  final String printedText;
  final ValueChanged<String> onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width - 20,
        height: height - 20,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            String newText = (printedText + text);
            onValueChanged(newText);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 44,
              ),
            ),
          ),
        ));
  }
}
