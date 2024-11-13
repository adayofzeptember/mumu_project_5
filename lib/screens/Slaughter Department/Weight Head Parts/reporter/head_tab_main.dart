// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Weight%20Head%20Parts/reporter/history_weight/tab_main_history_weight.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Weight%20Head%20Parts/reporter/process_report/page_process_report.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Weight%20Head%20Parts/reporter/save_weight_head_tab/tab_main_save_weight_head.dart';
import 'package:mumu_project/screens/Trim%20Department/main_trim.dart';

class Head_tab extends StatefulWidget {
  const Head_tab({super.key});
  @override
  State<Head_tab> createState() => _Head_tabState();
}

class _Head_tabState extends State<Head_tab> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set the status bar color to white
      statusBarIconBrightness: Brightness.dark, // Set status bar icons to dark (to be visible on white background)
    ));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white, // Set background color to white
        toolbarHeight: setHeight(context, 0.06),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to the right
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Palette.mainRed,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.house,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "บันทึกน้ำหนักหัวหมู/เครื่องใน ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                // Spacing between avatar and text
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'รจเรข พินสายออ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'แผนกเชือด', // User's role or position
                      style: TextStyle(
                        color: Palette.someGrey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                const CircleAvatar(
                  maxRadius: 30,
                  backgroundColor: Color.fromARGB(255, 54, 28, 32),
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    logoutAlert(context);
                  },
                  icon: const Icon(Icons.logout, color: Colors.black),
                  label: const Text(
                    'ออกจากระบบ', // Logout text
                    style: TextStyle(color: Color.fromARGB(255, 38, 38, 38), fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color.fromARGB(255, 23, 23, 23), width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
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
                    child: const Text("บันทึกน้ำหนักหัวหมู/เครื่องใน"),
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
                    child: const Text("ประวัติการชั่ง"),
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
                    child: const Text("รายงานกระบวนการชำแหละ"),
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
                  TabMainSaveWeightHead(),
                  TabMainHistoryWeight(),
                  PageProcessReport(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
