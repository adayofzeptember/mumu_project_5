import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/screens/StockDepartment/Management_shipping/page_all_order_customer.dart';

class PageSummaryOrder extends StatefulWidget {
  const PageSummaryOrder({Key? key}) : super(key: key);

  @override
  _PageSummaryOrderState createState() => _PageSummaryOrderState();
}

class _PageSummaryOrderState extends State<PageSummaryOrder> {
  List<String> cus = ["1", "2", "3", "4", "5"];
  String? selectCus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7EBEF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: setWidth(context, 0.25),
                    child: FormDropdown(
                      onChanged: (val) {
                        setState(() {
                          selectCus = val;
                        });
                      },
                      hintText: selectCus ?? "เลือกลูกค้า",
                      value: selectCus,
                      items: cus,
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: setWidth(context, 0.25),
                    child: TextField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'ค้นหา',
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      // onChanged: (value) => _filterData(value),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "สรุปออเดอร์สินค้า ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setHeight(context, 0.02),
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                            Text(
                              "18 ก.ค. 67",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setHeight(context, 0.02),
                                color: const Color(0xFF1890FF),
                                // overflow: TextOverflow.visible,
                              ),
                              // maxLines: 2,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: setWidth(context, 0.9),
                          height: setHeight(context, 0.4),
                          child: SingleChildScrollView(
                            child: Scrollbar(
                              child: DataTable(
                                showCheckboxColumn: false,
                                horizontalMargin: 20,
                                headingRowColor: WidgetStateProperty.resolveWith<Color>(
                                  (Set<WidgetState> states) {
                                    return const Color(0xFFFAFAFA);
                                  },
                                ),
                                dividerThickness: 0.8,
                                headingTextStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: setFontSize(context, 0.014),
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF637D92),
                                ),
                                dataTextStyle: TextStyle(fontSize: setFontSize(context, 0.013), fontWeight: FontWeight.bold),
                                // columnSpacing: 50,
                                dataRowHeight: setHeight(context, 0.07),
                                headingRowHeight: setHeight(context, 0.05),
                                columns: <DataColumn>[
                                  for (var label in [
                                    "#",
                                    "เลขที่ใบสั่งขาย",
                                    "ชื่อลูกค้า",
                                    "รายการออเดอร์",
                                    "น้ำหนักรวม(กก.)",
                                    "จำนวนถุง"
                                  ])
                                    DataColumn(
                                      label: Expanded(
                                        child: Text(label),
                                      ),
                                    ),
                                ],
                                rows: [
                                  for (var i = 0; i < 40; i++)
                                    DataRow(
                                      cells: [
                                        DataCell(Text(i.toString())),
                                        DataCell(Text("123456789")),
                                        DataCell(Text("นาย สมชาย ใจดี")),
                                        DataCell(Text("เสื้อยืด สีขาว")),
                                        DataCell(Text("5.00")),
                                        DataCell(Text("2")),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
