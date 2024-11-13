import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mumu_project/ETC/ButtonComponent.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';

class PageAllOrderCustomer extends StatefulWidget {
  const PageAllOrderCustomer({Key? key}) : super(key: key);

  @override
  _PageAllOrderCustomerState createState() => _PageAllOrderCustomerState();
}

class _PageAllOrderCustomerState extends State<PageAllOrderCustomer> {
  List<String> cus = ["1", "2", "3", "4", "5"];
  String? selectCus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7EBEF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Align(
                alignment: Alignment.centerRight,
                child: FormDropdown(
                  onChanged: (val) {
                    setState(() {
                      selectCus = val;
                    });
                  },
                  hintText: selectCus ?? "เลือกลูกค้า",
                  value: selectCus,
                  items: cus,
                ),
              ),
            ),
            const SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 30),
                  for (int i = 0; i < 8; i++)
                    Container(
                      width: setWidth(context, 0.25),
                      height: setHeight(context, 0.52),
                      padding: const EdgeInsets.all(18),
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  "ลูกค้า",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: setHeight(context, 0.02),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Order No. SO001",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: setHeight(context, 0.02),
                                    color: Palette.mainRed,
                                    // overflow: TextOverflow.visible,
                                  ),
                                  // maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "สถานที่ จ.นครราชสีมา",
                            style: TextStyle(
                              fontSize: setHeight(context, 0.02),
                              color: Palette.greyText,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: setWidth(context, 0.19) - 8,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: 1.0,
                                  // widthFactor: 90, // กำหนดเปอร์เซ็นต์
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF52C41A),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "100%",
                                style: TextStyle(
                                  fontSize: setHeight(context, 0.02),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 0.5,
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                for (int i = 0; i < 20; i++)
                                  Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 4),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "รายการสินค้าที่ $i",
                                                style: TextStyle(
                                                  fontSize: setHeight(context, 0.02),
                                                  color: Palette.greyText,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  "${i}00/1000 กก.",
                                                  style: TextStyle(
                                                    fontSize: setHeight(context, 0.02),
                                                    color: Palette.greyText,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey[300],
                                        thickness: 0.5,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: setHeight(context, 0.07),
                                width: setWidth(context, 0.05),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    backgroundColor: Colors.white,
                                    side: const BorderSide(
                                      width: 2.0,
                                      color: Color(0xFF637D92),
                                    ),
                                  ),
                                  onPressed: () {
                                    showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        List labelDetailOrder = ["#", "สีตะกร้า", "ไซส์", "จำนวน(ใบ)"];
                                        return AlertDialog(
                                          contentPadding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
                                          titlePadding: const EdgeInsets.fromLTRB(30, 30, 30, 12),
                                          actionsPadding: const EdgeInsets.fromLTRB(30, 12, 30, 30),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          title: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "ข้อมูลตะกร้า ",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: setFontSize(context, 0.018),
                                                        ),
                                                      ),
                                                      Text(
                                                        "S1000",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: setFontSize(context, 0.018),
                                                          color: Palette.mainRed,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "ทั้งหมด ",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: setFontSize(context, 0.018),
                                                      color: const Color(0xFF92A5B5),
                                                    ),
                                                  ),
                                                  Text(
                                                    "150 ใบ",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: setFontSize(context, 0.018),
                                                      color: Palette.mainRed,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          content: SingleChildScrollView(
                                            child: Scrollbar(
                                              child: DataTable(
                                                showCheckboxColumn: false,
                                                horizontalMargin: 20,
                                                headingRowColor: WidgetStateProperty.resolveWith<Color>(
                                                  (Set<WidgetState> states) {
                                                    return const Color(0xFFFAFAFA);
                                                  },
                                                ),
                                                dividerThickness: 0.8,
                                                headingTextStyle: TextStyle(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: setFontSize(context, 0.014),
                                                  fontWeight: FontWeight.bold,
                                                  color: Palette.greyText,
                                                ),
                                                dataTextStyle:
                                                    TextStyle(fontSize: setFontSize(context, 0.013), fontWeight: FontWeight.bold),
                                                columnSpacing: 50,
                                                dataRowHeight: setHeight(context, 0.07),
                                                headingRowHeight: setHeight(context, 0.05),
                                                columns: <DataColumn>[
                                                  for (var label in labelDetailOrder)
                                                    DataColumn(
                                                      label: Expanded(
                                                        child: Text(label),
                                                      ),
                                                    ),
                                                ],
                                                rows: [
                                                  for (var i = 0; i < 40; i++)
                                                    DataRow(
                                                      cells: [
                                                        DataCell(Text((i + 1).toString())),
                                                        const DataCell(
                                                          Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 10,
                                                                backgroundColor: Colors.red,
                                                              ),
                                                              SizedBox(width: 5),
                                                              Text("แดง"),
                                                            ],
                                                          ),
                                                        ),
                                                        const DataCell(Text("S")),
                                                        const DataCell(Text("50")),
                                                      ],
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                padding: const EdgeInsets.symmetric(vertical: 8),
                                                backgroundColor: const Color(0xFFFAFAFA),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                  side: const BorderSide(
                                                    color: Color(0xFF757575),
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Color(0xFF757575),
                                                  ),
                                                  Text(
                                                    'ปิด',
                                                    style: TextStyle(
                                                      color: const Color(0xFF757575),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: setFontSize(context, 0.02),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const ImageIcon(
                                    AssetImage("assets/images/basket.png"),
                                    color: Color(0xFF637D92),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: setHeight(context, 0.078),
                                width: setWidth(context, 0.15),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    backgroundColor: Palette.mainRed,
                                    side: const BorderSide(
                                      width: 2.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    showDialog<void>(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          contentPadding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
                                          titlePadding: const EdgeInsets.fromLTRB(30, 30, 30, 12),
                                          actionsPadding: const EdgeInsets.fromLTRB(30, 12, 30, 30),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          title: Text(
                                            "ข้อมูลการขนส่ง",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: setFontSize(context, 0.018),
                                            ),
                                          ),
                                          content: SingleChildScrollView(
                                            child: SizedBox(
                                              width: setWidth(context, 0.4),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "เลือกทะเบียนรถ",
                                                    style: TextStyle(
                                                      color: Palette.greyText,
                                                      fontSize: setFontSize(context, 0.015),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  SizedBox(
                                                    height: setHeight(context, 0.07),
                                                    // width: setWidth(context, 0.3),
                                                    child: FormDropdown(
                                                      onChanged: (val) {},
                                                      hintText: "เลือกทะเบียนรถ",
                                                      value: null,
                                                      items: ["1", "2", "3", "4", "5"],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Text(
                                                    "ชื่อพนักงานขับรถ",
                                                    style: TextStyle(
                                                      color: Palette.greyText,
                                                      fontSize: setFontSize(context, 0.015),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  SizedBox(
                                                    height: setHeight(context, 0.07),
                                                    // width: setWidth(context, 0.3),
                                                    child: FormDropdown(
                                                      onChanged: (val) {},
                                                      hintText: "ชื่อพนักงานขับรถ",
                                                      value: null,
                                                      items: ["1", "2", "3", "4", "5"],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Text(
                                                    "เวลาออกจากโรงงาน",
                                                    style: TextStyle(
                                                      color: Palette.greyText,
                                                      fontSize: setFontSize(context, 0.015),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  SizedBox(
                                                    height: setHeight(context, 0.07),
                                                    // width: setWidth(context, 0.3),
                                                    child: FormDropdown(
                                                      onChanged: (val) {},
                                                      hintText: "เวลาออกจากโรงงาน",
                                                      value: null,
                                                      items: ["1", "2", "3", "4", "5"],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: CancelButtonComponent(
                                                          onPressed: () => Navigator.pop(context),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 20),
                                                      Expanded(
                                                        child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                                            backgroundColor: const Color(0xFF52C41A),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              side: const BorderSide(
                                                                color: Color(0xFF52C41A),
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              const Icon(
                                                                FontAwesomeIcons.xmark,
                                                                color: Colors.white,
                                                              ),
                                                              Text(
                                                                'บันทึก',
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: setFontSize(context, 0.02),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const ImageIcon(
                                        AssetImage("assets/images/car.png"),
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "จัดส่ง",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: setHeight(context, 0.023),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormDropdown extends StatelessWidget {
  const FormDropdown({
    super.key,
    required this.onChanged,
    required this.hintText,
    required this.value,
    required this.items,
  });
  final Function(String?)? onChanged;
  final String? hintText, value;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFAAB9C5)),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          )),
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            dropdownStyleData: const DropdownStyleData(
              // width: setWidth(context, 0.4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              elevation: 1,
            ),
            alignment: AlignmentDirectional.center,
            hint: Text(
              hintText ?? "",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: setFontSize(context, 0.015)),
            ),
            value: value,
            items: items
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: setFontSize(context, 0.015),
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: onChanged,
            buttonStyleData: ButtonStyleData(
              elevation: 0,
              height: 40,
              width: setWidth(context, 0.4),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
