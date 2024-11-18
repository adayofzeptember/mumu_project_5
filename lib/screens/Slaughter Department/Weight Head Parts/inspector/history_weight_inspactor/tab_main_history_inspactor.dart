import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/FormSearch.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set%202.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Weight%20Head%20Parts/inspector/history_weight_inspactor/list_history_weight_head_inspactor/page_list_history_weight_head_inspactor.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Weight%20Head%20Parts/inspector/history_weight_inspactor/list_weight_donate_inspactor/page_list_weight_donate_inspactor.dart';

class TabMainHistoryInspactor extends StatefulWidget {
  const TabMainHistoryInspactor({Key? key}) : super(key: key);

  @override
  _TabMainHistoryInspactorState createState() => _TabMainHistoryInspactorState();
}

class _TabMainHistoryInspactorState extends State<TabMainHistoryInspactor> with SingleTickerProviderStateMixin {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "รายละเอียดการชั่ง Lot No.",
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.03),
                            fontWeight: FontWeight.bold,
                            color: Palette.greyText,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            " 01122301",
                            style: TextStyle(
                              fontSize: setFontSize(context, 0.03),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "เลขที่เครื่องชั่ง",
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.03),
                            fontWeight: FontWeight.bold,
                            color: Palette.greyText,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ": 22301122323",
                            style: TextStyle(
                              fontSize: setFontSize(context, 0.03),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: setWidth(context, 0.35),
                child: FormSearch(
                  onChanged: (value) {},
                ),
              ),
            ],
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
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                labelColor: Colors.white,
                labelStyle: TextStyle(
                  fontSize: setFontSize(context, 0.026),
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
                    text: 'รายการชั่งน้ำหนักหัวหมู/เครื่องใน',
                  ),
                  Tab(
                    text: 'รายการชั่งน้ำหนักหมูบริจาค',
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
              PageListHistoryWeightHeadInspactor(),
              PageListWeightDonateInspactor(),
            ],
          ),
        ),
      ],
    );
  }
}
