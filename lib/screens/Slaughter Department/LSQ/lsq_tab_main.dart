import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/screens/Slaughter%20Department/LSQ/lsq_page1.dart';
import 'package:mumu_project/screens/Slaughter%20Department/LSQ/lsq_page2.dart';
import 'package:mumu_project/screens/Slaughter%20Department/LSQ/lsq_page3.dart';

class LSQ_Tab extends StatefulWidget {
  const LSQ_Tab({super.key});
  @override
  State<LSQ_Tab> createState() => _LSQ_TabState();
}

class _LSQ_TabState extends State<LSQ_Tab> with SingleTickerProviderStateMixin {
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
          'ซีกร้อนและLSQ',
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
                      borderRadius: BorderRadius.circular(50),
                      color: Palette.mainRed),
                  tabs: const [
                    Tab(
                      text: 'บันทึกซีกร้อน/LSQ',
                    ),
                    Tab(
                      text: 'ประวัติการชั่ง',
                    ),
                    Tab(
                      text: 'รายงานตรวจซาก',
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
                LSQ_Page1(),
                LSQ_Page2(),
                LSQ_Page3()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
