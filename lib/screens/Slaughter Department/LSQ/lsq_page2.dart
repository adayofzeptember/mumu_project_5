import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/double_converter.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/bloc/Slaughter/LSQ/lsq_bloc.dart';

class LSQ_Page2 extends StatelessWidget {
  LSQ_Page2({super.key});
  @override
  Widget build(BuildContext context) {
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
                  child: BlocBuilder<LsqBloc, LsqState>(
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
                                      "รายละเอียดการชั่ง: "+state.balance_num,
                                      style: TextStyle(
                                          color: Palette.someGrey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: setFontSize(context, 0.025)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "หมายเลขเครื่องชั่ง: "+state.lsq_lot_num,
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
                                          contentPadding: EdgeInsets.symmetric(
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
                                    4: FlexColumnWidth(),
                                    5: FlexColumnWidth(),
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
                                          'น้ำหนักที่ช่าง',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                setFontSize(context, 0.025),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'BF3',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                setFontSize(context, 0.025),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'BF4',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                setFontSize(context, 0.025),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'b',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                setFontSize(context, 0.025),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          'ผล LSQ',
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

// Table Content
                            ListView.builder(
                              primary: true,
                              itemCount: state.lsq_history.length,
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
                                      4: FlexColumnWidth(),
                                      5: FlexColumnWidth(),
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
                                            state.lsq_history[index].order
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  setFontSize(context, 0.025),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            convertToDouble(state
                                                .lsq_history[index].weight),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  setFontSize(context, 0.025),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            convertToDouble(
                                                state.lsq_history[index].bf3),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  setFontSize(context, 0.025),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            convertToDouble(
                                                state.lsq_history[index].bf4),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  setFontSize(context, 0.025),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            convertToDouble(
                                                state.lsq_history[index].b),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  setFontSize(context, 0.025),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            convertToDouble(
                                                state.lsq_history[index].lsq),
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
