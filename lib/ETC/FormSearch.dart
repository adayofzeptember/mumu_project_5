import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/mediaQuery_set%202.dart';

class FormSearch extends StatelessWidget {
  const FormSearch({
    super.key,
    required this.onChanged,
    this.controller,
  });
  final Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'ค้นหา',
        suffixIcon: const Icon(Icons.search),
        hintStyle: TextStyle(
          fontSize: setFontSize(context, 0.03),
          color: Colors.grey,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
