import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mumu_project/ETC/Components/date_time_component.dart';
import 'package:mumu_project/ETC/Components/image_picker_component.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/bloc/Slaughter/Import/import_bloc.dart';

class Import_Page1 extends StatefulWidget {
  const Import_Page1({super.key});

  @override
  State<Import_Page1> createState() => _Import_Page1State();
}

class _Import_Page1State extends State<Import_Page1> {
  //! form controller

  final _formKeyImportpage1 = GlobalKey<FormState>();
  var _dateController = TextEditingController();
  var _carPlate = TextEditingController();
  var _farmName;
  var _coopName = TextEditingController();
  bool _isOmega = false;

  var _time_CarIn = TextEditingController();
  var _time_CarIn_Total = TextEditingController();
  var _timeSubmit = TextEditingController();
  var _timeSubmit_End = TextEditingController();

  var _pigsAmount = TextEditingController();
  var _pigsMaleAmount = TextEditingController();
  var _pigsFemaleAmount = TextEditingController();

  var _pigsAvgWeight = TextEditingController();
  var _pigsAllWeight = TextEditingController();

  // การพักก่อนเชือด
  var _restTime_Start = TextEditingController();
  var _restTime_End = TextEditingController();
  var _killTime_Start = TextEditingController();
  var _killTime_End = TextEditingController();

  var _highestWeight = TextEditingController();
  var _lowestWeight = TextEditingController();
  //หมูตาย state

  final List<String> _docsOption = ['sdf', 'sdf'];

  var _killLenght = TextEditingController();
  var _restLenght = TextEditingController();

