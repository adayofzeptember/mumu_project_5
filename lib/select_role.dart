import 'package:flutter/material.dart';
import 'package:mumu_project/screens/CartDepartment/Inspactor/main_cart_inspacetor.dart';
import 'package:mumu_project/screens/CartDepartment/Reporter/main_cart_reporter.dart';
import 'package:mumu_project/screens/StockDepartment/main_stock_department.dart';
import 'package:page_transition/page_transition.dart';

class SelectRole extends StatelessWidget {
  const SelectRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Select Role'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const MainCartReporter(),
                      ),
                    );
                  },
                  child: const Text('แผนกตะกร้า (ผู้รายงาน)'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const MainCartInspacetor(),
                      ),
                    );
                  },
                  child: const Text('แผนกตะกร้า (ผู้ตรวจสอบ)'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: MainStockDepartment(),
                      ),
                    );
                  },
                  child: const Text('เมนูแผนกคลัง (ผู้รายงาน)'),
                ),
                // SizedBox(width: 20),
                // ElevatedButton(
                //   onPressed: null,
                //   child: Text('เมนูแผนกคลัง (ผู้ตรวจสอบ)'),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
