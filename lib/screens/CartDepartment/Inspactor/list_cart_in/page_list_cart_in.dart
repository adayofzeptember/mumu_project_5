import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/ETC/section_count.dart';
import 'package:mumu_project/screens/CartDepartment/Inspactor/list_cart_in/page_edit_cart_in.dart';
import 'package:page_transition/page_transition.dart';

class PageListCartIn extends StatefulWidget {
  const PageListCartIn({Key? key}) : super(key: key);

  @override
  State<PageListCartIn> createState() => _PageListCartInState();
}

class _PageListCartInState extends State<PageListCartIn> {
  List<Map<String, dynamic>> mockData = [
    {
      "id": "1",
      "dateSave": "2021-09-01 09:00:00",
      "origin": "ภายนอก",
      "sizeCart": "S",
      "clean": "true",
      "colorCart": "สีแดง",
      "countCart": "10",
      "broken": "10"
    },
    {
      "id": "2",
      "dateSave": "2021-09-01 09:00:00",
      "origin": "ภายนอก",
      "sizeCart": "M",
      "clean": "true",
      "colorCart": "สีแดง",
      "countCart": "10",
      "broken": "10"
    },
    {
      "id": "3",
      "dateSave": "2021-09-01 09:00:00",
      "origin": "ภายนอก",
      "sizeCart": "L",
      "clean": "true",
      "colorCart": "สีแดง",
      "countCart": "10",
      "broken": "9"
    },
    {
      "id": "4",
      "dateSave": "2021-09-01 09:00:00",
      "origin": "ภายนอก",
      "sizeCart": "XL",
      "clean": "false",
      "colorCart": "สีแดง",
      "countCart": "10",
      "broken": "8"
    },
    {
      "id": "5",
      "dateSave": "2021-09-01 09:00:00",
      "origin": "ภายนอก",
      "sizeCart": "XL",
      "clean": "false",
      "colorCart": "สีแดง",
      "countCart": "10",
      "broken": "7"
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

// ฟังก์ชันรีเฟซข้อมูล
  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2)); // จำลองการรีเฟซข้อมูล
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: setWidth(context, 0.45),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'ค้นหา',
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
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
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    duration: Duration(milliseconds: 500),
                                    type: PageTransitionType.rightToLeft,
                                    child: PageEditCartIn(
                                      getId: filteredData[i]['id'],
                                      getDateTime: filteredData[i]['dateSave'],
                                      getOrigin: filteredData[i]['origin'],
                                      getSize: filteredData[i]['sizeCart'],
                                      getColor: filteredData[i]['colorCart'],
                                      getCount: filteredData[i]['countCart'],
                                      getClean: filteredData[i]['clean'],
                                      getBroken: filteredData[i]['broken'],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: setWidth(context, 0.05),
                                width: setWidth(context, 0.05),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1890FF),
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
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: const Color(0xFF52C41A),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  String countEmployee = '0', countHour = '0';

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
                                onPressed: () {},
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
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(FontAwesomeIcons.circleCheck, size: 30, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  "พร้อมใช้งาน",
                  style: TextStyle(
                    fontSize: setFontSize(context, 0.04),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}