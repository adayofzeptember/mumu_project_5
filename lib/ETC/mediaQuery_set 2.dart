import 'package:flutter/material.dart';

double setWidth(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.width * percentage;
}

double setHeight(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.height * percentage;
}

double setFontSize(BuildContext context, double percentage) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth * percentage;
}




