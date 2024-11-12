import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/ETC/progessHUD.dart';
import 'package:mumu_project/ETC/x.dart';
import 'package:mumu_project/bloc/Login_Greetings/login_bloc.dart';
import 'package:page_transition/page_transition.dart';

var usernameController = TextEditingController();
var passwordController = TextEditingController();

class Login_Screen extends StatelessWidget {
  Login_Screen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return ProgressHUD(
            child: _uiLogin(context), inAsyncCall: state.loading, opacity: 0.3);
      },
    );
  }

  Widget _uiLogin(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.mainRed,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/1.png',
                      height: setHeight(context, 0.2),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(
                              fontSize: setFontSize(context, 0.04),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'ชื่อผู้ใช้',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: setFontSize(context, 0.025),
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: usernameController,
                            textAlign: TextAlign.left,
                            //  initialValue: 'mobile',
                            autofocus: false,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setFontSize(context, 0.025)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'โปรดกรอกชื่อบัญชี';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'กรอกชื่อผู้ใช้',
                                labelStyle: TextStyle(
                                    fontSize: setFontSize(context, 0.04)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 211, 211, 211)),
                                    borderRadius: BorderRadius.circular(10)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 211, 211, 211)),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 211, 211, 211)),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'รหัสผ่าน',
                              style: TextStyle(
                                  fontSize: setFontSize(context, 0.025),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            // initialValue: 'password',
                            controller: passwordController,
                            // obscureText: state.obscurePass,
                            textAlign: TextAlign.left,
                            autofocus: false,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setFontSize(context, 0.025)),

                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'โปรดกรอกรหัสผ่าน';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                // suffixIcon: IconButton(
                                //     onPressed: () {
                                //       // context
                                //       //     .read<LoginBloc>()
                                //       //     .add(ShowPassword_Swap());
                                //     },
                                //     icon: Icon(
                                //       Icons.remove_red_eye,
                                //       color: Colors.grey,
                                //     )
                                //     // color: (state.obscurePass == true)
                                //     //     ? Color.fromARGB(255, 211, 211, 211)
                                //     //     : Palette.thisBlue),
                                //     ),
                                hintText: 'กรอกรหัสผ่าน',
                                labelStyle: const TextStyle(fontSize: 15),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 211, 211, 211)),
                                    borderRadius: BorderRadius.circular(10)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 211, 211, 211)),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 211, 211, 211)),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          SizedBox(
                            height: setHeight(context, 0.04),
                          ),
                          SizedBox(
                            height: setHeight(context, 0.059),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Palette.mainRed,
                                  elevation: 0,
                                  // side: BorderSide(color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  )),
                              onPressed: () {
                                //? check formkey
                                // if (_formKey.currentState!.validate()) {
                                //   context.read<LoginBloc>().add(Login_Casual(
                                //       context: context,
                                //       getUsername: usernameController.text,
                                //       getPassword: passwordController.text));
                                // }

                                context.read<LoginBloc>().add(Login_Casual(
                                    context: context,
                                    getUsername: 'mobile',
                                    getPassword: 'password'));

                              
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "เข้าสู่ระบบ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: setFontSize(context, 0.03)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: setHeight(context, 0.059),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Palette.mainRed,
                                  elevation: 0,
                                  // side: BorderSide(color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  )),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      duration: Duration(milliseconds: 500),
                                      type: PageTransitionType.rightToLeft,
                                      child: DynamicTextFieldPage()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "ตัดแต่ง",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: setFontSize(context, 0.03)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
