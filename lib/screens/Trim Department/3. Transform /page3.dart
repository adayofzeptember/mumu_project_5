// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/bloc/Slaughter/Import/import_bloc.dart';

class Transform_Page3 extends StatefulWidget {
  const Transform_Page3({super.key});

  @override
  State<Transform_Page3> createState() => _Transform_Page3State();
}

class _Transform_Page3State extends State<Transform_Page3> {
  @override
  void initState() {
    context.read<ImportBloc>().add(Weight_HistoryUI2_4());
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "รายละเอียดการชั่ง Lot No.: ",
                                  style: TextStyle(
                                      color: Palette.someGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: setFontSize(context, 0.03)),
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
                                      fontSize: setFontSize(context, 0.025)),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            8), // Rounded corners
                                        borderSide: BorderSide(
                                          color: Colors
                                              .grey.shade400, // Border color
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
                          color: const Color.fromARGB(255, 201, 201, 201),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ลำดับ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: setFontSize(context, 0.025)),
                                ),
                                Text(
                                  'น้ำหนักที่ช่าง',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: setFontSize(context, 0.025)),
                                ),
                                Text(
                                  'ประเภถทซีก',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: setFontSize(context, 0.025)),
                                ),
                                Text(
                                  'ที่มา',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: setFontSize(context, 0.025)),
                                ),
                                Text(
                                  'Action',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: setFontSize(context, 0.025)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ])),
            )));
  }
}
