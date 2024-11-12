import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/bloc/Slaughter/LSQ/lsq_bloc.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Import/page2.dart';
import 'package:sliding_switch/sliding_switch.dart';

class LSQ_Page1 extends StatefulWidget {
  LSQ_Page1({super.key});

  @override
  State<LSQ_Page1> createState() => _LSQ_Page1State();
}

class _LSQ_Page1State extends State<LSQ_Page1> {
  var _lotNo;
  var _deviceNo;
  var _farmName;
  var _coopName;
  bool _isOmega = false;
  bool _tailPart = false;

  var _b = TextEditingController();
  var _bf3 = TextEditingController();
  var _bf4 = TextEditingController();
  var _weight = TextEditingController();

  final List<String> _resultOption = ['ปกติ', 'ฉีก', 'หมอง', 'ช้ำ'];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: RawScrollbar(
            thickness: 7,
            thumbColor: Palette.mainRed,
            radius: Radius.circular(20),
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 30, 50, 10),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Lot No.',
                            style: TextStyle(fontSize: setFontSize(context, 0.030), fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'หมายเลขเครื่องชั่ง',
                            style: TextStyle(fontSize: setFontSize(context, 0.030), fontWeight: FontWeight.bold),
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
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  alignment: AlignmentDirectional.center,
                                  items: ['lot no. test']
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style:
                                                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Palette.mainRed),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _lotNo = value;
                                    });
                                  },
                                  value: _lotNo,
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
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  alignment: AlignmentDirectional.center,
                                  items: ['test no.']
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style:
                                                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Palette.mainRed),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _deviceNo = value;
                                    });
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    height: 40,
                                    width: 120,
                                  ),
                                  value: _deviceNo,
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: setHeight(context, 0.02)),
                    Text(
                      'ชื่อฟาร์ม',
                      style: TextStyle(fontSize: setFontSize(context, 0.030), fontWeight: FontWeight.bold),
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
                            alignment: AlignmentDirectional.center,
                            style: TextStyle(fontSize: setFontSize(context, 0.025), fontFamily: 'Prompt'),
                            items: ['farm name test1, farm name test2']
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Palette.mainRed),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _farmName = value;
                              });
                            },
                            value: _farmName,
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
                      height: setHeight(context, 0.02),
                    ),
                    Text(
                      'ชื่อเล้า',
                      style: TextStyle(fontSize: setFontSize(context, 0.030), fontWeight: FontWeight.bold),
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
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  alignment: AlignmentDirectional.center,
                                  style: TextStyle(fontSize: setFontSize(context, 0.025), fontFamily: 'Prompt'),
                                  items: ['coop test1']
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style:
                                                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Palette.mainRed),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _coopName = value;
                                    });
                                  },
                                  value: _coopName,
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
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: setWidth(context, 0.1),
                          child: Column(
                            children: [
                              Text(
                                'โอเมก้า',
                                style: TextStyle(fontSize: setFontSize(context, 0.02), fontWeight: FontWeight.bold),
                              ),
                              CupertinoSwitch(
                                value: _isOmega,
                                onChanged: (bool value) {
                                  setState(() {
                                    _isOmega = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: setHeight(context, 0.02),
                    ),
                    Text(
                      'ผลการตรวจสอบ',
                      style: TextStyle(fontSize: setFontSize(context, 0.030), fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: setHeight(context, 0.01),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: _resultOption.map((option) {
                                return Chip(
                                  label: Text(
                                    option,
                                  ),
                                  labelStyle: TextStyle(fontSize: 20),
                                  deleteIcon: Icon(Icons.close, size: 16),
                                  onDeleted: () {
                                    setState(() {
                                      _resultOption.remove(option);
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                hintText: 'เพิ่มผลการตรวจสอบ',
                              ),
                              onSubmitted: (value) {
                                setState(() {
                                  if (value.isNotEmpty) {
                                    _resultOption.add(value);
                                  }
                                });
                              },
                            ),
                          ],
                        )),
                    SizedBox(height: setHeight(context, 0.02)),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'ซีกหาง',
                            style: TextStyle(fontSize: setFontSize(context, 0.030), fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'ผลคำนวณ LSQ',
                                  style: TextStyle(fontSize: setFontSize(context, 0.030), fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  'เกรด LSQ',
                                  style: TextStyle(fontSize: setFontSize(context, 0.030), fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: setHeight(context, 0.01)),
                    Row(
                      children: [
                        Expanded(
                          child: SlidingSwitch(
                            value: true,
                            onChanged: (bool value) {
                              setState(() {
                                _tailPart = value;
                              });
                            },
                            width: setWidth(context, 0.44),
                            height: setHeight(context, 0.06),
                            animationDuration: const Duration(milliseconds: 400),
                            onTap: () {},
                            onDoubleTap: () {},
                            onSwipe: () {},
                            textOff: "ไม่ใช่",
                            textOn: "ใช่",
                            contentSize: setFontSize(context, 0.03),
                            colorOn: Palette.mainRed,
                            colorOff: Palette.mainRed,
                            background: const Color(0xffe4e5eb),
                            buttonColor: const Color(0xfff7f5f7),
                            inactiveColor: const Color(0xff636f7b),
                          ),
                        ),
                        SizedBox(
                          width: setWidth(context, 0.02),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade400, // Border color
                                      width: 2.0, // Border width
                                    ),
                                    borderRadius: BorderRadius.circular(12)),
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
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade400, // Border color
                                      width: 2.0, // Border width
                                    ),
                                    borderRadius: BorderRadius.circular(12)),
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
                            ),
                          ],
                        )),
                      ],
                    ),
                    SizedBox(
                      height: setHeight(context, 0.02),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'ค่า BF3',
                            style: TextStyle(fontSize: setFontSize(context, 0.035), fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'ค่า BF4',
                            style: TextStyle(fontSize: setFontSize(context, 0.035), fontWeight: FontWeight.bold),
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
                            controller: _bf3,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8), // Rounded corners
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
                              fontSize: setFontSize(context, 0.045),
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _bf4,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8), // Rounded corners
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
                              fontSize: setFontSize(context, 0.045),
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: setHeight(context, 0.02),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'ค่า b',
                            style: TextStyle(fontSize: setFontSize(context, 0.035), fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'น้ำหนักที่ชั่ง',
                            style: TextStyle(fontSize: setFontSize(context, 0.035), fontWeight: FontWeight.bold),
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
                            controller: _b,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8), // Rounded corners
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
                              fontSize: setFontSize(context, 0.045),
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _weight,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8), // Rounded corners
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
                              fontSize: setFontSize(context, 0.045),
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: setHeight(context, 0.02),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                side: BorderSide(color: Colors.blue, width: 3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            onPressed: () {
                              print(_tailPart.toString());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  "พิมพ์ QR Code",
                                  style: TextStyle(color: Colors.blue, fontSize: setFontSize(context, 0.04)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                elevation: 0,
                                // side: BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            onPressed: () {
                              print(double.parse(_b.text));
                              context.read<LsqBloc>().add(SaveLSQ_UI281(
                                    get_pig_arrival_id: _lotNo,
                                    getB: double.parse(_b.text),
                                    getBF3: double.parse(_bf3.text),
                                    getBF4: double.parse(_bf4.text),
                                    get_weight: double.parse(_weight.text),
                                    get_Result: _resultOption,
                                    get_balanceId: 1,
                                    get_tailPart: _tailPart,
                                  ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  "เพิ่มข้อมูล",
                                  style: TextStyle(color: Colors.white, fontSize: setFontSize(context, 0.04)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: setHeight(context, 0.03),
                    ),
                    Text(
                      'รายการที่เพิ่มล่าสุด',
                      style: TextStyle(color: Palette.mainRed, fontSize: setFontSize(context, 0.030), fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Palette.someGrey), borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
                        child: Column(
                          children: [
                            // Center(
                            //   child: Text(
                            //     'รายการที่เพิ่มล่าสุด',
                            //     style: TextStyle(
                            //         color: Palette.mainRed,
                            //         fontSize: setFontSize(context, 0.030),
                            //         fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                            SizedBox(
                              height: setHeight(context, 0.005),
                            ),
                            Row(
                              children: [
                                buildCustomBox('ลำดับ', '2s', context, 0.02),
                                buildCustomBox('น้ำหนักที่ชั่ง', '2s', context, 0.02),
                                buildCustomBox('BF3', '2s', context, 0.02),
                                buildCustomBox('BF4', '2s', context, 0.02),
                                buildCustomBox('b', '2s', context, 0.02),
                                buildCustomBox('ผล LSQ', '2s', context, 0.02),
                                buildCustomBox('เกรด LSQ', '2s', context, 0.02),
                              ],
                            ),
                            SizedBox(
                              height: setHeight(context, 0.01),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 234, 62, 88),
                                  elevation: 0,
                                  // side: BorderSide(color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "แจ้งแก้ไขข้อมูล",
                                    style: TextStyle(color: Colors.white, fontSize: setFontSize(context, 0.03)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])),
            )));
  }
}
