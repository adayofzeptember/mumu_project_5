import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class TextFormFieldComponent extends StatelessWidget {
  const TextFormFieldComponent({
    super.key,
    required this.controllerString,
    this.keyboardType,
    this.valueSize,
    this.textAlign,
  });

  final String? controllerString;
  final TextInputType? keyboardType;
  final double? valueSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
        ),
      ),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: valueSize ?? setFontSize(context, 0.024),
      ),
      textAlign: textAlign ?? TextAlign.left,
      controller: TextEditingController(text: controllerString),
      keyboardType: TextInputType.text,
    );
  }
}
