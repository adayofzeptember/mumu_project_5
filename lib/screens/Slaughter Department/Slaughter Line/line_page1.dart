import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/ETC/progessHUD.dart';
import 'package:mumu_project/bloc/Slaughter/Line%20Slaughter/line_bloc.dart';

class Line_Page1 extends StatefulWidget {
  Line_Page1({super.key});

  @override
  State<Line_Page1> createState() => _Line_Page1State();
}

class _Line_Page1State extends State<Line_Page1> {
  var _dateController = TextEditingController();
  var _remarkController = TextEditingController();
  var _lotNoController;
  var _farmNameController;
  var _coopName;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  final List<bool> _selectedInsensible = <bool>[true, false];
  final List<bool> _selectedStab = <bool>[true, false];
  final List<bool> _selectedTemperature = <bool>[true, false];
  int _insensibleCount = 0;
  int _temperValue = 62;
  int _stabCount = 0;
  bool _isOmega = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LineBloc, LineState>(
      builder: (context, state) {
        return ProgressHUD(
            child: _uiLinePage1(context),
            inAsyncCall: state.isLoading,
            opacity: 0.3);
      },
    );
  }

  Widget _uiLinePage1(BuildContext context) {
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'ลำดับการตรวจ',
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
                                'วันที่บันทึก',
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
                                enabled: false,
                                initialValue: '1',
                                decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 223, 223, 223),
                                  filled: true,
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
                                readOnly: true,
                                controller: _dateController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.access_time),
                                    onPressed: () {
                                      selectDate(context);
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
                          ],
                        ),
                        SizedBox(height: setHeight(context, 0.02)),
                        Text(
                          'Lot No.',
                          style: TextStyle(
                              fontSize: setFontSize(context, 0.030),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: setHeight(context, 0.01),
                        ),
                        BlocBuilder<LineBloc, LineState>(
                          builder: (context, state) {
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade400),
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
                                    items: state.lineLot_dropDown
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                    fontFamily: 'Prompt',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                    color: Palette.mainRed),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _lotNoController = value;
                                      });
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      height: 40,
                                      width: 120,
                                    ),
                                    value: _lotNoController,
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: setHeight(context, 0.02)),
                        Text(
                          'ชื่อฟาร์ม',
                          style: TextStyle(
                              fontSize: setFontSize(context, 0.030),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: setHeight(context, 0.01),
                        ),
                        BlocBuilder<LineBloc, LineState>(
                          builder: (context, state) {
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade400),
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
                                    items: state.farmName_dropDown
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                    fontFamily: 'Prompt',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                    color: Palette.mainRed),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _farmNameController = value;
                                      });
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      height: 40,
                                      width: 120,
                                    ),
                                    value: _farmNameController,
                                    // value: _farmNameController.text,
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
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
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      alignment: AlignmentDirectional.center,
                                      hint: Text('เลือกเล้า'),
                                      style: TextStyle(
                                          fontSize: setFontSize(context, 0.025),
                                          fontFamily: 'Prompt'),
                                      items: ['coop']
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: TextStyle(
                                                    fontFamily: 'Prompt',
                                                    color: Palette.mainRed,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _coopName = value;
                                        });
                                      },
                                      buttonStyleData: const ButtonStyleData(
                                        height: 40,
                                        width: 120,
                                      ),
                                      value: _coopName,
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
                                'การทำสลบ',
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
                                'จำนวน',
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
                              child: ToggleButtons(
                                onPressed: (int index) {
                                  setState(() {
                                    for (int i = 0;
                                        i < _selectedInsensible.length;
                                        i++) {
                                      _selectedInsensible[i] = i == index;
                                    }
                                  });
                                },
                                borderRadius: BorderRadius.circular(8),
                                borderColor: Colors.grey,
                                fillColor: Colors.blue,
                                selectedBorderColor: Colors.blue,
                                selectedColor: Colors.white,
                                color: Colors.grey,
                                constraints: BoxConstraints(
                                    minWidth: 150,
                                    minHeight: setHeight(context, 0.05)),
                                children: [
                                  Text('สลบ', style: TextStyle(fontSize: 25)),
                                  Text('ไม่สลบ',
                                      style: TextStyle(fontSize: 25)),
                                ],
                                isSelected: _selectedInsensible,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FloatingActionButton(
                                      heroTag: '113',
                                      onPressed: () {
                                        setState(() {
                                          _insensibleCount =
                                              _insensibleCount - 1;
                                        });
                                      },
                                      child: Text('-',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  setFontSize(context, 0.045))),
                                      backgroundColor: Palette.mainRed),
                                  Container(
                                    width: setWidth(context, 0.2),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        border: Border.all(
                                            color: Colors.grey.shade400)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Center(
                                        child: Text(
                                          _insensibleCount.toString(),
                                          style: TextStyle(
                                            fontSize:
                                                setFontSize(context, 0.025),
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FloatingActionButton(
                                      heroTag: '444',
                                      onPressed: () {
                                        setState(() {
                                          _insensibleCount =
                                              _insensibleCount + 1;
                                        });
                                      },
                                      child: Text('+',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  setFontSize(context, 0.045))),
                                      backgroundColor: Palette.mainRed),
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
                                'เชือดหมู',
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
                                'จำนวน',
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
                              child: ToggleButtons(
                                borderRadius: BorderRadius.circular(8),
                                borderColor: Colors.grey,
                                fillColor: Colors.blue,
                                selectedBorderColor: Colors.blue,
                                selectedColor: Colors.white,
                                color: Colors.grey,
                                constraints: BoxConstraints(
                                    minWidth: 150,
                                    minHeight: setHeight(context, 0.05)),
                                children: [
                                  Text('ดิ้น', style: TextStyle(fontSize: 25)),
                                  Text('ไม่ดิ้น',
                                      style: TextStyle(fontSize: 25)),
                                ],
                                onPressed: (int index) {
                                  setState(() {
                                    for (int i = 0;
                                        i < _selectedStab.length;
                                        i++) {
                                      _selectedStab[i] = i == index;
                                    }
                                  });
                                },
                                isSelected: _selectedStab,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FloatingActionButton(
                                      heroTag: '212',
                                      onPressed: () {
                                        setState(() {
                                          _stabCount = _stabCount - 1;
                                        });
                                      },
                                      child: Text('-',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  setFontSize(context, 0.045))),
                                      backgroundColor: Palette.mainRed),
                                  Container(
                                    width: setWidth(context, 0.2),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        border: Border.all(
                                            color: Colors.grey.shade400)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Center(
                                        child: Text(
                                          _stabCount.toString(),
                                          style: TextStyle(
                                            fontSize:
                                                setFontSize(context, 0.025),
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FloatingActionButton(
                                      heroTag: '13',
                                      onPressed: () {
                                        setState(() {
                                          _stabCount = _stabCount + 1;
                                        });
                                      },
                                      child: Text('+',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  setFontSize(context, 0.045))),
                                      backgroundColor: Palette.mainRed),
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
                                'อุณหภูมิบ่อลวก',
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
                                'ค่าอุณหภูมิ',
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
                              child: ToggleButtons(
                                borderRadius: BorderRadius.circular(8),
                                borderColor: Colors.grey,
                                fillColor: Colors.blue,
                                selectedBorderColor: Colors.blue,
                                selectedColor: Colors.white,
                                color: Colors.grey,
                                constraints: BoxConstraints(
                                    minWidth: 150,
                                    minHeight: setHeight(context, 0.05)),
                                children: [
                                  Text('ปกติ', style: TextStyle(fontSize: 25)),
                                  Text('ไม่ปกติ',
                                      style: TextStyle(fontSize: 25)),
                                ],
                                onPressed: (int index) {
                                  setState(() {
                                    for (int i = 0;
                                        i < _selectedTemperature.length;
                                        i++) {
                                      _selectedTemperature[i] = i == index;
                                    }
                                  });
                                },
                                isSelected: _selectedTemperature,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FloatingActionButton(
                                      heroTag: '21',
                                      onPressed: () {
                                        setState(() {
                                          _temperValue = _temperValue - 1;
                                        });
                                      },
                                      child: Text('-',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  setFontSize(context, 0.045))),
                                      backgroundColor: Palette.mainRed),
                                  Container(
                                    width: setWidth(context, 0.2),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        border: Border.all(
                                            color: Colors.grey.shade400)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Center(
                                        child: Text(
                                          _temperValue.toString(),
                                          style: TextStyle(
                                            fontSize:
                                                setFontSize(context, 0.025),
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FloatingActionButton(
                                      heroTag: '11',
                                      onPressed: () {
                                        setState(() {
                                          _temperValue = _temperValue + 1;
                                        });
                                      },
                                      child: Text('+',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  setFontSize(context, 0.045))),
                                      backgroundColor: Palette.mainRed),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: setHeight(context, 0.02),
                        ),
                        Text(
                          'หมายเหตุ',
                          style: TextStyle(
                              fontSize: setFontSize(context, 0.030),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: setHeight(context, 0.01),
                        ),
                        TextFormField(
                          controller: _remarkController,
                          maxLines: 4,
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
                        SizedBox(
                          height: setHeight(context, 0.07),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                elevation: 0,
                                // side: BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {
                              // print(_selectedStab[0].toString() +
                              //     _selectedInsensible[0].toString() +
                              //     _selectedTemperature[0].toString());

                              context.read<LineBloc>().add(SaveLine_UI291(
                                  context: context,
                                  get_pig_arrival_id: 1,
                                  get_insensible: _selectedInsensible[0],
                                  get_insensible_value: _insensibleCount,
                                  get_stab: _selectedStab[0],
                                  get_stab_value: 111,
                                  get_temperature: _selectedTemperature[0],
                                  get_temperature_value:
                                      double.parse(_temperValue.toString()),
                                  get_remark: _remarkController.text));

                              context
                                  .read<LineBloc>()
                                  .add(FetchHistory_UI292());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  "เพิ่ม",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: setFontSize(context, 0.05)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ])),
            )));
  }
}
