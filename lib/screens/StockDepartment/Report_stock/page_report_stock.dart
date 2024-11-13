import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/FormSearch.dart';
import 'package:mumu_project/ETC/appbar_component.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class PageReportStock extends StatefulWidget {
  const PageReportStock({Key? key}) : super(key: key);

  @override
  _PageReportStockState createState() => _PageReportStockState();
}

class _PageReportStockState extends State<PageReportStock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white, // Set background color to white
        toolbarHeight: setHeight(context, 0.06),
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to the right
          children: [
            AppBarHomeMenu(
              title: "รายงานคลังสินค้า",
            ),
            AppBarNameLastNameRoleAndLogout(),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF7F7F7),
      body: Container(
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.all(30),
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
                  "รายงานคลังสินค้า ",
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
              child: SingleChildScrollView(
                child: DataTable(
                  horizontalMargin: 15,
                  headingRowColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      return const Color(0xFFECF6FF);
                    },
                  ),
                  // dividerThickness: 0.8,
                  headingTextStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: setFontSize(context, 0.022),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF757575),
                  ),
                  dataTextStyle: TextStyle(fontSize: setFontSize(context, 0.021), fontWeight: FontWeight.bold),
                  // columnSpacing: 18,
                  dataRowHeight: setHeight(context, 0.05),
                  headingRowHeight: setHeight(context, 0.04),
                  columns: <DataColumn>[
                    for (var label in ["ลำดับ", "ชื่อคลังสินค้า", "ชื่อสินค้า", "ยอดคงเหลือ(กก.)", "จำนวนถุง(ชิ้น)"])
                      DataColumn(
                        label: Expanded(
                          child: Text(label),
                        ),
                      ),
                  ],
                  rows: [
                    for (var i = 0; i < 31; i++)
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text((i + 1).toString())),
                          DataCell(Text("คลังสินค้า 1")),
                          DataCell(Text("สินค้า 1")),
                          DataCell(Text("100")),
                          DataCell(Text("10")),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
