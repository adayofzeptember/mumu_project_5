import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class SectionCount extends StatelessWidget {
  const SectionCount({
    super.key,
    required this.countText,
    required this.onAdd,
    required this.onRemove,
    this.sizeButton,
    this.fontSize,
  });
  final String countText;
  final Function()? onRemove, onAdd;
  final double? sizeButton, fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: countText == "0" ? Color(0xFFB6C3CD) : Palette.mainRed,
          ),
          padding: const EdgeInsets.all(8),
          child: IconButton(
            onPressed: onRemove,
            icon: const Icon(
              Icons.remove,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 0),
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
              fontSize: fontSize ?? setFontSize(context, 0.024),
            ),
            textAlign: TextAlign.center,
            controller: TextEditingController(text: countText),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Palette.mainRed,
          ),
          padding: const EdgeInsets.all(8),
          child: IconButton(
            onPressed: onAdd,
            icon: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
