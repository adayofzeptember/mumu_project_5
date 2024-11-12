import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class FormDropdown extends StatelessWidget {
  const FormDropdown({
    super.key,
    required this.onChanged,
    required this.title,
    required this.title2,
    required this.hintText,
    required this.value,
    required this.items,
    this.colorCode,
    this.titleColor,
  });
  final Function(String?)? onChanged;
  final String? title, title2, hintText, value;
  final List<String> items;
  final List<String>? colorCode;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: TextStyle(
              fontSize: setFontSize(context, 0.025),
              fontWeight: FontWeight.bold,
              fontFamily: 'Prompt',
              color: titleColor ?? const Color(0xFF637D92),
            ),
            children: <TextSpan>[
              TextSpan(text: title2, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              )),
          child: Padding(
            padding: const EdgeInsets.all(11.5),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                dropdownStyleData: DropdownStyleData(
                  width: setWidth(context, 0.4),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  elevation: 1,
                ),
                alignment: AlignmentDirectional.center,
                hint: Text(
                  hintText ?? "",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: setFontSize(context, 0.024), color: const Color(0xFF757575)),
                ),
                value: value,
                items: items
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: (colorCode == null)
                            ? Text(
                                item,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: setFontSize(context, 0.025),
                                ),
                              )
                            : Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(
                                      int.parse(colorCode![items.indexOf(item)]),
                                    ),
                                    radius: 15,
                                  ),
                                  const SizedBox(width: 8), // Add some spacing between the circle and the text
                                  Text(
                                    item,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: setFontSize(context, 0.025),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
                buttonStyleData: ButtonStyleData(
                  elevation: 0,
                  height: 40,
                  width: setWidth(context, 1),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
