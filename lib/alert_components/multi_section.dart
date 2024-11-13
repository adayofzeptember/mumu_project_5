import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set%202.dart';

Future<List<String>?> multiSelect(context, getSelected) async {
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  List<String> selectedOptions = getSelected;

  final result = await showModalBottomSheet<List<String>>(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            height: setHeight(context, 0.6),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ลักษณะที่เสียหาย',
                    style: TextStyle(fontSize: setFontSize(context, 0.03), fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          checkColor: Colors.white,
                          activeColor: Palette.mainRed,
                          title: Text(
                            options[index],
                            style: TextStyle(
                              fontSize: setFontSize(context, 0.025),
                            ),
                          ),
                          value: selectedOptions.contains(options[index]),
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selectedOptions.add(options[index]);
                              } else {
                                selectedOptions.remove(options[index]);
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Palette.lightBlue,
                        side: const BorderSide(
                          width: 2.0,
                          color: Palette.blue,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, selectedOptions);
                      },
                      child: Text(
                        'ยืนยัน',
                        style: TextStyle(
                          fontSize: setFontSize(context, 0.03),
                          color: Palette.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
  return result;
}
