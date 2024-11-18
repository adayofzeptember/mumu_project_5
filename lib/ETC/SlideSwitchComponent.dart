import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:sliding_switch/sliding_switch.dart';

class SlideSwitchComponent extends StatelessWidget {
  const SlideSwitchComponent({
    super.key,
    required this.value,
    required this.onSwipe,
    required this.textOff,
    required this.textOn,
    this.width,
  });

  final bool value;
  final Function onSwipe;
  final String textOff, textOn;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SlidingSwitch(
      value: value,
      onChanged: (bool value) {},
      width: width ?? setWidth(context, 0.44),
      height: setHeight(context, 0.06),
      animationDuration: const Duration(milliseconds: 400),
      onTap: () {},
      onDoubleTap: () {},
      onSwipe: onSwipe,
      textOff: textOff,
      textOn: textOn,
      contentSize: setFontSize(context, 0.03),
      colorOff: const Color(0xFF52C41A),
      colorOn: const Color(0xFFFF4D4F),
      background: const Color(0xffdedede),
      buttonColor: const Color(0xfff7f5f7),
      inactiveColor: const Color(0xff4A5E6D),
    );
  }
}
