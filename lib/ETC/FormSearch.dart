import 'package:flutter/material.dart';

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
      decoration: const InputDecoration(
        hintText: 'ค้นหา',
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
