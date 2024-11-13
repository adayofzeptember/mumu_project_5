import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/FormSearch.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class PageReportDisbursement extends StatefulWidget {
  const PageReportDisbursement({Key? key}) : super(key: key);

  @override
  _PageReportDisbursementState createState() => _PageReportDisbursementState();
}

class _PageReportDisbursementState extends State<PageReportDisbursement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000), // สีเงาด้วยความโปร่งใส #0000001A
              offset: Offset(4, 4), // ระยะเงาในแนว x และ y
              blurRadius: 30.7, // ความเบลอของเงา
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "รายละเอียด ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: setHeight(context, 0.02),
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: setWidth(context, 0.4),
                  child: FormSearch(
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true, // แสดง scrollbar
                child: SingleChildScrollView(
                  primary: true,
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    primary: true,
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      horizontalMargin: 15,
                      headingRowColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          return const Color(0xFFF5F5F5);
                        },
                      ),
                      headingTextStyle: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: setFontSize(context, 0.022),
                        fontWeight: FontWeight.bold,
                        color: Palette.greyText,
                      ),
                      dataTextStyle: TextStyle(
                        fontSize: setFontSize(context, 0.021),
                        fontWeight: FontWeight.bold,
                      ),
                      dataRowHeight: setHeight(context, 0.05),
                      headingRowHeight: setHeight(context, 0.04),
                      columns: <DataColumn>[
                        for (var label in [
                          "ลำดับ",
                          "วันเวลาที่เบิก",
                          "ชื่อคลังสินค้า",
                          "รายการสินค้า",
                          "รับเข้า",
                          "จ่ายออก",
                          "ผู้ทำรายการ"
                        ])
                          DataColumn(
                            label: Expanded(
                              child: Text(label),
                            ),
                          ),
                      ],
                      rows: [
                        for (var i = 0; i < 52; i++)
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(i.toString())),
                              DataCell(Text("2021-09-01 12:00:00")),
                              DataCell(Text("คลังสินค้าหลัก")),
                              DataCell(Text("สินค้าทดสอบ")),
                              DataCell(Text("100")),
                              DataCell(Text("50")),
                              DataCell(Text("admin")),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
