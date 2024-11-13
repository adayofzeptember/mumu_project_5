import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class PageListWeightHead extends StatefulWidget {
  @override
  State<PageListWeightHead> createState() => _PageListWeightHeadState();
}

class _PageListWeightHeadState extends State<PageListWeightHead> {
  List<Map<String, dynamic>> mockData = [
    {"id": "1", "name": "สันคอ", "department": "หัว", "type": "เครื่องใน", "count": "4", "weight": "532.1", "action": "edit"},
    {"id": "2", "name": "สะโพก", "department": "หัว", "type": "เครื่องใน", "count": "3", "weight": "450.2", "action": "edit"},
    {"id": "3", "name": "ซี่โครง", "department": "หัว", "type": "เครื่องใน", "count": "5", "weight": "600.3", "action": "edit"},
    {"id": "4", "name": "ขาหลัง", "department": "หัว", "type": "เครื่องใน", "count": "2", "weight": "300.4", "action": "edit"},
    {"id": "5", "name": "ขาหน้า", "department": "หัว", "type": "เครื่องใน", "count": "4", "weight": "520.5", "action": "edit"},
    {"id": "6", "name": "ซี่โครง", "department": "หัว", "type": "เครื่องใน", "count": "6", "weight": "650.6", "action": "edit"},
    {"id": "7", "name": "สะโพก", "department": "หัว", "type": "เครื่องใน", "count": "3", "weight": "470.7", "action": "edit"},
    {"id": "8", "name": "สันคอ", "department": "หัว", "type": "เครื่องใน", "count": "4", "weight": "530.8", "action": "edit"},
    {"id": "9", "name": "ขาหลัง", "department": "หัว", "type": "เครื่องใน", "count": "2", "weight": "310.9", "action": "edit"},
    {"id": "10", "name": "ขาหน้า", "department": "หัว", "type": "เครื่องใน", "count": "4", "weight": "540.0", "action": "edit"},
    {"id": "1", "name": "สันคอ", "department": "หัว", "type": "เครื่องใน", "count": "4", "weight": "532.1", "action": "edit"},
    {"id": "2", "name": "สะโพก", "department": "หัว", "type": "เครื่องใน", "count": "3", "weight": "450.2", "action": "edit"},
    {"id": "3", "name": "ซี่โครง", "department": "หัว", "type": "เครื่องใน", "count": "5", "weight": "600.3", "action": "edit"},
    {"id": "4", "name": "ขาหลัง", "department": "หัว", "type": "เครื่องใน", "count": "2", "weight": "300.4", "action": "edit"},
    {"id": "5", "name": "ขาหน้า", "department": "หัว", "type": "เครื่องใน", "count": "4", "weight": "520.5", "action": "edit"},
    {"id": "6", "name": "ซี่โครง", "department": "หัว", "type": "เครื่องใน", "count": "6", "weight": "650.6", "action": "edit"},
    {"id": "7", "name": "สะโพก", "department": "หัว", "type": "เครื่องใน", "count": "3", "weight": "470.7", "action": "edit"},
    {"id": "8", "name": "สันคอ", "department": "หัว", "type": "เครื่องใน", "count": "4", "weight": "530.8", "action": "edit"},
    {"id": "9", "name": "ขาหลัง", "department": "หัว", "type": "เครื่องใน", "count": "2", "weight": "310.9", "action": "edit"},
  ];

  List<Map<String, dynamic>> filteredData = [];

  final List labelTable = ['ลำดับ', 'ชื่อสินค้า', 'รายการ', 'ประเภทสินค้า', 'จำนวนถุง(ชิ้น/ถุง)', 'น้ำหนักรวม(กก.)', 'Action'];

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
                            onTap: () {},
                            child: Container(
                              height: setWidth(context, 0.05),
                              width: setWidth(context, 0.05),
                              decoration: BoxDecoration(
                                color: Palette.warning,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                FontAwesomeIcons.solidPenToSquare,
                                color: Colors.black,
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
    );
  }
}
