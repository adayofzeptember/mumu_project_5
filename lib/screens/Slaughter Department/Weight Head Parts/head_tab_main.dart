// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Weight%20Head%20Parts/page1.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Weight%20Head%20Parts/page2.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Weight%20Head%20Parts/page3.dart';

class Head_tab extends StatefulWidget {
  const Head_tab({super.key});
  @override
  State<Head_tab> createState() => _Head_tabState();
}

class _Head_tabState extends State<Head_tab>
    with SingleTickerProviderStateMixin {
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
      statusBarIconBrightness: Brightness
          .dark, // Set status bar icons to dark (to be visible on white background)
    ));

    return Scaffold(
      backgroundColor: Palette.greyBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white, // Set background color to white
        // toolbarHeight: setHeight(context, 0.06),
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Palette.mainRed,
                size: setHeight(context, 0.03),
              ),
            ),
          ],
        ),
        centerTitle: true,

        title: Text(
          'น้ำหนักหัวหมู/เครื่องใน',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Container(
              height: setHeight(context, 0.05),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  50,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontSize: setFontSize(context, 0.03),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prompt',
                  ),
                  unselectedLabelColor: Palette.mainRed,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      color: Palette.mainRed),
                  tabs: const [
                    Tab(
                      text: 'รับไลน์เข้าเชือด',
                    ),
                    Tab(
                      text: 'ประวัติการชั่ง',
                    ),
                    Tab(
                      text: 'กระบวนการชำแหละ',
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Head_Page1(),
                Head_Page2(),
                Head_Page3(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
