import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/formdropdown.dart';
import 'package:mumu_project/ETC/listAddLast.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class PageSaveInternalUse extends StatefulWidget {
  const PageSaveInternalUse({Key? key}) : super(key: key);

  @override
  _PageSaveInternalUseState createState() => _PageSaveInternalUseState();
}

class _PageSaveInternalUseState extends State<PageSaveInternalUse> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedDepartment;
  final TextEditingController _textGetIn = TextEditingController();
  final TextEditingController _textNote = TextEditingController();
  bool _errDepartment = false;

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
                              color: const Color(0xFF637D92),
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
                        title: 'แผนก',
                        title2: (_errDepartment) ? '*' : "",
                        hintText: 'เลือกแผนก',
                        value: _selectedDepartment,
                        items: const ['test1', 'test2', 'test3'],
                        onChanged: (value) {
                          setState(() {
                            _selectedDepartment = value;
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
                      "จำนวน(แลก)",
                      style: TextStyle(
                        fontSize: setFontSize(context, 0.025),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt',
                        color: const Color(0xFF637D92),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      textAlign: TextAlign.right,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "หมายเหตุ",
                      style: TextStyle(
                        fontSize: setFontSize(context, 0.025),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt',
                        color: const Color(0xFF637D92),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "กรอกหมายเหตุ",
                        hintStyle: TextStyle(
                          fontSize: setFontSize(context, 0.024),
                          color: const Color(0xFF92A5B5),
                        ),
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
                      controller: _textNote,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 3,
                    ),
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
                      label: 'แผนก',
                      value: 'M',
                      width: setWidth(context, 0.63),
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
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: const Color(0xFF1890FF),
            ),
            onPressed: () {
              if (_selectedDepartment == null) {
                setState(() {
                  _errDepartment = true;
                });
              } else {
                setState(() {
                  _errDepartment = false;
                });
              }
              if (_formKey.currentState!.validate()) {
                // Do something
                print("Data saved");
                print("DateTime: $_selectedDateTime");
                print("Get in: ${_textGetIn.text}");
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
