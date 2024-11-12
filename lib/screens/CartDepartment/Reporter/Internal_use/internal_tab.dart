import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/screens/CartDepartment/Reporter/Internal_use/page_report_internal_use.dart';
import 'package:mumu_project/screens/CartDepartment/Reporter/Internal_use/page_save_internal_use.dart';

class InternalTab extends StatefulWidget {
  const InternalTab({Key? key}) : super(key: key);

  @override
  _InternalTabState createState() => _InternalTabState();
}

class _InternalTabState extends State<InternalTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
          child: Container(
            height: setHeight(context, 0.05),
            decoration: BoxDecoration(
              color: const Color(0xFFE7EBEF),
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
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF8D1F22),
                      Color(0xFF5D1416),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                tabs: const [
                  Tab(
                    text: 'บันทึกการใช้งานภายใน',
                  ),
                  Tab(
                    text: 'รายงานการใช้งานภายใน',
                  ),
                ],
              ),
            ),
          ),
        ),
        // const SizedBox(height: 30),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              PageSaveInternalUse(),
              PageReportInternalUse(),
            ],
          ),
        ),
      ],
    );
  }
}
