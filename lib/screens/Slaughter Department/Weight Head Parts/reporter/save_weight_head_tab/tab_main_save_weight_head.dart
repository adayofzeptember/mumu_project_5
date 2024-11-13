import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/mediaQuery_set%202.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Weight%20Head%20Parts/reporter/save_weight_head_tab/page_donate.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Weight%20Head%20Parts/reporter/save_weight_head_tab/page_head_offal.dart';

class TabMainSaveWeightHead extends StatefulWidget {
  const TabMainSaveWeightHead({Key? key}) : super(key: key);

  @override
  _TabMainSaveWeightHeadState createState() => _TabMainSaveWeightHeadState();
}

class _TabMainSaveWeightHeadState extends State<TabMainSaveWeightHead> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 15),
          child: Text(
            "บันทึกชั่งน้ำหนักหัวหมู/เครื่องใน",
            style: TextStyle(fontSize: setFontSize(context, 0.035), fontWeight: FontWeight.bold, fontFamily: 'Prompt'),
          ),
        ),
        Divider(
          color: Colors.black.withOpacity(0.05),
          thickness: 2.5,
        ),
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
                    text: 'หัวหมู/เครื่องใน',
                  ),
                  Tab(
                    text: 'หมูบริจาค',
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
              PageHeadOffal(),
              PageDonate(),
            ],
          ),
        ),
      ],
    );
  }
}
