import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Import/import_page1.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Import/import_page2.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Import/import_page3.dart';

class Import_Tab extends StatefulWidget {
  const Import_Tab({super.key});
  @override
  State<Import_Tab> createState() => _Import_TabState();
}

class _Import_TabState extends State<Import_Tab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set the status bar color to white
      statusBarIconBrightness:
          Brightness.dark, // Use dark icons on a light status bar
    ));
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.greyBackground,
      appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.white, // Set background color to white

          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Palette.mainRed,
              size: setHeight(context, 0.03),
            ),
          ),
          centerTitle: true,
          title: Text(
            'บันทึกข้อมูลรับเข้า',
            style: TextStyle(
                color: Palette.mainRed,
                fontSize: 35,
                fontWeight: FontWeight.bold),
          )),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white, // Set status bar color to white
          statusBarIconBrightness:
              Brightness.dark, // Use dark icons for contrast
        ),
        child: Column(
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
                        text: 'ตรวจรับก่อนเชือด',
                      ),
                      Tab(
                        text: 'บันทึกการชั่งน้ำหนักสุกรรายตัว',
                      ),
                      Tab(
                        text: 'ประวัติการชั่ง',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [Import_Page1(), Import_Page2(), Import_Page3()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
