import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class PageListWeightDonate extends StatefulWidget {
  const PageListWeightDonate({Key? key}) : super(key: key);

  @override
  _PageListWeightDonateState createState() => _PageListWeightDonateState();
}

class _PageListWeightDonateState extends State<PageListWeightDonate> {
  List<Map<String, dynamic>> mockData = [
    {
      "id": "1",
      "lot_no": "0001",
      "machine_no": "0001",
      "type": "หมูท้อง",
      "weight": "130.32",
      "action": "edit",
    },
  ];

  List<Map<String, dynamic>> filteredData = [];

  final List labelTable = ['#', 'Lot No.', 'เลขที่เครื่องชั่ง', 'ลักษณะสุกร', 'น้ำหนักที่ชั่ง', 'จัดการข้อมูล'];

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
                        DataCell(Text(filteredData[i]['lot_no'])),
                        DataCell(Text(filteredData[i]['machine_no'])),
                        DataCell(Text(filteredData[i]['type'])),
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
