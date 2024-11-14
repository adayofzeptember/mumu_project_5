// ignore_for_file: must_be_immutable
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

import '../../../ETC/Components/customBox_component.dart';


var _deviceNo = TextEditingController();
var _grade = TextEditingController();
var _reason = TextEditingController();
var _weight = TextEditingController();

class Transform_Page2 extends StatefulWidget {
  Transform_Page2({super.key});

  @override
  State<Transform_Page2> createState() => _Transform_Page2State();
}

class _Transform_Page2State extends State<Transform_Page2> {
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
                              Expanded(
                                child: Text(
                                  'บันทึกการแปรสภาพสินค้า',
                                  style: TextStyle(
                                      color: Palette.mainRed,
                                      fontSize: setFontSize(context, 0.035),
                                      fontWeight: FontWeight.bold),
                                ),
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
                                  'วันเวลาที่บันทึก',
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
                                  'เลขที่การเบิก',
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
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      onPressed: () {},
                                    ),
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
                              ),
                            ],
                          ),
                          SizedBox(height: setHeight(context, 0.02)),
                          Text(
                            'ชื่อสินค้า',
                            style: TextStyle(
                                fontSize: setFontSize(context, 0.030),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: setHeight(context, 0.01),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
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
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
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
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: setHeight(context, 0.02)),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'น้ำหนักจริง',
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
                                  'จำนวนถุง',
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
                              ),
                            ],
                          ),
                          SizedBox(
                            height: setHeight(context, 0.02),
                          ),
                          Text(
                            'รายการสินค้าที่แปรสภาพ',
                            style: TextStyle(
                                color: Palette.mainRed,
                                fontSize: setFontSize(context, 0.035),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: setHeight(context, 0.02),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'ชื่อสินค้าแปรสภาพ',
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
                                  'น้ำหนักรวม',
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
                                  width: double.infinity,
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
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 80,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 33, 138, 248),
                                  elevation: 0,
                                  // side: BorderSide(color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "เพิ่มข้อมูลและพิมพ์ QR Code",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: setFontSize(context, 0.04)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: setHeight(context, 0.04),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(20))

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'รายการที่เพิ่มล่าสุด',
                                    style: TextStyle(
                                        color: Palette.mainRed,
                                        fontSize: setFontSize(context, 0.030),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 16,),
                                  Row(
                                    children: [
                                      buildCustomBox('ลำดับ', '2s', context, 0.025),
                                      buildCustomBox(
                                          'ชื่อสินค้า ', '2s', context, 0.025),
                                      buildCustomBox(
                                          'น้ำหนักที่ชั่ง', '2s', context, 0.025),
                                      buildCustomBox(
                                          'น้ำหนักรวม', '2s', context, 0.025),
                                    ],
                                  ),
                                  SizedBox(
                                    height: setHeight(context, 0.02),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color.fromARGB(255, 237, 167, 81),
                                        elevation: 0,
                                        // side: BorderSide(color: Colors.white),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
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
                                ],
                              ),
                            ),
                          ),
                        ]),
                  )),
            )));
  }
}
