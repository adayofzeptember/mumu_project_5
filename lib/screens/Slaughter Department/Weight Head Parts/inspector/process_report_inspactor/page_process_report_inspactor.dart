import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mumu_project/ETC/ButtonComponent.dart';
import 'package:mumu_project/ETC/FormSearch.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/alert_components/showEmployeeAndHour.dart';

class PageProcessReportInspactor extends StatefulWidget {
  const PageProcessReportInspactor({Key? key}) : super(key: key);

  @override
  _PageProcessReportInspactorState createState() => _PageProcessReportInspactorState();
}

class _PageProcessReportInspactorState extends State<PageProcessReportInspactor> {
  List<Map<String, dynamic>> mockData = [
    {
      'id': '1',
      'name': 'ไส้ตันใหญ่',
      'product_main': 'เครื่องในขาว',
      'clean': 'ผ่าน',
      'color': 'ปกติ',
      'smell': 'หอม',
      'foreign_objects': 'ไม่มี',
      'weight': '100',
      'remark': '-'
    },
  ];

  List<Map<String, dynamic>> filteredData = [];
  final List labelTable = [
    "ลำดับ",
    "สินค้า",
    "สินค้าหลัก",
    "ความสะอาด",
    "สี",
    "กลิ่น",
    "สิ่งแปลกปลอม",
    "น้ำหนักรวม(กก.)",
    "หมายเหตุ"
  ];

  @override
  void initState() {
    super.initState();
    filteredData = mockData;
  }

  void _filterData(String value) {
    setState(() {
      filteredData = mockData.where((item) {
        return item['name'].toLowerCase().contains(value.toLowerCase());
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
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "รายละเอียดการชั่ง Lot No.",
                              style: TextStyle(
                                fontSize: setFontSize(context, 0.03),
                                fontWeight: FontWeight.bold,
                                color: Palette.greyText,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                " 01122301",
                                style: TextStyle(
                                  fontSize: setFontSize(context, 0.03),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "เลขที่เครื่องชั่ง",
                              style: TextStyle(
                                fontSize: setFontSize(context, 0.03),
                                fontWeight: FontWeight.bold,
                                color: Palette.greyText,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                ": 22301122323",
                                style: TextStyle(
                                  fontSize: setFontSize(context, 0.03),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: setWidth(context, 0.35),
                    child: FormSearch(
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  horizontalMargin: 15,
                  headingRowColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return const Color(0xFFF5F5F5);
                    },
                  ),
                  dividerThickness: 0.8,
                  headingTextStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: setFontSize(context, 0.022),
                    fontWeight: FontWeight.bold,
                    color: Palette.greyText,
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
                          DataCell(Text(filteredData[i]['name'])),
                          DataCell(Text(filteredData[i]['product_main'])),
                          DataCell(Text(filteredData[i]['clean'])),
                          DataCell(Text(filteredData[i]['color'])),
                          DataCell(Text(filteredData[i]['smell'])),
                          DataCell(Text(filteredData[i]['foreign_objects'])),
                          DataCell(Text(filteredData[i]['weight'])),
                          DataCell(Text(filteredData[i]['remark'])),
                        ],
                      ),
                  ],
                ),
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
