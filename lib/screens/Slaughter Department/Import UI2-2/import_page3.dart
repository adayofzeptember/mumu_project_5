// ignore_for_file: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/bloc/Slaughter/Import/import_bloc.dart';

class Import_Page3 extends StatefulWidget {
  const Import_Page3({super.key});

  @override
  State<Import_Page3> createState() => _Import_Page3State();
}

class _Import_Page3State extends State<Import_Page3> {
  @override
  void initState() {
    super.initState();
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
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "รายละเอียดการชั่ง: "+state.lsq_lot_num.toString(),
                                      style: TextStyle(
                                          color: Palette.someGrey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: setFontSize(context, 0.025)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "หมายเลขเครื่องชั่ง: "+state.balance_num.toString(),
                                      style: TextStyle(
                                          color: Palette.someGrey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: setFontSize(context, 0.025)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "ค้นหา: ",
                                      style: TextStyle(
                                          color: Palette.mainRed,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              setFontSize(context, 0.025)),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: TextFormField(
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
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: setHeight(context, 0.02),
                            ),
                            Container(
                              color: Color.fromARGB(255, 201, 201, 201),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Table(
                                  columnWidths: const {
                                    0: FlexColumnWidth(),
                                    1: FlexColumnWidth(),
                                    2: FlexColumnWidth(),
                                    3: FlexColumnWidth(),
                                  
                                  },
                                  children: [
                                    TableRow(
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 201, 201, 201),
                                      ),
                                      children: [
                                        Text(
                                          'ลำดับ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                setFontSize(context, 0.025),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'น้ำหนักที่ชั่ง',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                setFontSize(context, 0.025),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                     
                                        Text(
                                          'ลักษณะสุกร',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                setFontSize(context, 0.025),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'ประเภทการชั่ง',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                setFontSize(context, 0.025),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ListView.builder(
                              primary: true,
                              itemCount: state.weight_history_list.length,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Table(
                                    columnWidths: const {
                                      0: FlexColumnWidth(),
                                      1: FlexColumnWidth(),
                                      2: FlexColumnWidth(),
                                      3: FlexColumnWidth(),
                                      
                                    },
                                    children: [
                                      TableRow(
                                        decoration: BoxDecoration(
                                          color: index % 2 == 0
                                              ? Colors.grey.shade100
                                              : Colors.white,
                                        ),
                                        children: [
                                          Text(
                                            state.weight_history_list[index]
                                                .order
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  setFontSize(context, 0.025),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            state.weight_history_list[index]
                                                .weight,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  setFontSize(context, 0.025),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                         
                                          Text(
                                            state.weight_history_list[index]
                                                .pig_type,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  setFontSize(context, 0.025),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            state.weight_history_list[index]
                                                .weight_type,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  setFontSize(context, 0.025),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          ]);
                    },
                  )),
            )));
  }
}
