import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

Widget buildCustomBox(String label, String value, context, double fontSize) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: setFontSize(context, fontSize),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: setFontSize(context, 0.025),
                      color: Colors.blueGrey),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}




