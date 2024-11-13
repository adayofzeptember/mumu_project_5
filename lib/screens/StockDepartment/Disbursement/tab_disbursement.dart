import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/appbar_component.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/screens/StockDepartment/Disbursement/reportor/inside/page_report_disbursement.dart';
import 'package:mumu_project/screens/StockDepartment/Disbursement/reportor/inside/page_save_disbursement_inside.dart';

class TabDisbursement extends StatefulWidget {
  const TabDisbursement({Key? key}) : super(key: key);

  @override
  _TabDisbursementState createState() => _TabDisbursementState();
}

class _TabDisbursementState extends State<TabDisbursement> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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
              title: "เบิกจ่ายสินค้า",
            ),
            AppBarNameLastNameRoleAndLogout(),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF7F7F7),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            decoration: const BoxDecoration(
              color: Color(0xFFF7F7F7),
            ),
            child: TabBar(
              unselectedLabelColor: Palette.mainRed,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Palette.mainRed,
              ),
              labelStyle: TextStyle(
                fontSize: setFontSize(context, 0.025),
                fontWeight: FontWeight.bold,
                fontFamily: 'Prompt',
              ),
              dividerColor: Palette.mainRed,
              labelColor: Colors.white,
              controller: _tabController,
              onTap: (value) {
                setState(() {});
              },
              tabs: <Widget>[
                Tab(
                  height: setHeight(context, 0.05),
                  child: Container(
                    alignment: Alignment.center,
                    height: setHeight(context, 0.05),
                    width: setWidth(context, 0.5),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Palette.mainRed,
                        width: 2.0,
                      ),
                    ),
                    child: const Text("บันทึกการเบิกจ่ายสินค้า"),
                  ),
                ),
                Tab(
                  height: setHeight(context, 0.05),
                  child: Container(
                    alignment: Alignment.center,
                    height: setHeight(context, 0.05),
                    width: setWidth(context, 0.5),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Palette.mainRed,
                        width: 2.0,
                      ),
                    ),
                    child: const Text("รายงานการเบิกจ่ายสินค้า"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                PageSaveDisbursementInside(),
                PageReportDisbursement(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
