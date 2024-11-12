import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
 import 'package:mumu_project/screens/Slaughter%20Department/LSQ/lsq_tab_main.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Slaughter%20Line/slaughter_tab_main.dart';
import 'package:mumu_project/screens/Trim%20Department/1.%20Cold%20Part%20Weight/coldPart_tab_main.dart';
import 'package:mumu_project/screens/Trim%20Department/2.%20Trim%20Weight/coldPart_tab_main.dart';
import 'package:mumu_project/screens/Trim%20Department/3.%20Transform%20/transform_tab_main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Main_Trim extends StatefulWidget {
  const Main_Trim({super.key});
  @override
  State<Main_Trim> createState() => _Main_TrimState();
}

class _Main_TrimState extends State<Main_Trim> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set the status bar color to white
      statusBarIconBrightness: Brightness
          .dark, // Set status bar icons to dark (to be visible on white background)
    ));

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 129, 21, 38),
      appBar: AppBar(
        backgroundColor: Colors.white, // Set background color to white
        toolbarHeight: setHeight(context, 0.07),

        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Align items to the right
          children: [
            Row(
              children: [
                CircleAvatar(
                  maxRadius: 20,
                  // backgroundImage: const AssetImage(
                  //     'assets/images/1.png'),
                  child: Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.white,
                  ),
                  backgroundColor: Palette.mainRed,
                ),
                SizedBox(
                  width: 15,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'รจเรข พินสายออ',
                          style: TextStyle(
                            color: Palette.mainRed,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.wysiwyg,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'แผนกตัดแต่ง', // User's role or position
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Palette.mainRed,
                  ),
                  width: 5,
                  height: 60,
                ),
              ],
            ),
            SizedBox(width: 16), // Spacing between user info and button
            ElevatedButton(
                onPressed: () {
                  logoutAlert(context);
                  // Phoenix.rebirth(context);
                },
                child: Text(
                  'ออกจากระบบ',
                  style: TextStyle(
                      color: Palette.mainRed,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(
                      color: Palette.mainRed, width: 1), // Border style
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                )),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'แผนกตัดแต่ง',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: setHeight(
                            context,
                            0.05,
                          ),
                          color: Palette.mainRed),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  duration: Duration(milliseconds: 300),
                                  type: PageTransitionType.fade,
                                  child: ColdParts_Tab()),
                            );
                          },
                          child: Image.asset(
                            'assets/images/trim1.png',
                            height: 200,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    duration: Duration(milliseconds: 300),
                                    type: PageTransitionType.fade,
                                    child: TrimWeight_Tab()));
                          },
                          child: Image.asset(
                            'assets/images/trim2.png',
                            height: 200,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  duration: Duration(milliseconds: 300),
                                  type: PageTransitionType.fade,
                                  child: Transform_Tab()),
                            );
                          },
                          child: Image.asset(
                            'assets/images/trim3.png',
                            height: 200,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    duration: Duration(milliseconds: 300),
                                    type: PageTransitionType.fade,
                                    child: Line_Tab()));
                          },
                          child: Image.asset(
                            'assets/images/trim4.png',
                            height: 200,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        height: setHeight(context, 0.08),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              side: const BorderSide(
                                  color: Palette.mainRed, width: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  duration: Duration(milliseconds: 300),
                                  type: PageTransitionType.fade,
                                  child: LSQ_Tab()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/barcode-read.png',
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "ดูรายละเอียดสินค้า",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Palette.mainRed,
                                        fontSize: setFontSize(context, 0.03)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future logoutAlert(
  var context,
) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!ads
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: EdgeInsets.all(50), // Set padding for content
        titlePadding: EdgeInsets.all(30), // Set p
        title: Text(
          'ต้องการออกจากระบบหรือไม่?',
          style: TextStyle(
              color: Palette.mainRed,
              fontSize: setFontSize(context, 0.03),
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor:
                    const Color.fromARGB(255, 235, 116, 108), // Splash color
              ),
              child: Text(
                'ยกเลิก',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: setFontSize(context, 0.03),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor:
                    const Color.fromARGB(255, 138, 206, 140), // Splash color
              ),
              child: Text(
                'ยืนยัน',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: setFontSize(context, 0.03),
                ),
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                prefs.clear();
                Phoenix.rebirth(context);
              },
            ),
          ),
        ],
      );
    },
  );
}