  var _konlaiScore = TextEditingController();
  var _konlongScore = TextEditingController();
  List<File> selectedImages = [];
  final picker = ImagePicker();
  Future<void> _selectTime(
      BuildContext context, TextEditingController getControl) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        final formattedTime = picked.format(context);
        getControl.text = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: RawScrollbar(
          thickness: 7,
          thumbColor: Palette.mainRed,
          radius: const Radius.circular(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 30, 50, 10),
              child: BlocBuilder<ImportBloc, ImportState>(
                builder: (context, state) {
                  return Form(
                    key: _formKeyImportpage1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'การส่งมอบ',
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
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade400,
                                        width: 2.0,
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
                                'วันที่รถเข้า',
                                style: TextStyle(
                                    fontSize: setFontSize(context, 0.030),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'ทะเบียนรถ',
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
                                controller: _dateController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.calendar_today),
                                    onPressed: () {
                                      DateTimePickerHelper_Component.selectDate(
                                        context,
                                        onDateSelected: (selectedDate) {
                                          setState(() {
                                            _dateController.text = selectedDate;
                                          });
                                        },
                                      );
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                            Expanded(
                              child: TextFormField(
                                controller: _carPlate,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                            )
                          ],
                        ),
                        SizedBox(
                          height: setHeight(context, 0.02),
                        ),
                        Text(
                          'ชื่อฟาร์ม',
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
                                alignment: AlignmentDirectional.center,
                                style: TextStyle(
                                    fontSize: setFontSize(context, 0.025),
                                    fontFamily: 'Prompt'),
                                items: ['farm name test1, farm name test2']
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
                                keyboardType: TextInputType.text,
                                controller: _coopName,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'เวลารถเข้า',
                                style: TextStyle(
                                    fontSize: setFontSize(context, 0.030),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'ระยะเวลาทั้งหมด (นาที)',
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
                                controller: _time_CarIn,
                                readOnly: true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.access_time),
                                    onPressed: () {
                                      DateTimePickerHelper_Component.selectTime(
                                        context,
                                        onTimeSelected: (selectedTime) {
                                          setState(() {
                                            _time_CarIn.text = selectedTime;
                                          });
                                        },
                                      );
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                            Expanded(
                              child: TextFormField(
                                controller: _time_CarIn_Total,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                                'เวลาที่เริ่มส่งมอบ',
                                style: TextStyle(
                                    fontSize: setFontSize(context, 0.030),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'เวลาสิ้นสุดส่งมอบ',
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
                                controller: _timeSubmit,
                                readOnly: true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.access_time),
                                    onPressed: () {
                                      DateTimePickerHelper_Component.selectTime(
                                        context,
                                        onTimeSelected: (selectedTime) {
                                          setState(() {
                                            _timeSubmit.text = selectedTime;
                                          });
                                        },
                                      );
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                            Expanded(
                              child: TextFormField(
                                controller: _timeSubmit_End,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.access_time),
                                    onPressed: () {
                                      DateTimePickerHelper_Component.selectTime(
                                        context,
                                        onTimeSelected: (selectedTime) {
                                          setState(() {
                                            _timeSubmit_End.text = selectedTime;
                                          });
                                        },
                                      );
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                            )
                          ],
                        ),
                        SizedBox(
                          height: setHeight(context, 0.03),
                        ),
                        Text(
                          'น้ำหนักและเพศ',
                          style: TextStyle(
                              color: Palette.mainRed,
                              fontSize: setFontSize(context, 0.035),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: setHeight(context, 0.02),
                        ),
                        Text(
                          'จำนวนสุกร',
                          style: TextStyle(
                              fontSize: setFontSize(context, 0.030),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: setHeight(context, 0.01),
                        ),
                        TextFormField(
                          controller: _pigsAmount,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                              borderSide: BorderSide(
                                color: Colors.grey.shade400, // Border color
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
                        SizedBox(
                          height: setHeight(context, 0.02),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'จำนวนเพศผู้',
                                style: TextStyle(
                                    fontSize: setFontSize(context, 0.030),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'จำนวนเพศเมีย',
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
                                controller: _pigsMaleAmount,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                            Expanded(
                              child: TextFormField(
                                controller: _pigsFemaleAmount,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                                'น้ำหนักรวม',
                                style: TextStyle(
                                    fontSize: setFontSize(context, 0.030),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'น้ำหนักเฉลี่ย',
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
                                controller: _pigsAllWeight,
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                            Expanded(
                              child: TextFormField(
                                controller: _pigsAvgWeight,
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                          ],
                        ),
                        SizedBox(
                          height: setHeight(context, 0.03),
                        ),
                        Text(
                          'การพักก่อนเชือด',
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
                                'เวลาเริ่มพัก',
                                style: TextStyle(
                                    fontSize: setFontSize(context, 0.030),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'สิ้นสุดการพัก',
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
                                controller: _restTime_Start,
                                readOnly: true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.access_time),
                                    onPressed: () {
                                      DateTimePickerHelper_Component.selectTime(
                                        context,
                                        onTimeSelected: (selectedTime) {
                                          setState(() {
                                            _restTime_Start.text = selectedTime;
                                          });
                                        },
                                      );
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                            Expanded(
                              child: TextFormField(
                                controller: _restTime_End,
                                readOnly: true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.access_time),
                                      onPressed: () =>
                                          DateTimePickerHelper_Component
                                              .selectTime(
                                            context,
                                            onTimeSelected: (selectedTime) {
                                              setState(() {
                                                _restTime_End.text =
                                                    selectedTime;
                                              });
                                            },
                                          )),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                          ],
                        ),
                        SizedBox(
                          height: setHeight(context, 0.02),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'เวลาเริ่มเชือด',
                                style: TextStyle(
                                    fontSize: setFontSize(context, 0.030),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'สิ้นสุดการเชือด',
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
                                controller: _killTime_Start,
                                readOnly: true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.access_time),
                                      onPressed: () {
                                        DateTimePickerHelper_Component
                                            .selectTime(context,
                                                onTimeSelected: (selectedTime) {
                                          setState(() {
                                            _killTime_Start.text = selectedTime;
                                          });
                                        });
                                      }),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                            Expanded(
                              child: TextFormField(
                                controller: _killTime_End,
                                readOnly: true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.access_time),
                                      onPressed: () {
                                        DateTimePickerHelper_Component
                                            .selectTime(context,
                                                onTimeSelected: (selectedTime) {
                                          setState(() {
                                            _killTime_End.text = selectedTime;
                                          });
                                        });
                                      }),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                          ],
                        ),
                        SizedBox(
                          height: setHeight(context, 0.02),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'ระยะเวลาพัก (นาที)',
                                style: TextStyle(
                                    fontSize: setFontSize(context, 0.030),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'ระยะเวลาการเชือด (นาที)',
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
                                controller: _restLenght,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                            Expanded(
                              child: TextFormField(
                                controller: _killLenght,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                          ],
                        ),
                        SizedBox(
                          height: setHeight(context, 0.02),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'น้ำหนักต่ำสุด',
                                style: TextStyle(
                                    fontSize: setFontSize(context, 0.030),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'น้ำหนักสูงสุด',
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
                                controller: _lowestWeight,
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                            Expanded(
                              child: TextFormField(
                                controller: _highestWeight,
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                          ],
                        ),
                        SizedBox(
                          height: setHeight(context, 0.02),
                        ),
                        Row(
                          children: [
                            Text(
                              'จำนวนสุกรตาย',
                              style: TextStyle(
                                  fontSize: setFontSize(context, 0.030),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Row(
                              children: [
                                FloatingActionButton(
                                    heroTag: '2',
                                    onPressed: () {
                                      context
                                          .read<ImportBloc>()
                                          .add(DeadPigs_Minus());
                                    },
                                    child: Text('-',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                setFontSize(context, 0.045))),
                                    backgroundColor: Palette.mainRed),
                                const SizedBox(
                                  width: 10,
                                ),
                                //state
                                Container(
                                  width: setWidth(context, 0.1),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      border: Border.all(
                                          color: Colors.grey.shade400)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(14),
                                    child: Center(
                                      child: Text(
                                        state.deadPigs.toString(),
                                        style: TextStyle(
                                          fontSize: setFontSize(context, 0.025),
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                    heroTag: '1',
                                    onPressed: () {
                                      context
                                          .read<ImportBloc>()
                                          .add(DeadPigs_Plus());
                                    },
                                    child: Text('+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                setFontSize(context, 0.045))),
                                    backgroundColor: Palette.mainRed),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: setHeight(context, 0.01),
                        ),
                        Text(
                          'เอกสารประกอบ',
                          style: TextStyle(
                              fontSize: setFontSize(context, 0.030),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: setHeight(context, 0.01),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
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
                                  children: _docsOption.map((option) {
                                    return Chip(
                                      label: Text(
                                        option,
                                      ),
                                      labelStyle: TextStyle(fontSize: 20),
                                      deleteIcon: Icon(Icons.close, size: 16),
                                      onDeleted: () {
                                        setState(() {
                                          _docsOption.remove(option);
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(fontSize: 25),
                                    border: InputBorder.none,
                                    hintText: 'ระบุเอกสาร',
                                  ),
                                  onSubmitted: (value) {
                                    setState(() {
                                      if (value.isNotEmpty) {
                                        _docsOption.add(value);
                                      }
                                    });
                                  },
                                ),
                              ],
                            )),
                        SizedBox(
                          height: setHeight(context, 0.02),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'คะแนนคนลงสุกร (1-10)',
                                style: TextStyle(
                                    fontSize: setFontSize(context, 0.030),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'คะแนนคนไล่สุกร (1-10)',
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
                                keyboardType: TextInputType.number,
                                controller: _konlongScore,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _konlaiScore,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Rounded corners
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
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
                          ],
                        ),
                        SizedBox(
                          height: setHeight(context, 0.02),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'อาการผิดปกติ',
                              style: TextStyle(
                                  color: Palette.mainRed,
                                  fontSize: setFontSize(context, 0.035),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: setHeight(context, 0.055),
                              width: setWidth(context, 0.45),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    elevation: 0,
                                    side: const BorderSide(
                                      color: Colors.blue,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                                onPressed: () {
                                  context
                                      .read<ImportBloc>()
                                      .add(AbnormalPigs_Add());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "+ เพิ่มรายการ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: setFontSize(context, 0.03)),
                                    ),
                                  ),
                                ),
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
                              child: Text(
                                'รายการ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: setFontSize(context, 0.025),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'จำนวน',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: setFontSize(context, 0.025),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: setHeight(context, 0.01),
                        ),
                        ListView.builder(
                          itemCount: state.abnormalPigsListCount,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade400),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8),
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            alignment:
                                                AlignmentDirectional.center,
                                            items: ['test']
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color: Palette
                                                                .mainRed),
                                                      ),
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {});
                                              print(value);
                                            },
                                            buttonStyleData:
                                                const ButtonStyleData(
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
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        FloatingActionButton(
                                            heroTag: '2sdfsdf',
                                            onPressed: () {
                                              state.abnormalPigsListCount;
                                            },
                                            child: Text('-',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: setFontSize(
                                                        context, 0.045))),
                                            backgroundColor: Palette.mainRed),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: setWidth(context, 0.1),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(8)),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade400)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(14),
                                              child: Center(
                                                child: Text(
                                                  '1',
                                                  style: TextStyle(
                                                    fontSize: setFontSize(
                                                        context, 0.025),
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        FloatingActionButton(
                                            heroTag: '1sdf',
                                            onPressed: () {},
                                            child: Text('+',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: setFontSize(
                                                        context, 0.045))),
                                            backgroundColor: Palette.mainRed),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: setHeight(context, 0.03),
                        ),
                        Text(
                          'อัปโหลดภาพหมูผิดปกติ (แนบไฟล์ได้ 30 ภาพและแต่ละภาพไม่เกิน 2Mb.)',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: setFontSize(context, 0.025),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: setHeight(context, 0.01),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 87, 172, 242),
                                    elevation: 0,
                                    // side: BorderSide(color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                                onPressed: () {
                                  ImagePickerHelper_Component.getGalleryImages(
                                      context: context,
                                      setState: setState,
                                      selectedImages: selectedImages);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "เพิ่มรูปภาพ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: setFontSize(context, 0.03)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 87, 172, 242),
                                    elevation: 0,
                                    // side: BorderSide(color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                                onPressed: () {
                                  ImagePickerHelper_Component.getCameraImage(
                                      context: context,
                                      setState: setState,
                                      selectedImages: selectedImages);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "ถ่ายภาพ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: setFontSize(context, 0.03)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: selectedImages.isEmpty
                              ? null
                              : BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                          width: double.infinity,
                          child: SizedBox(
                            child: selectedImages.isEmpty
                                ? const Text(' ')
                                : GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: selectedImages.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 9),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Center(
                                          child: GestureDetector(
                                        onTap: () {},
                                        child: Card(
                                          child: SizedBox(
                                            height: 200,
                                            width: 200,
                                            child: Image.file(
                                              selectedImages[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ));
                                    },
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: setHeight(context, 0.03),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
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
                                "บันทึก",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: setFontSize(context, 0.04)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
