import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mumu_project/ETC/ButtonComponent.dart';
import 'package:mumu_project/ETC/FormSearch.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/alert_components/showEmployeeAndHour.dart';
import 'package:mumu_project/screens/CartDepartment/inspector/list_internal_use/page_edit_internal_use.dart';
import 'package:page_transition/page_transition.dart';

class PageListInternalUse extends StatefulWidget {
  const PageListInternalUse({Key? key}) : super(key: key);

  @override
  _PageListInternalUseState createState() => _PageListInternalUseState();
}

class _PageListInternalUseState extends State<PageListInternalUse> {
  List<Map<String, dynamic>> mockData = [
    {
      "id": 1,
      "dateSave": "2021-09-01 09:00:00",
      "department": "แผนก A",
      "count": 10,
      "note": "หมายเหตุ 1",
    },
    {
      "id": 2,
      "dateSave": "2021-09-02 09:00:00",
      "department": "แผนก B",
      "count": 20,
      "note": "หมายเหตุ 2",
    },
    {
      "id": 3,
      "dateSave": "2021-09-03 09:00:00",
      "department": "แผนก C",
      "count": 30,
      "note": "หมายเหตุ 3",
    },
    {
      "id": 4,
      "dateSave": "2021-09-04 09:00:00",
      "department": "แผนก D",
      "count": 40,
      "note": "หมายเหตุ 4",
    },
    {
      "id": 5,
      "dateSave": "2021-09-05 09:00:00",
      "department": "แผนก E",
      "count": 50,
      "note": "หมายเหตุ 5",
    },
  ];

  List<Map<String, dynamic>> filteredData = [];
  final List labelTable = ['ลำดับ', 'วันเวลาที่บันทึก', 'แผนก', 'จำนวน(แลก)', 'หมายเหตุ', ''];

  @override
  void initState() {
    super.initState();
    filteredData = mockData;
  }

  void _filterData(String value) {
    setState(() {
      filteredData = mockData.where((item) {
        return item['dateSave'].contains(value) ||
            item['origin'].contains(value) ||
            item['sizeCart'].contains(value) ||
            item['colorCart'].contains(value) ||
            item['countCart'].toString().contains(value);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: setWidth(context, 0.45),
                  child: FormSearch(
                    onChanged: (value) => _filterData(value),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: DataTable(
                horizontalMargin: 15,
                headingRowColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    return const Color(0xFFECF6FF);
                  },
                ),
                dividerThickness: 0.8,
                headingTextStyle: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: setFontSize(context, 0.022),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF757575),
                ),
                dataTextStyle: TextStyle(fontSize: setFontSize(context, 0.021), fontWeight: FontWeight.bold),
                columnSpacing: 18,
                dataRowHeight: setHeight(context, 0.05),
                headingRowHeight: setHeight(context, 0.04),
                columns: <DataColumn>[
                  for (var label in labelTable)
                    DataColumn(
                      label: Expanded(
                        child: Text(label),
                      ),
                    ),
                ],
                rows: [
                  for (var i = 0; i < filteredData.length; i++)
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text((i + 1).toString())),
                        DataCell(Text(filteredData[i]['dateSave'])),
                        DataCell(Text(filteredData[i]['department'])),
                        DataCell(Text(filteredData[i]['count'].toString())),
                        DataCell(Text(filteredData[i]['note'])),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  duration: Duration(milliseconds: 500),
                                  type: PageTransitionType.rightToLeft,
                                  child: PageEditInternalUse(
                                    getId: filteredData[i]['id'].toString(),
                                    getDateTime: filteredData[i]['dateSave'],
                                    getDepartment: filteredData[i]['department'],
                                    getGetIn: filteredData[i]['count'].toString(),
                                    getNote: filteredData[i]['note'],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: setWidth(context, 0.05),
                              width: setWidth(context, 0.05),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF4D4F),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: setWidth(context, 0.05),
                                width: setWidth(context, 0.05),
                                decoration: BoxDecoration(
                                  color: Palette.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.solidPenToSquare,
                                  color: Colors.white,
                                  size: setWidth(context, 0.03),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
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
          child: ButtonComponent(
            icon: const Icon(FontAwesomeIcons.circleCheck, size: 25, color: Colors.white),
            title: "ยืนยันข้อมูล",
            bg: const Color(0xFF52C41A),
            onPressed: () {
              showEmployeeAndHourModal(
                context,
                onConfirm: (countEmployee, countHour) {
                  // ทำสิ่งที่ต้องการหลังจากได้ค่าจำนวนพนักงานและชั่วโมงการทำงาน
                  print('จำนวนพนักงาน: $countEmployee, ชั่วโมงการทำงาน: $countHour');
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
