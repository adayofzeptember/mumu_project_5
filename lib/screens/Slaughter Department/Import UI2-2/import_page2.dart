// ignore_for_file: must_be_immutable
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mumu_project/ETC/Components/image_picker_component.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/ETC/progessHUD.dart';
import 'package:mumu_project/bloc/Master%20Data/master_data_bloc.dart';
import 'package:mumu_project/bloc/Slaughter/Import/import_bloc.dart';
import 'package:sliding_switch/sliding_switch.dart';

import '../../../ETC/Components/customBox_component.dart';

class Import_Page2 extends StatefulWidget {
  Import_Page2({super.key});

  @override
  State<Import_Page2> createState() => _Import_Page2State();
}

class _Import_Page2State extends State<Import_Page2> {
  final _formKeyImportpage2 = GlobalKey<FormState>();
  String value2 = 'really';
  String valueNO = '';
  var _balanceName;
  var _balanceID;
  var _reason;
  var estimateName;
  var _weight = TextEditingController();
  final List<bool> _selected_pigsDetail = <bool>[true, false, false];
  final List<String> _pigsDetail_Options = ['ปกติ', '9 นิ้ว', 'หมูท้อง'];
  String _getPigDetail = 'normal';
  List<File> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImportBloc, ImportState>(
      builder: (context, state) {
        return ProgressHUD(
            child: _uiImportPage2(context),
            inAsyncCall: state.isLoading,
            opacity: 0.3);
      },
    );
  }

  Widget _uiImportPage2(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: RawScrollbar(
            thickness: 7,
            thumbColor: Palette.mainRed,
            radius: Radius.circular(20),
            child: BlocBuilder<MasterDataBloc, MasterDataState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 30, 50, 10),
                      child: Form(
                        key: _formKeyImportpage2,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'บันทึกการชั่งน้ำหนักสุกรรายตัว',
                                style: TextStyle(
                                    color: Palette.mainRed,
                                    fontSize: setFontSize(context, 0.035),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: setHeight(context, 0.035),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Lot No.',
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
                                      'หมายเลขเครื่องชั่ง',
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
                                      height: 60,
                                      child: TextFormField(
                                        initialValue: 'Auto',
                                        readOnly: true,
                                        // controller: _dateController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                8), // Rounded corners
                                            borderSide: BorderSide(
                                              color: Colors.grey
                                                  .shade400, // Border color
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
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
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 60,
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
                                            alignment:
                                                AlignmentDirectional.center,
                                            style: TextStyle(
                                              fontSize:
                                                  setFontSize(context, 0.025),
                                              fontFamily: 'Prompt',
                                            ),
                                            items: state
                                                .balance_id_device_dropdown
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item
                                                          .balance_name, // Use farm_name as the value
                                                      child: Text(
                                                        item.balance_name, // Display farm_name in the dropdown
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                          color:
                                                              Palette.mainRed,
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              final selectedItem = state
                                                  .balance_id_device_dropdown
                                                  .firstWhere(
                                                (item) =>
                                                    item.balance_name == value,
                                              );
                                              // print(
                                              //     "  balance Name: ${selectedItem.balance_name}");
                                              print(
                                                  "Selected ID: ${selectedItem.id}, Farm Name: ${selectedItem.balance_name}");

                                              setState(() {
                                                _balanceID =
                                                    int.parse(selectedItem.id);
                                                _balanceName = value
                                                    as String; // Update selected farm name
                                              });
                                            },
                                            value:
                                                _balanceName, // This should be a String to hold the selected farm name
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
                                    child: ToggleButtons(
                                      onPressed: (int index) {
                                        setState(() {
                                          for (int i = 0;
                                              i < _selected_pigsDetail.length;
                                              i++) {
                                            _selected_pigsDetail[i] =
                                                i == index;
                                          }
                                          _getPigDetail =
                                              _pigsDetail_Options[index];
                                          // String selectedValue =
                                          //     _pigsDetail_Options[index];
                                          if (_pigsDetail_Options[index]
                                                  .toString() ==
                                              'ปกติ') {
                                            _getPigDetail = 'normal';
                                          } else if (_pigsDetail_Options[index]
                                                  .toString() ==
                                              '9 นิ้ว') {
                                            _getPigDetail = 'nine_finger';
                                          } else {
                                            _getPigDetail = 'pregnant';
                                          }
                                          print(_pigsDetail_Options[index]);
                                        });
                                      },
                                      borderColor: Palette.someGrey,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      selectedBorderColor: Palette.mainRed,
                                      selectedColor: Colors.white,
                                      textStyle: TextStyle(
                                          fontSize: 25, fontFamily: 'prompt'),
                                      fillColor: Palette.mainRed,
                                      color: Palette.mainRed,
                                      constraints: BoxConstraints(
                                        minHeight: setHeight(context, 0.055),
                                        minWidth: setWidth(context, 0.13),
                                      ),
                                      isSelected: _selected_pigsDetail,
                                      children: [
                                        Text(
                                          'ปกติ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '9 นิ้ว',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'หมูท้อง',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
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
                              InkWell(
                                onTap: () {
                                  print(_getPigDetail);
                                },
                                child: Text(
                                  'สาเหตุการประมาณน้ำหนัก',
                                  style: TextStyle(
                                      fontSize: setFontSize(context, 0.030),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: setHeight(context, 0.01),
                              ),

                              Container(
                                width: double.infinity,
                                height: 80,
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
                                        fontFamily: 'Prompt',
                                      ),
                                      items: state.estimateType_dropdown
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item
                                                    .type, // Use farm_name as the value
                                                child: Text(
                                                  item.type, // Display farm_name in the dropdown
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Palette.mainRed,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        final selectedItem = state
                                            .estimateType_dropdown
                                            .firstWhere(
                                          (item) => item.type == value,
                                        );
                                        // print(
                                        //     "  balance Name: ${selectedItem.balance_name}");
                                        print(
                                            "Selected ID: ${selectedItem.id}, Farm Name: ${selectedItem.type}");

                                        setState(() {
                                          // _balanceID =
                                          //     int.parse(selectedItem.id);
                                          estimateName = value
                                              as String; // Update selected farm name
                                        });
                                      },
                                      value:
                                          estimateName, // This should be a String to hold the selected farm name
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
                              // Container(
                              //   width: double.infinity,
                              //   decoration: BoxDecoration(
                              //       border:
                              //           Border.all(color: Colors.grey.shade400),
                              //       borderRadius: BorderRadius.all(
                              //         Radius.circular(8),
                              //       )),
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(12.0),
                              //     child: DropdownButtonHideUnderline(
                              //       child: DropdownButton2(
                              //         alignment: AlignmentDirectional.center,
                              //         style: TextStyle(
                              //             fontSize: setFontSize(context, 0.025),
                              //             fontFamily: 'Prompt'),
                              //         items: ['ประมาณน้ำหนัก']
                              //             .map((item) =>
                              //                 DropdownMenuItem<String>(
                              //                   value: item,
                              //                   child: Text(
                              //                     item,
                              //                     style: const TextStyle(
                              //                         fontWeight:
                              //                             FontWeight.bold,
                              //                         fontSize: 20,
                              //                         color: Palette.mainRed),
                              //                   ),
                              //                 ))
                              //             .toList(),
                              //         onChanged: (value) {
                              //           setState(() {
                              //             _reason = value;
                              //           });
                              //         },
                              //         value: _reason,
                              //         buttonStyleData: const ButtonStyleData(
                              //           height: 40,
                              //           width: 120,
                              //         ),
                              //         menuItemStyleData:
                              //             const MenuItemStyleData(
                              //           height: 40,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
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
                              (_getPigDetail == 'nine_finger')
                                  ? Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              border: Border.all(
                                                  color: Palette.someGrey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'อัปโหลดภาพหมูผิดปกติ (แนบไฟล์ได้ 30 ภาพและแต่ละภาพไม่เกิน 2Mb.)',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: setFontSize(
                                                          context, 0.025),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height:
                                                      setHeight(context, 0.01),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .green,
                                                                elevation: 0,
                                                                // side: BorderSide(color: Colors.white),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                )),
                                                        onPressed: () {
                                                          ImagePickerHelper_Component
                                                              .getGalleryImages(
                                                                  context:
                                                                      context,
                                                                  setState:
                                                                      setState,
                                                                  selectedImages:
                                                                      selectedImages);
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Text(
                                                            "เพิ่มรูปภาพ",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    setFontSize(
                                                                        context,
                                                                        0.03)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .green,
                                                                elevation: 0,
                                                                // side: BorderSide(color: Colors.white),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                )),
                                                        onPressed: () {
                                                          ImagePickerHelper_Component
                                                              .getCameraImage(
                                                                  context:
                                                                      context,
                                                                  setState:
                                                                      setState,
                                                                  selectedImages:
                                                                      selectedImages);
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Text(
                                                            "ถ่ายภาพ",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    setFontSize(
                                                                        context,
                                                                        0.03)),
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
                                                  decoration: selectedImages
                                                          .isEmpty
                                                      ? null
                                                      : BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                  width: double.infinity,
                                                  child: SizedBox(
                                                    child:
                                                        selectedImages.isEmpty
                                                            ? const Text(' ')
                                                            : GridView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount:
                                                                    selectedImages
                                                                        .length,
                                                                gridDelegate:
                                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            9),
                                                                itemBuilder:
                                                                    (BuildContext
                                                                            context,
                                                                        int index) {
                                                                  return Center(
                                                                      child:
                                                                          GestureDetector(
                                                                    onTap:
                                                                        () {},
                                                                    child: Card(
                                                                      child:
                                                                          SizedBox(
                                                                        height:
                                                                            200,
                                                                        width:
                                                                            200,
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            print(selectedImages[index].path);
                                                                          },
                                                                          child:
                                                                              Image.file(
                                                                            selectedImages[index],
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ));
                                                                },
                                                              ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: setHeight(context, 0.02),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    elevation: 0,
                                    // side: BorderSide(color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                                onPressed: () {
                                  //    print(_balanceID);
                                  context.read<ImportBloc>().add(
                                      Weight_SendUI2_3(
                                          getEstimateType:
                                              estimateName.toString(),
                                          balance_id: _balanceID.toString(),
                                          context: context,
                                          picsFiles: selectedImages,
                                          getWeight_type: value2.toString(),
                                          getWeight: _weight.text.toString(),
                                          getPig_type:
                                              _getPigDetail.toString()));
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
                              SizedBox(
                                height: setHeight(context, 0.01),
                              ),
                              Divider(
                                thickness: 2,
                                color: Palette.someGrey,
                              ),
                              SizedBox(
                                height: setHeight(context, 0.01),
                              ),
                              Text(
                                'รายการที่เพิ่มล่าสุด',
                                style: TextStyle(
                                    color: Palette.mainRed,
                                    fontSize: setFontSize(context, 0.030),
                                    fontWeight: FontWeight.bold),
                              ),
                              BlocBuilder<ImportBloc, ImportState>(
                                builder: (context, state) {
                                  return Row(
                                    children: [
                                      buildCustomBox('ลำดับ',
                                          state.last_weight.id, context, 0.025),
                                      buildCustomBox(
                                          'น้ำหนักที่ชั่ง',
                                          state.last_weight.weight,
                                          context,
                                          0.025),
                                      buildCustomBox(
                                          'ลักษณะสุกร',
                                          state.last_weight.pig_type,
                                          context,
                                          0.025),
                                      buildCustomBox(
                                          'ประเภทชั่ง',
                                          state.last_weight.weight_type,
                                          context,
                                          0.025),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: setHeight(context, 0.01),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 234, 62, 88),
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
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: setFontSize(context, 0.03)),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      )),
                );
              },
            )));
  }
}
