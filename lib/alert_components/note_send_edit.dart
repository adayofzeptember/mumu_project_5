import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/ButtonComponent.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

void showNoteSendEdit(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: setHeight(context, 0.9),
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Note",
                  style: TextStyle(fontSize: setFontSize(context, 0.035), fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  minLines: 5,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: "กรอกข้อมูล",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: setWidth(context, 0.4),
                      child: CancelButtonComponent(
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    SizedBox(
                      width: setWidth(context, 0.4),
                      child: ButtonComponent(
                        icon: const Icon(Icons.file_download_outlined, size: 35, color: Colors.white),
                        bg: Colors.green,
                        title: "บันทึก",
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
