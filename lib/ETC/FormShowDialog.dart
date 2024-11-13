import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class FormShowDialog extends StatelessWidget {
  const FormShowDialog({
    super.key,
    required this.onTap,
    this.children,
    this.value,
    this.valueColor,
  });
  final Function()? onTap;
  final List<Widget>? children;
  final String? value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFBCBCBC)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  if (valueColor != null)
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: valueColor,
                    ),
                  const SizedBox(width: 10),
                  (children != null)
                      ? Expanded(
                          child: Wrap(
                            // ใช้ Wrap แทน Row
                            crossAxisAlignment: WrapCrossAlignment.start,
                            spacing: 8.0, // กำหนดระยะห่างระหว่างแต่ละ item
                            runSpacing: 8.0, // ระยะห่างระหว่างบรรทัด
                            children: children ?? [],
                          ),
                        )
                      : Text(
                          value ?? "เลือก",
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.025),
                            fontWeight: FontWeight.bold,
                            color: value != null ? Colors.black : const Color(0xFF757575),
                          ),
                        ),
                ],
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: Color(0xFF757575)),
          ],
        ),
      ),
    );
  }
}
