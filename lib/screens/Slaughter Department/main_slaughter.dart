import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/bloc/Login_Greetings/login_bloc.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Import/import_tab_main.dart';
import 'package:mumu_project/screens/Slaughter%20Department/LSQ/lsq_tab_main.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Slaughter%20Line/slaughter_tab_main.dart';
import 'package:mumu_project/screens/Slaughter%20Department/Weight%20Head%20Parts/head_tab_main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Main_Slaughter extends StatefulWidget {
  const Main_Slaughter({super.key});
  @override
  State<Main_Slaughter> createState() => _Main_SlaughterState();
}

class _Main_SlaughterState extends State<Main_Slaughter> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pigsImportNoti(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set the status bar color to white
      statusBarIconBrightness: Brightness.dark, // Set status bar icons to dark (to be visible on white background)
    ));

    return Scaffold(
      backgroundColor: Palette.mainRed,
      appBar: AppBar(
        backgroundColor: Colors.white, // Set background color to white
        toolbarHeight: setHeight(context, 0.07),

        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to the right
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
                              'แผนกเชือด', // User's role or position
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
                  style: TextStyle(color: Palette.mainRed, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Palette.mainRed, width: 1), // Border style
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
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'แผนกเชือด',
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
                                  duration: Duration(milliseconds: 300), type: PageTransitionType.fade, child: Import_Tab()),
                            );
                          },
                          child: Image.asset(
                            'assets/images/slaughter1.png',
                            height: 200,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    duration: Duration(milliseconds: 300), type: PageTransitionType.fade, child: Head_tab()));
                          },
                          child: Image.asset(
                            'assets/images/slaughter2.png',
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
                              PageTransition(duration: Duration(milliseconds: 300), type: PageTransitionType.fade, child: LSQ_Tab()),
                            );
                          },
                          child: Image.asset(
                            'assets/images/slaughter3.png',
                            height: 200,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    duration: Duration(milliseconds: 300), type: PageTransitionType.fade, child: Line_Tab()));
                          },
                          child: Image.asset(
                            'assets/images/slaughter4.png',
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
                              side: const BorderSide(color: Palette.mainRed, width: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(duration: Duration(milliseconds: 300), type: PageTransitionType.fade, child: LSQ_Tab()),
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
                                        fontWeight: FontWeight.bold, color: Palette.mainRed, fontSize: setFontSize(context, 0.03)),
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

Future pigsImportNoti(var context) async {
  return showDialog(
    context: context,
    // barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/pigs2.svg',
                      height: setHeight(context, 0.2),
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      state.greetingBoard_info.notice.toString(),
                      style: TextStyle(
                        fontSize: setFontSize(context, 0.04),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      state.greetingBoard_info.date.toString(),
                      style: TextStyle(
                        fontSize: setFontSize(context, 0.03),
                        color: Palette.mainRed,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '08 : 35',
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.03),
                          ),
                        ),
                        Text(
                          'ฟาร์มหมูเจริญ',
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.03),
                          ),
                        ),
                        Text(
                          '120 ตัว',
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.03),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    // Details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '10 : 25',
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.03),
                          ),
                        ),
                        Text(
                          'ฟาร์มหมู',
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.03),
                          ),
                        ),
                        Text(
                          '100 ตัว',
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.03),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    SizedBox(
                      height: setHeight(context, 0.05),
                      width: setWidth(context, 0.2),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'ปิด',
                          style: TextStyle(fontSize: setFontSize(context, 0.03)),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    },
  );
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
          style: TextStyle(color: Palette.mainRed, fontSize: setFontSize(context, 0.03), fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 235, 116, 108), // Splash color
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
                foregroundColor: const Color.fromARGB(255, 138, 206, 140), // Splash color
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
