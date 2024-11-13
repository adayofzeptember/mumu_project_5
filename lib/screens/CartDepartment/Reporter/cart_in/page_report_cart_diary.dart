import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/FormSearch.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class PageReportCartDiary extends StatefulWidget {
  PageReportCartDiary({Key? key}) : super(key: key);

  @override
  State<PageReportCartDiary> createState() => _PageReportCartDiaryState();
}

class _PageReportCartDiaryState extends State<PageReportCartDiary> {
  List<Map<String, dynamic>> mockData = [
    {
      "id": 1,
      "dateSave": "2021-09-01 09:00:00",
      "origin": "ภายนอก",
      "sizeCart": "S",
      "colorCart": "สีขาว",
      "countCart": 10,
    },
    {
      "id": 2,
      "dateSave": "2021-09-01 09:00:00",
      "origin": "ภายนอก",
      "sizeCart": "M",
      "colorCart": "สีขาว",
      "countCart": 10,
    },
    {
      "id": 3,
      "dateSave": "2021-09-01 09:00:00",
      "origin": "ภายนอก",
      "sizeCart": "L",
      "colorCart": "สีขาว",
      "countCart": 10,
    },
    {
      "id": 4,
      "dateSave": "2021-09-01 09:00:00",
      "origin": "ภายนอก",
      "sizeCart": "XL",
      "colorCart": "สีขาว",
      "countCart": 10,
    },
    {
      "id": 5,
      "dateSave": "2021-09-01 09:00:00",
      "origin": "ภายนอก",
      "sizeCart": "XXL",
      "colorCart": "สีขาว",
      "countCart": 10,
    },
  ];

  List<Map<String, dynamic>> filteredData = [];
  final List labelTable = ['ลำดับ', 'วันเวลาที่บันทึก', 'ที่มา', 'ขนาดตะกร้า', 'สีตะกร้า', 'จำนวน(ใบ)', ''];

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
                        DataCell(Text(filteredData[i]['origin'])),
                        DataCell(Text(filteredData[i]['sizeCart'])),
                        DataCell(Text(filteredData[i]['colorCart'])),
                        DataCell(Text(filteredData[i]['countCart'].toString())),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              print('Edit');
                              print("dateSave: ${filteredData[i]['dateSave']}");
                              print("origin: ${filteredData[i]['origin']}");
                              print("sizeCart: ${filteredData[i]['sizeCart']}");
                              print("colorCart: ${filteredData[i]['colorCart']}");
                              print("countCart: ${filteredData[i]['countCart']}");
                            },
                            child: Container(
                              height: setWidth(context, 0.05),
                              width: setWidth(context, 0.05),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF4D4F),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const ImageIcon(
                                AssetImage('assets/images/pen-line.png'),
                                color: Colors.white,
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
