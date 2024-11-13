import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mumu_project/ETC/appbar_component.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/screens/StockDepartment/Management_shipping/page_all_order_customer.dart';
import 'package:mumu_project/screens/StockDepartment/Management_shipping/page_manage_order.dart';
import 'package:mumu_project/screens/StockDepartment/Management_shipping/page_summary_order.dart';

class TabManageShipping extends StatefulWidget {
  const TabManageShipping({Key? key}) : super(key: key);

  @override
  _TabManageShippingState createState() => _TabManageShippingState();
}

class _TabManageShippingState extends State<TabManageShipping> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String role = 'report';
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
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
                fontSize: setFontSize(context, 0.02),
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
                  height: setHeight(context, 0.08),
                  child: Container(
                    alignment: Alignment.center,
                    height: setHeight(context, 0.08),
                    width: setWidth(context, 0.3),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Palette.mainRed,
                        width: 2.0,
                      ),
                    ),
                    child: const Text("จัดออเดอร์ลูกค้า"),
                  ),
                ),
                Tab(
                  height: setHeight(context, 0.08),
                  child: Container(
                    alignment: Alignment.center,
                    height: setHeight(context, 0.08),
                    width: setWidth(context, 0.3),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Palette.mainRed,
                        width: 2.0,
                      ),
                    ),
                    child: const Text("ออเดอร์ลูกค้าทั้งหมด"),
                  ),
                ),
                Tab(
                  height: setHeight(context, 0.08),
                  child: Container(
                    alignment: Alignment.center,
                    height: setHeight(context, 0.08),
                    width: setWidth(context, 0.3),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Palette.mainRed,
                        width: 2.0,
                      ),
                    ),
                    child: const Text("สรุปการจัดออเดอร์"),
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
                PageManageOrder(),
                PageAllOrderCustomer(),
                PageSummaryOrder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
