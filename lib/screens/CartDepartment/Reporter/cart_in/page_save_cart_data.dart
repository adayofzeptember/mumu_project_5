import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/formdropdown.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

import '../../../../ETC/listAddLast.dart';

class PageSaveCartData extends StatefulWidget {
  const PageSaveCartData({Key? key}) : super(key: key);

  @override
  _PageSaveCartDataState createState() => _PageSaveCartDataState();
}

class _PageSaveCartDataState extends State<PageSaveCartData> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedOrigin, _selectedSizeCart, _selectedColorCart, _countBroken = "0";
  TextEditingController _textGetIn = TextEditingController();
  bool _isClean = false;
  bool _errOrigin = false, _errSize = false, _errColor = false;

  DateTime _selectedDateTime = DateTime.now();

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "บันทึกตะกร้ารับเข้า",
                  style: TextStyle(
                    fontSize: setFontSize(context, 0.03),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prompt',
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: setWidth(context, 0.45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "บันทึกตะกร้ารับเข้า",
                            style: TextStyle(
                              fontSize: setFontSize(context, 0.025),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Prompt',
                              color: Palette.greyText,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
                              suffixIcon: const Icon(Icons.calendar_today_outlined),
                              fillColor: const Color(0xFFF7F5F5),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                              ),
                            ),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: setFontSize(context, 0.024), color: const Color(0xFF757575)),
                            onTap: () {
                              // _selectDateTime(context); // เปิดใช้งานเมื่อต้องการเลือกวันเวลา
                            },
                            controller: TextEditingController(
                              text:
                                  "${_selectedDateTime.day}/${_selectedDateTime.month}/${_selectedDateTime.year} ${_selectedDateTime.hour}:${_selectedDateTime.minute}",
                            ),
                            validator: (value) => value == null || value.isEmpty ? 'Please select a date and time' : null,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: setWidth(context, 0.45),
                      child: FormDropdown(
                        title: 'ที่มา',
                        title2: (_errOrigin) ? '*' : "",
                        hintText: 'เลือกที่มา',
                        value: _selectedOrigin,
                        items: const ['test1', 'test2', 'test3'],
                        onChanged: (value) {
                          setState(() {
                            _selectedOrigin = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: setWidth(context, 0.45),
                      child: FormDropdown(
                        title: 'ขนาดตะกร้า',
                        title2: (_errSize) ? '*' : "",
                        hintText: 'เลือกขนาด',
                        value: _selectedSizeCart,
                        items: const ['S', 'M', 'L', 'XL'],
                        onChanged: (value) {
                          setState(() {
                            _selectedSizeCart = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: setWidth(context, 0.45),
                      child: FormDropdown(
                        title: 'สีตะกร้า',
                        title2: (_errColor) ? '*' : "",
                        hintText: 'เลือกสี',
                        value: _selectedColorCart,
                        items: [
                          MockUpColor(colorName: "สีแดง", colorCode: "0xFFF44336").colorName,
                          MockUpColor(colorName: "สีเทา", colorCode: "0xFF9E9E9E").colorName,
                          MockUpColor(colorName: "สีเหลือง", colorCode: "0xFFFFEB3B").colorName,
                        ],
                        colorCode: [
                          MockUpColor(colorName: "สีแดง", colorCode: "0xFFF44336").colorCode,
                          MockUpColor(colorName: "สีเทา", colorCode: "0xFF9E9E9E").colorCode,
                          MockUpColor(colorName: "สีเหลือง", colorCode: "0xFFFFEB3B").colorCode,
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedColorCart = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "จำนวนรับเข้า",
                      style: TextStyle(
                        fontSize: setFontSize(context, 0.025),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt',
                        color: Palette.greyText,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                        ),
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: setFontSize(context, 0.024),
                      ),
                      controller: _textGetIn,
                      keyboardType: TextInputType.number,
                      validator: (value) => value == null || value.isEmpty ? "โปรดป้อนจำนวนรับเข้า" : null,
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    SizedBox(
                      width: setWidth(context, 0.45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "การทำความสะอาด",
                            style: TextStyle(
                              fontSize: setFontSize(context, 0.025),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Prompt',
                              color: Palette.greyText,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 200,
                            height: 80,
                            alignment: Alignment.centerLeft,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Transform.scale(
                                    scaleX: 2.3,
                                    scaleY: 2.1,
                                    child: CupertinoSwitch(
                                      value: _isClean,
                                      onChanged: (val) {
                                        setState(() {
                                          _isClean = val;
                                        });
                                      },
                                      activeColor: Palette.mainRed,
                                    ),
                                  ),
                                ),
                                if (_isClean)
                                  const Positioned(
                                    top: 2,
                                    left: 12,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: setWidth(context, 0.45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "จำนวนที่แตก",
                            style: TextStyle(
                              fontSize: setFontSize(context, 0.025),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Prompt',
                              color: Palette.greyText,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF92A5B5),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (int.parse(_countBroken!) > 0) {
                                        _countBroken = (int.parse(_countBroken!) - 1).toString();
                                      }
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 18),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    isCollapsed: true,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: setFontSize(context, 0.024),
                                  ),
                                  textAlign: TextAlign.center,
                                  controller: TextEditingController(text: _countBroken),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 18),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Palette.mainRed,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _countBroken = (int.parse(_countBroken!) + 1).toString();
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 60),
                Text(
                  "รายการที่เพิ่มล่าสุด",
                  style: TextStyle(
                    fontSize: setFontSize(context, 0.03),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListAddLast(
                      label: 'ลำดับ',
                      value: '1',
                      width: setWidth(context, 0.1),
                    ),
                    const SizedBox(width: 18),
                    ListAddLast(
                      label: 'ขนาดตะกร้า',
                      value: 'M',
                      width: setWidth(context, 0.3),
                    ),
                    const SizedBox(width: 18),
                    ListAddLast(
                      label: 'สีตะกร้า',
                      value: 'สีแดง',
                      width: setWidth(context, 0.3),
                    ),
                    const SizedBox(width: 18),
                    ListAddLast(
                      label: 'จำนวน',
                      value: '50',
                      width: setWidth(context, 0.15),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(double.infinity, 70),
                    backgroundColor: const Color(0xFFFF4D4F),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ImageIcon(
                        AssetImage("assets/images/pen-line.png"),
                        size: 30,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "แจ้งแก้ไขรายการล่าสุด",
                        style: TextStyle(
                          fontSize: setFontSize(context, 0.03),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: setHeight(context, 0.1)),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        height: 140,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x1A000000),
              offset: Offset(4, 4),
              blurRadius: 30.7,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 28),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Palette.blue,
            ),
            onPressed: () {
              if (_selectedOrigin == null) {
                _errOrigin = true;
              }
              if (_selectedSizeCart == null) {
                _errSize = true;
              }
              if (_selectedColorCart == null) {
                _errColor = true;
              }
              // if (_textGetIn == null || _textGetIn!.isEmpty) {
              //   _errGetIn = true;
              // }
              if (_formKey.currentState!.validate()) {
                // Do something
                print("Data saved");
                print("DateTime: $_selectedDateTime");
                print("Origin: $_selectedOrigin");
                print("Size: $_selectedSizeCart");
                print("Color: $_selectedColorCart");
                print("Get in: ${_textGetIn.text}");
                print("Clean: $_isClean");
                print("Broken: $_countBroken");
              }
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add_circle_outline, size: 35, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  "เพิ่ม",
                  style: TextStyle(
                    fontSize: setFontSize(context, 0.04),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MockUpColor {
  final String colorName;
  final String colorCode;

  MockUpColor({required this.colorName, required this.colorCode});
}
