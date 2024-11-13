import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/appbar_component.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/screens/CartDepartment/Reporter/Internal_use/internal_tab.dart';
import 'package:mumu_project/screens/CartDepartment/Reporter/cart_in/cart_tab.dart';
import 'package:mumu_project/screens/CartDepartment/Reporter/report_cart_all/page_report_cart_all.dart';

class MainCartReporter extends StatefulWidget {
  const MainCartReporter({Key? key}) : super(key: key);
  @override
  State<MainCartReporter> createState() => _MainCartReporterState();
}

class _MainCartReporterState extends State<MainCartReporter> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Palette.greyBackground,
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
              title: "รับตะกร้าเข้า",
            ),
            AppBarNameLastNameRoleAndLogout(),
          ],
        ),
      ),

      backgroundColor: const Color(0xFFE7EBEF),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            decoration: const BoxDecoration(
              color: Color(0xFFE7EBEF),
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
                    width: setWidth(context, 0.3),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Palette.mainRed,
                        width: 2.0,
                      ),
                    ),
                    child: const Text("รับตะกร้าเข้า"),
                  ),
                ),
                Tab(
                  height: setHeight(context, 0.05),
                  child: Container(
                    alignment: Alignment.center,
                    height: setHeight(context, 0.05),
                    width: setWidth(context, 0.3),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Palette.mainRed,
                        width: 2.0,
                      ),
                    ),
                    child: const Text("การใช้งานภายใน"),
                  ),
                ),
                Tab(
                  height: setHeight(context, 0.05),
                  child: Container(
                    alignment: Alignment.center,
                    height: setHeight(context, 0.05),
                    width: setWidth(context, 0.3),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Palette.mainRed,
                        width: 2.0,
                      ),
                    ),
                    child: const Text("รายงานตะกร้าทั้งหมด"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    CartTab(),
                    InternalTab(),
                    PageReportCartAll(),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
