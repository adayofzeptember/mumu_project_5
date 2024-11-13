import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/ButtonComponent.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set%202.dart';

Future<Map<String, dynamic>> showColorCart(BuildContext context, Map<String, dynamic>? colorSizeCart) async {
  List<String> mockDataName = [
    "สีแดง",
    "สีเขียว",
    "สีน้ำเงิน",
    "สีเหลือง",
    "สีเหลือง",
    "สีเหลือง",
    "สีเหลือง",
    "สีเหลือง",
    "สีเหลือง",
  ];
  List<Color> mockDataColor = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];
  List<String> mockDataSize = [
    "S",
    "M",
    "L",
    "XL",
  ];

  String? selectedSize = colorSizeCart?["size"], selectedName = colorSizeCart?["name"];
  Color? selectedColor = colorSizeCart?["color"];
  ScrollController _controller = ScrollController();
  ScrollController _controllerSize = ScrollController();

  Map<String, dynamic> result = await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: setHeight(context, 0.6),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'สี/ขนาดตะกร้า',
                    style: TextStyle(fontSize: setFontSize(context, 0.035), fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'สีตะกร้า',
                    style: TextStyle(fontSize: setFontSize(context, 0.03), fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20.0),
                Scrollbar(
                  controller: _controller,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 30),
                        for (int i = 0; i < mockDataColor.length; i++)
                          GestureDetector(
                            onTap: () async {
                              selectedColor = mockDataColor[i];
                              selectedName = mockDataName[i];
                              setState(() {});
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 30.0),
                                  width: setWidth(context, 0.15),
                                  height: setWidth(context, 0.15),
                                  decoration: BoxDecoration(
                                    color: mockDataColor[i],
                                    borderRadius: BorderRadius.circular(90.0),
                                    border: selectedColor == mockDataColor[i] ? Border.all(color: Palette.mainRed, width: 5.0) : null,
                                  ),
                                ),
                                const SizedBox(height: 18.0),
                                Text(
                                  mockDataName[i],
                                  style: TextStyle(
                                    fontSize: setFontSize(context, 0.03),
                                    fontWeight: FontWeight.bold,
                                    color: selectedColor == mockDataColor[i] ? Palette.mainRed : Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 18.0),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'ขนาดตะกร้า',
                    style: TextStyle(fontSize: setFontSize(context, 0.03), fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20.0),
                Scrollbar(
                  controller: _controllerSize,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: _controllerSize,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(width: 30),
                        for (int i = 0; i < mockDataSize.length; i++)
                          GestureDetector(
                            onTap: () {
                              selectedSize = mockDataSize[i];
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 30.0, bottom: 30.0),
                              alignment: Alignment.center,
                              width: setWidth(context, 0.15),
                              height: setWidth(context, 0.15),
                              padding: const EdgeInsets.all(30.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(18.0),
                                color: selectedSize == mockDataSize[i] ? Colors.black : Colors.white,
                              ),
                              child: Text(
                                mockDataSize[i],
                                style: TextStyle(
                                  fontSize: setFontSize(context, 0.03),
                                  fontWeight: FontWeight.bold,
                                  color: selectedSize == mockDataSize[i] ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ButtonComponent(
                    title: "ยืนยัน",
                    bg: const Color(0xFF52C41A),
                    onPressed: () {
                      Navigator.pop(context, {
                        "color": selectedColor,
                        "size": selectedSize,
                        "name": selectedName,
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );

  return result;
}
