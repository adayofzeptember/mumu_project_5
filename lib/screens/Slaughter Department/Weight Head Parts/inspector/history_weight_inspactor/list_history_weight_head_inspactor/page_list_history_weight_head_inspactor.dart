import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mumu_project/ETC/ButtonComponent.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set%202.dart';
import 'package:mumu_project/alert_components/showEmployeeAndHour.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Weight%20Head%20Parts/inspector/history_weight_inspactor/list_history_weight_head_inspactor/page_edit_history_weight_head_inspactor.dart';
import 'package:page_transition/page_transition.dart';

class PageListHistoryWeightHeadInspactor extends StatefulWidget {
  const PageListHistoryWeightHeadInspactor({Key? key}) : super(key: key);

  @override
  _PageListHistoryWeightHeadInspactorState createState() => _PageListHistoryWeightHeadInspactorState();
}

class _PageListHistoryWeightHeadInspactorState extends State<PageListHistoryWeightHeadInspactor> {
  List<Map<String, dynamic>> mockData = [
    {"id": "1", "name": "สันคอ", "department": "หัว", "type": "เครื่องใน", "count": "4", "weight": "532.1", "action": "edit"},
    {"id": "2", "name": "สะโพก", "department": "หัว", "type": "เครื่องใน", "count": "3", "weight": "450.2", "action": "edit"},
    {"id": "3", "name": "ซี่โครง", "department": "หัว", "type": "เครื่องใน", "count": "5", "weight": "600.3", "action": "edit"},
    {"id": "4", "name": "ขาหลัง", "department": "หัว", "type": "เครื่องใน", "count": "2", "weight": "300.4", "action": "edit"},
    {"id": "5", "name": "ขาหน้า", "department": "หัว", "type": "เครื่องใน", "count": "4", "weight": "520.5", "action": "edit"},
    {"id": "6", "name": "ซี่โครง", "department": "หัว", "type": "เครื่องใน", "count": "6", "weight": "650.6", "action": "edit"},
    {"id": "7", "name": "สะโพก", "department": "หัว", "type": "เครื่องใน", "count": "3", "weight": "470.7", "action": "edit"},
  ];

  List<Map<String, dynamic>> filteredData = [];

  final List labelTable = ['ลำดับ', 'ชื่อสินค้า', 'รายการ', 'ประเภทสินค้า', 'จำนวนถุง(ชิ้น/ถุง)', 'น้ำหนักรวม(กก.)', 'จัดการข้อมูล'];

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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: DataTable(
                horizontalMargin: 15,
                headingRowColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
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
                        DataCell(Text(filteredData[i]['department'])),
                        DataCell(Text(filteredData[i]['type'])),
                        DataCell(Text(filteredData[i]['count'])),
                        DataCell(Text(filteredData[i]['weight'])),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: PageEditHistoryWeightHeadInspactor(),
                                ),
                              );
                            },
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
