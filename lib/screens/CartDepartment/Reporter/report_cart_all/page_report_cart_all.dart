import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class PageReportCartAll extends StatelessWidget {
  const PageReportCartAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: setHeight(context, 0.15),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [
                    Palette.blue,
                    Color(0xFF0065C3),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ตะกร้าทั้งหมด (ใบ)",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: setFontSize(context, 0.03),
                        ),
                      ),
                      Text(
                        "10,000",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: setFontSize(context, 0.07),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/basket-shopping.png",
                    fit: BoxFit.fitHeight,
                    height: setHeight(context, 0.1),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReportMiniCart(
                  gradientColors: [
                    Color(0xFF52C41A),
                    Color(0xFF3A8A12),
                  ],
                  label: "ว่าง/พร้อมใช้งาน (ใบ)",
                  value: "5,000",
                  iconImage: "assets/images/cart-flatbed-empty.png",
                ),
                ReportMiniCart(
                  gradientColors: [
                    Color(0xFFF1B44C),
                    Color(0xFFCC8610),
                  ],
                  label: "กำลังใช้งาน (ใบ)",
                  value: "4,550",
                  iconImage: "assets/images/cart-flatbed-boxes.png",
                ),
                ReportMiniCart(
                  gradientColors: [
                    Color(0xFFFF4D4F),
                    Color(0xFFC80D0F),
                  ],
                  label: "แตก (ใบ)",
                  value: "50",
                  iconImage: "assets/images/square-fragile.png",
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "ตะกร้าที่ใช้ภายใน",
              style: TextStyle(
                fontSize: setFontSize(context, 0.035),
                color: Palette.greyText,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            CartListReport(
              label: "แผนกตัดแต่ง",
              value: "1,000",
              valueS: "40",
              valueM: "30",
              valueL: "42",
              valueXL: "21",
            ),
            const SizedBox(height: 20),
            CartListReport(
              label: "แผนกต้มเผา",
              value: "1,000",
              valueS: "40",
              valueM: "30",
              valueL: "42",
              valueXL: "21",
            ),
            const SizedBox(height: 20),
            CartListReport(
              label: "คลังตะกร้า",
              value: "5,000",
              valueS: "40",
              valueM: "30",
              valueL: "42",
              valueXL: "21",
            ),
            const SizedBox(height: 30),
            Text(
              "ตะกร้าตามขนส่งและคลังภายนอก",
              style: TextStyle(
                fontSize: setFontSize(context, 0.035),
                color: Palette.greyText,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            CartListReport(
              label: "การขนส่งรวม",
              value: "2,000",
              valueS: "40",
              valueM: "30",
              valueL: "42",
              valueXL: "21",
            ),
            const SizedBox(height: 20),
            CartListReport(
              label: "คลังภายนอก",
              value: "1,000",
              valueS: "40",
              valueM: "30",
              valueL: "42",
              valueXL: "21",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CartListReport extends StatelessWidget {
  const CartListReport({
    super.key,
    required this.label,
    required this.value,
    required this.valueS,
    required this.valueM,
    required this.valueL,
    required this.valueXL,
  });
  final String label, value;
  final String valueS, valueM, valueL, valueXL;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFF5F5F5),
        border: Border.all(
          color: const Color(0xFFE7EBEF),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: setFontSize(context, 0.03),
                    color: Palette.mainRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: setFontSize(context, 0.05),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          countItem(
            context,
            label: 'S',
            value: valueS,
          ),
          countItem(
            context,
            label: 'M',
            value: valueM,
          ),
          countItem(
            context,
            label: 'L',
            value: valueL,
          ),
          countItem(
            context,
            label: 'XL',
            value: valueXL,
          ),
        ],
      ),
    );
  }

  Padding countItem(BuildContext context, {required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
      child: Row(
        children: [
          Container(
            width: setWidth(context, 0.14),
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: const Color(0xFFDAE1E7),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: setFontSize(context, 0.06),
                    fontWeight: FontWeight.bold,
                    color: Palette.greyText,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: setFontSize(context, 0.04),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReportMiniCart extends StatelessWidget {
  const ReportMiniCart({
    super.key,
    required this.gradientColors,
    required this.label,
    required this.value,
    required this.iconImage,
  });
  final List<Color> gradientColors;
  final String label, value, iconImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: setWidth(context, 0.29),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: setFontSize(context, 0.026),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: setFontSize(context, 0.05),
              fontWeight: FontWeight.bold,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              iconImage,
              fit: BoxFit.fitHeight,
              height: setHeight(context, 0.05),
            ),
          )
        ],
      ),
    );
  }
}
