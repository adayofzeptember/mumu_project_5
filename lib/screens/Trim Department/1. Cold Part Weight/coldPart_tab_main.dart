import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/screens/Trim%20Department/1.%20Cold%20Part%20Weight/page1.dart';
import 'package:mumu_project/screens/Trim%20Department/1.%20Cold%20Part%20Weight/page2.dart';

 
class ColdParts_Tab extends StatefulWidget {
  const ColdParts_Tab({super.key});
  @override
  State<ColdParts_Tab> createState() => _ColdParts_TabState();
}

class _ColdParts_TabState extends State<ColdParts_Tab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set the status bar color to white
      statusBarIconBrightness:
          Brightness.dark, // Use dark icons on a light status bar
    ));
    _tabController = TabController(length: 2, vsync: this);
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
            'บันทึกข้อมูลชั่งน้ำหนักซีกเย็น',
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
                        text: 'น้ำหนักซีกเย็น',
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
                children: [ColdParts_Page1(), ColdParts_Page2() ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
