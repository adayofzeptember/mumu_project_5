// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/bloc/Slaughter/Import/import_bloc.dart';
import 'package:sliding_switch/sliding_switch.dart';

var _deviceNo = TextEditingController();
var _grade = TextEditingController();
var _reason = TextEditingController();
var _weight = TextEditingController();

class Import_Page2 extends StatefulWidget {
  Import_Page2({super.key});

  @override
  State<Import_Page2> createState() => _Import_Page2State();
}

class _Import_Page2State extends State<Import_Page2> {
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
                                'ชั่งน้ำหนักสุกร',
                                style: TextStyle(
                                    color: Palette.mainRed,
                                    fontSize: setFontSize(context, 0.035),
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Lot No.',
                                    style: TextStyle(
                                        fontSize: setFontSize(context, 0.035),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors
                                              .grey.shade400, // Border color
                                          width: 2.0, // Border width
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        'Auto',
                                        style: TextStyle(
                                          fontSize: setFontSize(context, 0.025),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: setHeight(context, 0.035),
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
                                  'เกรดสุกร',
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
                                  'ลักษณะสุกร',
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
                                  'การชั่ง',
                                  style: TextStyle(
                                      fontSize: setFontSize(context, 0.030),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: setHeight(context, 0.01)),
                          Row(
                            children: [
                              Expanded(
                                child: SlidingSwitch(
                                  value: false,
                                  onChanged: (bool value) {
                                    if (value == true) {
                                      print('ปกติ');
                                      setState(() {
                                        value1 = 'normal';
                                      });
                                    } else {
                                      setState(() {
                                        value1 = 'ning_finger';
                                      });
                                      print('9 นิ้ว');
                                    }
                                  },
                                  width: setWidth(context, 0.44),
                                  height: setHeight(context, 0.06),
                                  animationDuration:
                                      const Duration(milliseconds: 400),
                                  onTap: () {},
                                  onDoubleTap: () {},
                                  onSwipe: () {},
                                  textOff: "9 นิ้ว",
                                  textOn: "ปกติ",
                                  contentSize: setFontSize(context, 0.03),
                                  colorOn: Palette.mainRed,
                                  colorOff: Palette.mainRed,
                                  background: const Color(0xffe4e5eb),
                                  buttonColor: const Color(0xfff7f5f7),
                                  inactiveColor: const Color(0xff636f7b),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: SlidingSwitch(
                                  value: false,
                                  onChanged: (bool value3) {
                                    if (value3 == true) {
                                      print('ประมาณ');
                                      setState(() {
                                        value2 = 'estimate';
                                      });
                                    } else {
                                      setState(() {
                                        value2 = 'really';
                                      });
                                      print('ชั่งจริง');
                                    }
                                  },
                                  width: setWidth(context, 0.44),
                                  height: setHeight(context, 0.06),
                                  animationDuration:
                                      const Duration(milliseconds: 400),
                                  onTap: () {},
                                  onDoubleTap: () {},
                                  onSwipe: () {},
                                  textOff: "ชั่งจริง",
                                  textOn: "ประมาณ",
                                  contentSize: setFontSize(context, 0.03),
                                  colorOn: Palette.mainRed,
                                  colorOff: Palette.mainRed,
                                  background: const Color(0xffe4e5eb),
                                  buttonColor: const Color(0xfff7f5f7),
                                  inactiveColor: const Color(0xff636f7b),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: setHeight(context, 0.02),
                          ),
                          Text(
                            'สาเหตุการประมาณน้ำหนัก',
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
                                  // value: (value_reason == null)
                                  //     ? 'sdfsdf'
                                  //     : 'sdfsdfsdf',
                                  alignment: AlignmentDirectional.center,
                                  hint: Text('เลือกสาเหตุ'),
                                  style: TextStyle(
                                      fontSize: setFontSize(context, 0.025),
                                      fontFamily: 'Prompt'),
                                  items: ['test']
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Palette.mainRed),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      value_reason = value.toString();
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
                          SizedBox(
                            height: setHeight(context, 0.03),
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
                              buildCustomBox('เกรดสุกร', '2s', context, 0.025),
                              buildCustomBox(
                                  'ลักษณะสุกร', '2s', context, 0.025),
                              buildCustomBox(
                                  'ประเภทชั่ง', '2s', context, 0.025),
                            ],
                          ),
                          SizedBox(
                            height: setHeight(context, 0.03),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                elevation: 0,
                                // side: BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {
                              print(_weight.text);
                              print(_grade.text);
                              print(value1 + value2);
                              print(valueNO);
                              print(value_reason);

                              context.read<ImportBloc>().add(Weight_SendUI2_3(
                                  get_master_id: '1',
                                  getWeight_type: value2.toString(),
                                  getWeight: _weight.text.toString(),
                                  getPig_abnormal: value1.toString()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  "+ เพิ่ม",
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
