import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/mediaQuery_set%202.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    super.key,
    this.icon,
    required this.title,
    required this.bg,
    this.textStyle,
    required this.onPressed,
  });
  final Widget? icon;
  final String title;
  final Color bg;
  final TextStyle? textStyle;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(double.infinity, 70),
        backgroundColor: bg,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? const SizedBox(),
          const SizedBox(width: 8),
          Text(
            title,
            style: textStyle ??
                TextStyle(
                  fontSize: setFontSize(context, 0.03),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
