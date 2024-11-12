import 'package:flutter/material.dart';
import 'dart:convert';

class DynamicTextFieldPage extends StatefulWidget {
  @override
  _DynamicTextFieldPageState createState() => _DynamicTextFieldPageState();
}

class _DynamicTextFieldPageState extends State<DynamicTextFieldPage> {
  final List<Map<String, TextEditingController>> _fields = [];

  // ฟังก์ชันเพิ่ม TextField ใหม่
  void _addTextField() {
    setState(() {
      _fields.add({
        "name": TextEditingController(),
        "age": TextEditingController(),
      });
    });
  }

  // ฟังก์ชันลบ TextField
  void _removeTextField(int index) {
    setState(() {
      _fields[index]["name"]?.dispose();
      _fields[index]["age"]?.dispose();
      _fields.removeAt(index);
    });
  }

  // ฟังก์ชันแปลงข้อมูลเป็น JSON
  String _getJsonData() {
    List<Map<String, String>> data = _fields.map((field) {
      return {
        "name": field["name"]!.text,
        "age": field["age"]!.text,
      };
    }).toList();

    return jsonEncode(data); // แปลงเป็น JSON
  }

  @override
  void dispose() {
    for (var field in _fields) {
      field["name"]?.dispose();
      field["age"]?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic TextField Example"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              String jsonData = _getJsonData();
              print("JSON Data: $jsonData"); // แสดงข้อมูล JSON ในคอนโซล
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _fields.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _fields[index]["name"],
                            decoration: InputDecoration(
                              labelText: "Name ${index + 1}",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _fields[index]["age"],
                            decoration: InputDecoration(
                              labelText: "Age ${index + 1}",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeTextField(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("-----------------------------");
                print(_fields[0]);
              },
              child: Text("เxxxas;dklk"),
            ),
            ElevatedButton(
              onPressed: _addTextField,
              child: Text("เพิ่ม Input"),
            ),
          ],
        ),
      ),
    );
  }
}
