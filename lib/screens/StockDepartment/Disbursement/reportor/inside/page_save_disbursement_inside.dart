import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/formdropdown.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class PageSaveDisbursementInside extends StatefulWidget {
  const PageSaveDisbursementInside({Key? key}) : super(key: key);

  @override
  _PageSaveDisbursementInsideState createState() => _PageSaveDisbursementInsideState();
}

class _PageSaveDisbursementInsideState extends State<PageSaveDisbursementInside> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedSizeCart;
  TextEditingController _textGetIn = TextEditingController();
  bool _errSize = false;

  DateTime _selectedDateTime = DateTime.now();

  final List<Map<String, TextEditingController>> listControllers = [];

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
  void dispose() {
    for (var controller in listControllers) {
      controller['input1']?.dispose();
      controller['input2']?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: setHeight(context, 1),
          width: setWidth(context, 1),
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "บันทึกการเบิกจ่ายสินค้า",
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
                            "วันที่บันทึก",
                            style: TextStyle(
                              fontSize: setFontSize(context, 0.025),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Prompt',
                              color: const Color(0xFF757575),
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
                                borderSide: const BorderSide(color: Color(0xFF757575)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF757575)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF757575)),
                              ),
                            ),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: setFontSize(context, 0.024), color: const Color(0xFF757575)),
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
                  ],
                ),
                const SizedBox(height: 28),
                FormDisbrusement(
                  textGetIn: _textGetIn,
                  label: 'label',
                ),
                const SizedBox(height: 28),
                Text(
                  "รายการสินค้า",
                  style: TextStyle(
                    fontSize: setFontSize(context, 0.03),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          return const Color(0xFfF7F5F5);
                        },
                      ),
                      headingTextStyle: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: setFontSize(context, 0.016),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF757575),
                      ),
                      dataTextStyle: TextStyle(fontSize: setFontSize(context, 0.016), fontWeight: FontWeight.bold),
                      headingRowHeight: setHeight(context, 0.04),
                      columns: <DataColumn>[
                        for (var label in [
                          "ลำดับ",
                          "Lot No.",
                          "วัน\nเวลาที่บันทึก",
                          "ชื่อสินค้า",
                          "ประเภทซีก",
                          "คลังที่มา",
                          "จำนวนถุง/ชิ้น",
                          "น้ำหนักจริง",
                          "จัดการข้อมูล",
                        ])
                          DataColumn(
                            label: Expanded(
                              child: Text(label),
                            ),
                          ),
                      ],
                      rows: [
                        for (var i = 0; i < 1; i++)
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text((i + 1).toString())),
                              DataCell(Text("011223$i")),
                              DataCell(Text("02/11/2566 09:20 ")),
                              DataCell(Text("ชื่อสินค้า")),
                              DataCell(Text("ประเภทซีก")),
                              DataCell(Text("คลังที่มา")),
                              DataCell(Text("จำนวนถุง/ชิ้น")),
                              DataCell(Text("น้ำหนักจริง")),
                              DataCell(
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      listControllers.add({"input": TextEditingController()});
                    });
                  },
                  child: Text("เพิ่ม Input"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: listControllers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: listControllers[index]["input"],
                                decoration: InputDecoration(
                                  labelText: "Input ${index + 1}",
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  listControllers[index]["input"]?.dispose();
                                  listControllers.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
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
              // ฟังก์ชันแปลงข้อมูลเป็น JSON
              String _getJsonData() {
                List<Map<String, String>> data = listControllers.map((field) {
                  return {"input": field["input"]!.text}; // ดึงค่า text จาก TextField
                }).toList();

                return jsonEncode(data); // แปลงเป็น JSON
              }

              print(_getJsonData());

              // if (_textGetIn == null || _textGetIn!.isEmpty) {
              //   _errGetIn = true;
              // }
              if (_formKey.currentState!.validate()) {
                // Do something
                print("Data saved");
              }
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add_circle_outline, size: 30, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  "เพิ่ม",
                  style: TextStyle(
                    fontSize: setFontSize(context, 0.035),
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

class FormDisbrusement extends StatelessWidget {
  const FormDisbrusement({
    super.key,
    required TextEditingController textGetIn,
    required this.label,
  }) : _textGetIn = textGetIn;

  final TextEditingController _textGetIn;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: setFontSize(context, 0.025),
            fontWeight: FontWeight.bold,
            fontFamily: 'Prompt',
            color: const Color(0xFF757575),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF757575)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF757575)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF757575)),
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
    );
  }
}

class MockUpColor {
  final String colorName;
  final String colorCode;

  MockUpColor({required this.colorName, required this.colorCode});
}
