import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> SuccessMessage_Dialog(BuildContext context, String message) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            scrollable: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            contentPadding: const EdgeInsets.all(20),
            content: Center(
              child: Column(
                children: [
                  SvgPicture.asset('assets/images/circle-check.svg', height: 120,),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 107, 201, 110),
                        fontSize: 33,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ));
      });

  Future.delayed(const Duration(seconds: 1), () {
    Navigator.pop(context);
  });
}
