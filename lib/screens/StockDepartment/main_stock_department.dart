import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/appbar_component.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/screens/StockDepartment/Disbursement/tab_disbursement.dart';
import 'package:mumu_project/screens/StockDepartment/Management_shipping/tab_manage_shipping.dart';
import 'package:mumu_project/screens/StockDepartment/Receive_return/page_receive_return.dart';
import 'package:mumu_project/screens/StockDepartment/Report_stock/page_report_stock.dart';
import 'package:page_transition/page_transition.dart';

class MainStockDepartment extends StatelessWidget {
  MainStockDepartment({Key? key}) : super(key: key);
  final List menu = [
    {
      "image": "assets/images/box-check.png",
      "value": "เบิกจ่ายสินค้า",
      "color": [
        const Color(0xFF305300),
        const Color(0xFF638525),
      ],
      "navigate": TabDisbursement(),
    },
    {
      "image": "assets/images/chart-mixed.png",
      "value": "รายงานคลังสินค้า",
      "color": [
        const Color(0xFF0156A4),
        const Color(0xFF017CD1),
      ],
      "navigate": PageReportStock(),
    },
    {
      "image": "assets/images/truck.png",
      "value": "การจัดการใบสั่งขาย\nและการขนส่ง",
      "color": [
        const Color(0xFFB03F23),
        const Color(0xFFEE8D1B),
      ],
      "navigate": TabManageShipping(),
    },
    {
      "image": "assets/images/hand-holding-box.png",
      "value": "การรับคืนสินค้า",
      "color": [
        const Color(0xFF3E0B7C),
        const Color(0xFF892EAA),
      ],
      "navigate": PageReceiveReturn(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white, // Set background color to white
          toolbarHeight: setHeight(context, 0.06),
          title: const AppBarNameLastNameRoleAndLogout()),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(50, 100, 50, 0),
            padding: const EdgeInsets.all(40),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text(
                  'แผนกคลัง',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: setHeight(context, 0.05),
                    color: Palette.mainRed,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: setHeight(context, 0.5),
                  child: GridView.builder(
                    itemCount: 4, // จำนวนไอเทมในกริด
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // กำหนดจำนวนคอลัมน์เป็น 2
                      crossAxisSpacing: 18, // ระยะห่างระหว่างคอลัมน์
                      mainAxisSpacing: 18, // ระยะห่างระหว่างแถว
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: menu[index]['navigate'],
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                menu[index]['color'][0],
                                menu[index]['color'][1],
                              ],
                              stops: const [0.0, 0.98],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "${menu[index]['image']}",
                                height: setHeight(context, 0.08),
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "${menu[index]['value']}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: setFontSize(context, 0.034),
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
