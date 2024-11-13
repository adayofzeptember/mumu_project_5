import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/ButtonComponent.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/formdropdown.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class PageEditInternalUse extends StatefulWidget {
  const PageEditInternalUse({
    Key? key,
    required this.getId,
    required this.getDateTime,
    required this.getDepartment,
    required this.getGetIn,
    required this.getNote,
  }) : super(key: key);
  final String getId, getDateTime, getDepartment, getGetIn, getNote;
  @override
  _PageEditInternalUseState createState() => _PageEditInternalUseState();
}

class _PageEditInternalUseState extends State<PageEditInternalUse> {
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDateTime = DateTime.parse(widget.getDateTime);
    _selectedDepartment = widget.getDepartment;
    _textGetIn.text = widget.getGetIn;
    _textNote.text = widget.getNote;
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
                        title: 'แผนก',
                        title2: (_errDepartment) ? '*' : "",
                        hintText: 'เลือกแผนก',
                        value: _selectedDepartment,
                        items: const ['แผนก A', 'แผนก B', 'แผนก C', 'แผนก D', 'แผนก E'],
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
                        color: Palette.greyText,
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
                        color: Palette.greyText,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: setWidth(context, 0.45),
                height: 140,
                child: CancelButtonComponent(
                  onPressed: () => Navigator.pop(context),
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
