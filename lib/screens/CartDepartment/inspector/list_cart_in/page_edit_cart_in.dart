import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/appbar_component.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/formdropdown.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class PageEditCartIn extends StatefulWidget {
  const PageEditCartIn({
    Key? key,
    required this.getId,
    required this.getDateTime,
    required this.getOrigin,
    required this.getSize,
    required this.getColor,
    required this.getCount,
    required this.getClean,
    required this.getBroken,
  }) : super(key: key);
  final String getId, getDateTime, getOrigin, getSize, getColor, getCount, getClean, getBroken;

  @override
  _PageEditCartInState createState() => _PageEditCartInState();
}

class _PageEditCartInState extends State<PageEditCartIn> {
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDateTime = DateTime.parse(widget.getDateTime);
    _selectedOrigin = widget.getOrigin;
    _selectedSizeCart = widget.getSize;
    _selectedColorCart = widget.getColor;
    _textGetIn.text = widget.getCount;
    _isClean = widget.getClean == "true" ? true : false;
    _countBroken = widget.getBroken;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textGetIn.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white, // Set background color to white
        toolbarHeight: setHeight(context, 0.06),
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to the right
          children: [
            AppBarHomeMenu(
              title: "รับตะกร้าเข้า",
            ),
            AppBarNameLastNameRoleAndLogout(),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: const Color(0xFFE7EBEF),
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 68), // กำหนดขนาดปุ่ม
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(41),
                    ),
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(
                      width: 1.5,
                      color: Palette.mainRed,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        size: 35,
                        color: Palette.mainRed,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "ย้อนกลับ",
                        style: TextStyle(
                          fontSize: setFontSize(context, 0.03),
                          fontWeight: FontWeight.bold,
                          color: Palette.mainRed,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "แก้ไขตะกร้ารับเข้า",
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
                                "วันเวลาที่บันทึก",
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: setFontSize(context, 0.024),
                                    color: const Color(0xFF757575)),
                                onTap: () {
                                  _selectDateTime(context); // เปิดใช้งานเมื่อต้องการเลือกวันเวลา
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
                            items: const ['ภายนอก', 'test2', 'test3'],
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
                    SizedBox(height: setHeight(context, 0.1)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        height: 140,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x1A000000),
              offset: Offset(4, 4),
              blurRadius: 30.7,
            ),
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: setWidth(context, 0.45),
                height: 140,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: const Color(0xFFF7F5F5),
                    side: const BorderSide(
                      width: 2.0,
                      color: Color(0xFF757575),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                          fontSize: setFontSize(context, 0.04),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF757575),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: setWidth(context, 0.45),
                height: 140,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: const Color(0xFF52C41A),
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
                      const Icon(Icons.save_alt, size: 35, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        "บันทึก",
                        style: TextStyle(
                          fontSize: setFontSize(context, 0.04),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
