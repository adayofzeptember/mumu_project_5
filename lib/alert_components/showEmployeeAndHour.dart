import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/mediaQuery_set%202.dart';
import 'package:mumu_project/ETC/section_count.dart';

void showEmployeeAndHourModal(BuildContext context, {required Function(String, String) onConfirm}) {
  String countEmployee = '0';
  String countHour = '0';

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: setHeight(context, 0.5),
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "จำนวนพนักงานและเวลาการทำงาน",
                      style: TextStyle(
                        fontSize: setFontSize(context, 0.04),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 45),
                    SizedBox(
                      width: setWidth(context, 0.6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "จำนวนพนักงาน (คน)",
                            style: TextStyle(
                              fontSize: setFontSize(context, 0.03),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SectionCount(
                            countText: countEmployee,
                            onRemove: () {
                              setState(() {
                                print("object");
                                countEmployee = (int.parse(countEmployee) - 1).toString();
                              });
                            },
                            onAdd: () {
                              setState(() {
                                countEmployee = (int.parse(countEmployee) + 1).toString();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 45),
                    SizedBox(
                      width: setWidth(context, 0.6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "เวลาการทำงาน (ชั่วโมง)",
                            style: TextStyle(
                              fontSize: setFontSize(context, 0.03),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SectionCount(
                            countText: countHour,
                            onRemove: () {
                              setState(() {
                                countHour = (int.parse(countHour) - 1).toString();
                              });
                            },
                            onAdd: () {
                              setState(() {
                                countHour = (int.parse(countHour) + 1).toString();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: const Color(0xFF52C41A),
                    ),
                    onPressed: () {
                      onConfirm(countEmployee, countHour); // ส่งค่ากลับเมื่อกดตกลง
                      Navigator.pop(context);
                    },
                    child: Text(
                      "ตกลง",
                      style: TextStyle(
                        fontSize: setFontSize(context, 0.04),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
