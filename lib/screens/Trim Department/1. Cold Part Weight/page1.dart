// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

var _deviceNo = TextEditingController();
var _grade = TextEditingController();
var _reason = TextEditingController();
var _weight = TextEditingController();

class ColdParts_Page1 extends StatefulWidget {
  ColdParts_Page1({super.key});

  @override
  State<ColdParts_Page1> createState() => _ColdParts_Page1State();
}

class _ColdParts_Page1State extends State<ColdParts_Page1> {
  final _formKeyImportpage2 = GlobalKey<FormState>();
  String value1 = '9 นิ้ว';
  String value2 = 'ชั่งจริง';
  String value_reason = '';
  String valueNO = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: RawScrollbar(
            thickness: 7,
            thumbColor: Palette.mainRed,
            radius: Radius.circular(20),
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 30, 50, 10),
                  child: Form(
                    key: _formKeyImportpage2,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ชั่งน้ำหนักซักเย็น',
                                style: TextStyle(
                                    color: Palette.mainRed,
                                    fontSize: setFontSize(context, 0.035),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: setHeight(context, 0.035),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Lot No.',
                                  style: TextStyle(
                                      fontSize: setFontSize(context, 0.030),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  'ชื่อฟาร์ม',
                                  style: TextStyle(
                                      fontSize: setFontSize(context, 0.030),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: setHeight(context, 0.01),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        // value: (valueNO == null)
                                        //     ? 'sdfsdf'
                                        //     : 'sdfsdfsdf',
                                        alignment: AlignmentDirectional.center,
                                        items: ['test no']
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Palette.mainRed),
                                                  ),
                                                ))
                                            .toList(),
                                        onChanged: (value) {
                                          print(value);
                                          setState(() {
                                            valueNO = value.toString();
                                          });
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          height: 40,
                                          width: 120,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _grade,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          8), // Rounded corners
                                      borderSide: BorderSide(
                                        color: Colors
                                            .grey.shade400, // Border color
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 14,
                                      horizontal: 12,
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: setFontSize(context, 0.025),
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: setHeight(context, 0.02)),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'ชื่อเล้า',
                                  style: TextStyle(
                                      fontSize: setFontSize(context, 0.030),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  'ประเภทซีก',
                                  style: TextStyle(
                                      fontSize: setFontSize(context, 0.030),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: setHeight(context, 0.01),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _grade,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          8), // Rounded corners
                                      borderSide: BorderSide(
                                        color: Colors
                                            .grey.shade400, // Border color
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 14,
                                      horizontal: 12,
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: setFontSize(context, 0.025),
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _grade,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          8), // Rounded corners
                                      borderSide: BorderSide(
                                        color: Colors
                                            .grey.shade400, // Border color
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 14,
                                      horizontal: 12,
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: setFontSize(context, 0.025),
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: setHeight(context, 0.02)),
                          Text(
                            'คลังที่มา',
                            style: TextStyle(
                                fontSize: setFontSize(context, 0.030),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: setHeight(context, 0.01),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          8), // Rounded corners
                                      borderSide: BorderSide(
                                        color: Colors
                                            .grey.shade400, // Border color
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                      horizontal: 12,
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: setFontSize(context, 0.025),
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: setWidth(context, 0.1),
                                child: Column(
                                  children: [
                                    Text(
                                      'โอเมก้า',
                                      style: TextStyle(
                                          fontSize: setFontSize(context, 0.02),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    CupertinoSwitch(
                                      value: true,
                                      onChanged: (value) {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: setHeight(context, 0.02),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'หมายเลขเครื่องชั่ง',
                                  style: TextStyle(
                                      fontSize: setFontSize(context, 0.030),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  'ส่วนรองพื้น (ถ้ามี)',
                                  style: TextStyle(
                                      fontSize: setFontSize(context, 0.030),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: setHeight(context, 0.01),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        alignment: AlignmentDirectional.center,
                                        items: ['test no']
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Palette.mainRed),
                                                  ),
                                                ))
                                            .toList(),
                                        onChanged: (value) {
                                          print(value);
                                          setState(() {
                                            valueNO = value.toString();
                                          });
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          height: 40,
                                          width: 120,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        alignment: AlignmentDirectional.center,
                                        items: ['test no']
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Palette.mainRed),
                                                  ),
                                                ))
                                            .toList(),
                                        onChanged: (value) {
                                          print(value);
                                          setState(() {
                                            valueNO = value.toString();
                                          });
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          height: 40,
                                          width: 120,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: setHeight(context, 0.02),
                          ),
                          Text(
                            'น้ำหนักที่ชั่ง',
                            style: TextStyle(
                                fontSize: setFontSize(context, 0.030),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: setHeight(context, 0.01),
                          ),
                          TextFormField(
                            controller: _weight,
                            textAlign: TextAlign.right,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(8), // Rounded corners
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400, // Border color
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 14,
                                horizontal: 12,
                              ),
                            ),
                            style: TextStyle(
                                fontSize: setFontSize(context, 0.04),
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: setHeight(context, 0.02),
                          ),
                          Text(
                            'รายการที่เพิ่มล่าสุด',
                            style: TextStyle(
                                color: Palette.mainRed,
                                fontSize: setFontSize(context, 0.030),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              buildCustomBox('ลำดับ', '2s', context, 0.025),
                              buildCustomBox(
                                  'น้ำหนักที่ชั่ง', '2s', context, 0.025),
                              buildCustomBox('ประเภทซีก', '2s', context, 0.025),
                              buildCustomBox('ที่มา', '2s', context, 0.025),
                            ],
                          ),
                          SizedBox(
                            height: setHeight(context, 0.02),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                elevation: 0,
                                // side: BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  "แจ้งแก้ไขรายการล่าสุด",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: setFontSize(context, 0.04)),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  )),
            )));
  }
}

Widget buildCustomBox(String label, String value, context, double fontSize) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: setFontSize(context, fontSize),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: setFontSize(context, 0.025),
                      color: Colors.blueGrey),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
