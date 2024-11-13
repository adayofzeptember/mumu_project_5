import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/bloc/Login_Greetings/login_bloc.dart';
import 'package:mumu_project/bloc/Slaughter/Import/import_bloc.dart';
import 'package:mumu_project/bloc/Slaughter/LSQ/lsq_bloc.dart';
import 'package:mumu_project/bloc/Slaughter/Line%20Slaughter/line_bloc.dart';
import 'package:mumu_project/screens/Login/login_screen.dart';
import 'package:mumu_project/screens/Slaughter%20Department/main_slaughter.dart';
import 'package:mumu_project/screens/select_role_test.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Palette.mainRed, // Set the status bar color to white
    statusBarIconBrightness: Brightness.light, // Set status bar icons to dark (to be visible on white background)
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      Phoenix(
        child: MumuProject(),
      ),
    ),
  );
}

class MumuProject extends StatelessWidget {
  MumuProject({super.key});
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => ImportBloc()),
        BlocProvider(create: (context) => LineBloc()),
        BlocProvider(create: (context) => LsqBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Palette.mainRed, primary: Palette.mainRed),
          useMaterial3: false,
          fontFamily: 'Prompt',
        ),
        home: MumuSplashPage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}

class MumuSplashPage extends StatefulWidget {
  @override
  State<MumuSplashPage> createState() => _MumuSplashPageState();
}

class _MumuSplashPageState extends State<MumuSplashPage> {
  @override
  void initState() {
    _Pause_And_Go();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Palette.mainRed, // Set the status bar color to white
      statusBarIconBrightness: Brightness.light, // Set status bar icons to dark (to be visible on white background)
    ));
    return Scaffold(
      backgroundColor: Palette.mainRed,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'หมูหมู 🐷🪓🩸',
              style: TextStyle(color: Colors.white, fontSize: setWidth(context, 0.05), fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _Pause_And_Go() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenAuth = prefs.getString('userToken').toString();
    print('stored token: ' + tokenAuth);
//king
    // Navigator.push(
    //   context,
    //   PageTransition(
    //     duration: const Duration(milliseconds: 500),
    //     type: PageTransitionType.fade,
    //     child: SelectRole(),
    //   ),
    // );
//end

    await Future.delayed(const Duration(seconds: 2), () {
      if (tokenAuth == '' || tokenAuth == 'null')
        Navigator.pushReplacement(
          context,
          PageTransition(duration: const Duration(milliseconds: 500), type: PageTransitionType.fade, child: Login_Screen()),
        );
      else
        Navigator.pushReplacement(
          context,
          PageTransition(duration: const Duration(milliseconds: 500), type: PageTransitionType.rightToLeft, child: Main_Slaughter()),
        );
    });
  }
}
