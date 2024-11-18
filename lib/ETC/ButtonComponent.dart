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
    this.side,
    this.borderRadius,
  });
  final Widget? icon;
  final String title;
  final Color bg;
  final TextStyle? textStyle;
  final Function()? onPressed;
  final BorderSide? side;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          side: side ?? BorderSide.none,
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

class CancelButtonComponent extends StatelessWidget {
  const CancelButtonComponent({
    super.key,
    required this.onPressed,
  });
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(double.infinity, 70),
        backgroundColor: const Color(0xFFF7F5F5),
        side: const BorderSide(
          width: 2.0,
          color: Color(0xFF757575),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.close,
            size: 35,
            color: Color(0xFF757575),
          ),
          const SizedBox(width: 8),
          Text(
            "ยกเลิก",
            style: TextStyle(
              fontSize: setFontSize(context, 0.03),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF757575),
            ),
          ),
        ],
      ),
    );
  }
}
