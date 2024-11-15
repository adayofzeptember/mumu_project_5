import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mumu_project/bloc/Master%20Data/master_data_bloc.dart';

class AbnormalitiesSelectionPage extends StatefulWidget {
  @override
  _AbnormalitiesSelectionPageState createState() =>
      _AbnormalitiesSelectionPageState();
}

class _AbnormalitiesSelectionPageState
    extends State<AbnormalitiesSelectionPage> {
  List<Map<String, dynamic>> selectedAbnormalities = [];

  void _addItem() {
    setState(() {
      selectedAbnormalities.add({"id": null, "amount": 1});
    });
  }

  void _updateAmount(int index, int change) {
    setState(() {
      int newAmount = selectedAbnormalities[index]["amount"] + change;
      selectedAbnormalities[index]["amount"] = newAmount > 0 ? newAmount : 1;
    });
  }

  void _updateSelection(int index, String? selectedId) {
    setState(() {
      selectedAbnormalities[index]["id"] = selectedId;
    });
  }

  void printSelectedAbnormalities() {
    // Convert the selected abnormalities list to JSON and print
    String jsonData = jsonEncode(selectedAbnormalities);
    print("Selected Abnormalities JSON: $jsonData");
  }

  @override
  void initState() {
    context.read<MasterDataBloc>().add(Fetch_Abnormals());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('อาการผิดปกติ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<MasterDataBloc, MasterDataState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('อาการผิดปกติ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                ...selectedAbnormalities.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> selected = entry.value;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: selected["id"],
                          hint: Text("เลือกอาการผิดปกติ"),
                          isExpanded: true,
                          items: state.abNormals_dropdown.map((abnormal) {
                            return DropdownMenuItem<String>(
                              value: abnormal.id.toString(),
                              child: Text(abnormal.abnormal_name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            _updateSelection(index, value);
                          },
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.red),
                            onPressed: () => _updateAmount(index, -1),
                          ),
                          Text('${selected["amount"]}'),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.red),
                            onPressed: () => _updateAmount(index, 1),
                          ),
                        ],
                      ),
                    ],
                  );
                }).toList(),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _addItem,
                  child: Text('+ เพิ่มรายการ'),
                ),
                ElevatedButton(
                  onPressed: printSelectedAbnormalities,
                  child: Text('กู๔'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
