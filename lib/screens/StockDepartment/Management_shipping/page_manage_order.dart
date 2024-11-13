import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mumu_project/ETC/FormSearch.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/ETC/section_count.dart';

class PageManageOrder extends StatefulWidget {
  const PageManageOrder({Key? key}) : super(key: key);

  @override
  _PageManageOrderState createState() => _PageManageOrderState();
}

class _PageManageOrderState extends State<PageManageOrder> {
  List<Map<String, dynamic>> filteredData = [
    {
      "id": "1",
      "name": "สันใน",
      "status": "รอจัดส่ง",
      "recommend": "100",
      "already": "50",
      "need": "50",
    },
    {
      "id": "2",
      "name": "สันใน",
      "status": "รอจัดส่ง",
      "recommend": "100",
      "already": "50",
      "need": "50",
    },
    {
      "id": "3",
      "name": "สันใน",
      "status": "รอจัดส่ง",
      "recommend": "100",
      "already": "50",
      "need": "50",
    },
    {
      "id": "4",
      "name": "สันใน",
      "status": "รอจัดส่ง",
      "recommend": "100",
      "already": "50",
      "need": "50",
    },
    {
      "id": "5",
      "name": "สันนอก",
      "status": "สินค้าครบ",
      "recommend": "134",
      "already": "50",
      "need": "100",
    },
  ];

  final List labelTable = [
    '#',
    'ชื่อสินค้า',
    'คลัง',
    'แนะนำ',
    'จัดแล้ว',
    'ที่ต้องจัด',
  ];

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController recommendController = TextEditingController();
  TextEditingController alreadyController = TextEditingController();
  TextEditingController needController = TextEditingController();
  TextEditingController weighedController = TextEditingController();
  bool complete = false, haveCart = false;
  String? customer;
  int countCart = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7EBEF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: setHeight(context, 0.56),
                width: setWidth(context, 0.38),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ออเดอร์สินค้าวันนี้",
                            style: TextStyle(
                              fontSize: setFontSize(context, 0.015),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '18 ก.ค. 2567',
                            style: TextStyle(
                              fontSize: setFontSize(context, 0.015),
                              fontWeight: FontWeight.bold,
                              color: Palette.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Scrollbar(
                        // thumbVisibility: true,
                        child: SingleChildScrollView(
                          child: DataTable(
                            showCheckboxColumn: false,
                            // horizontalMargin: 15,
                            headingRowColor: WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                                return const Color(0xFFE7EBEF);
                              },
                            ),
                            dividerThickness: 0.8,
                            headingTextStyle: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: setFontSize(context, 0.014),
                              fontWeight: FontWeight.bold,
                              color: Palette.greyText,
                            ),
                            dataTextStyle: TextStyle(fontSize: setFontSize(context, 0.014)),
                            columnSpacing: 18,
                            dataRowHeight: setHeight(context, 0.07),
                            headingRowHeight: setHeight(context, 0.05),
                            columns: <DataColumn>[
                              for (var label in labelTable)
                                DataColumn(
                                  label: Expanded(
                                    child: Text(label),
                                  ),
                                ),
                            ],
                            rows: [
                              for (var i = 0; i < filteredData.length; i++)
                                DataRow(
                                  onSelectChanged: (isSelected) {
                                    if (isSelected ?? false) {
                                      showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          List labelDetailOrder = ["#", "ชื่อคลังสินค้า", "ยอดคงเหลือ(กก.)", "จำนวนถุง(ชิ้น)"];
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
                                                    Text(
                                                      filteredData[i]['name'],
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: setFontSize(context, 0.018),
                                                        color: Palette.mainRed,
                                                      ),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        text: 'ทั้งหมด(กก.): ',
                                                        style: TextStyle(
                                                          color: Palette.greyText,
                                                          fontSize: setFontSize(context, 0.014),
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: "1,000",
                                                            style: TextStyle(
                                                              color: Palette.blue,
                                                              fontSize: setFontSize(context, 0.014),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 250,
                                                  child: FormSearch(
                                                    onChanged: (value) {},
                                                  ),
                                                ),
                                              ],
                                            ),
                                            content: SingleChildScrollView(
                                              child: Scrollbar(
                                                child: DataTable(
                                                  showCheckboxColumn: false,
                                                  horizontalMargin: 15,
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
                                                          DataCell(Text("สันใน")),
                                                          DataCell(Text("100")),
                                                          DataCell(Text("50")),
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
                                                        color: Color(0xFF757575),
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
                                    }
                                  },
                                  cells: <DataCell>[
                                    DataCell(Text((i + 1).toString())),
                                    DataCell(Text(filteredData[i]['name'])),
                                    DataCell(Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Palette.mainRed,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Image.asset("assets/images/warehouse-full.png"),
                                      ),
                                    )), //Text(filteredData[i]['status'])),
                                    DataCell(Text(filteredData[i]['recommend'])),
                                    DataCell(Text(filteredData[i]['already'])),
                                    DataCell(Text(filteredData[i]['need'])),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Container(
                height: setHeight(context, 0.56),
                width: setWidth(context, 0.54),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ออเดอร์สินค้าวันนี้",
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.015),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Expanded(
                              child: FormManaget(
                                label: "ชื่อสินค้า",
                                canEdit: false,
                                controller: nameController,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: FormDropdown(
                                onChanged: (val) {
                                  setState(() {
                                    customer = val;
                                  });
                                },
                                title: "ลูกค้า",
                                hintText: "ลูกค้า1",
                                value: customer,
                                items: ["ลูกค้า1", "ลูกค้า2", "ลูกค้า3"],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Expanded(
                              child: FormManaget(
                                label: "ปริมาณที่แนะนำ(กก.)",
                                canEdit: false,
                                controller: recommendController,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: FormManaget(
                                label: "ปริมาณที่จัดแล้ว(กก.)",
                                canEdit: false,
                                controller: alreadyController,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: FormManaget(
                                label: "ปริมาณรวม(กก.)",
                                canEdit: true,
                                controller: needController,
                                valueColor: (needController.text.isEmpty)
                                    ? null
                                    : (int.parse(needController.text) == int.parse(recommendController.text))
                                        ? const Color(0xFF52C41A)
                                        : (int.parse(needController.text) > int.parse(recommendController.text))
                                            ? const Color(0xFFFF4D4F)
                                            : Palette.blue,
                                fillColor: (needController.text.isEmpty)
                                    ? null
                                    : (int.parse(needController.text) == int.parse(recommendController.text))
                                        ? const Color(0xFFEAFFE0)
                                        : (int.parse(needController.text) > int.parse(recommendController.text))
                                            ? const Color(0xFFFFDFDF)
                                            : Palette.lightBlue,
                                borderColor: (needController.text.isEmpty)
                                    ? null
                                    : (int.parse(needController.text) == int.parse(recommendController.text))
                                        ? const Color(0xFF52C41A)
                                        : (int.parse(needController.text) > int.parse(recommendController.text))
                                            ? const Color(0xFFFF4D4F)
                                            : Palette.blue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Expanded(
                              child: FormManaget(
                                label: "สถานะ",
                                canEdit: false,
                                controller: statusController,
                                valueColor: (statusController.text.isEmpty)
                                    ? null
                                    : (statusController.text == "รอจัดส่ง")
                                        ? const Color(0xFFF1B44C)
                                        : const Color(0xFF52C41A),
                                fillColor: (statusController.text.isEmpty)
                                    ? null
                                    : (statusController.text == "รอจัดส่ง")
                                        ? const Color(0xFFFAE6C3)
                                        : const Color(0xFFEAFFE0),
                                borderColor: (statusController.text.isEmpty)
                                    ? null
                                    : (statusController.text == "รอจัดส่ง")
                                        ? const Color(0xFFF1B44C)
                                        : const Color(0xFF52C41A),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: FormManaget(
                                label: "ปริมาณที่ชั่ง(กก.)",
                                canEdit: true,
                                controller: weighedController,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: SizedBox(
                                height: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      "เสร็จสิ้น",
                                      style: TextStyle(
                                        fontSize: setFontSize(context, 0.015),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Transform.scale(
                                      scale: 3.65,
                                      child: Checkbox(
                                        value: complete,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            complete = value!;
                                          });
                                        },
                                        checkColor: Colors.white,
                                        activeColor: Palette.blue,
                                        side: const BorderSide(
                                          width: 0.5, // ความหนาของขอบ (ปรับค่าได้ตามต้องการ)
                                          color: Color(0xFFDAE1E7),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                width: 200,
                                height: 100,
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Text(
                                      "มีตะกร้า",
                                      style: TextStyle(
                                        fontSize: setFontSize(context, 0.015),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30.0),
                                          child: Transform.scale(
                                            scaleX: 2.2,
                                            scaleY: 2.0,
                                            child: CupertinoSwitch(
                                              value: haveCart,
                                              onChanged: (val) {
                                                setState(() {
                                                  haveCart = val;
                                                });
                                              },
                                              activeColor: Palette.mainRed,
                                            ),
                                          ),
                                        ),
                                        if (haveCart)
                                          const Positioned(
                                            top: 2,
                                            left: 12,
                                            child: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 18),
                        if (haveCart)
                          Row(
                            children: [
                              Expanded(
                                child: FormDropdown(
                                  onChanged: (val) {},
                                  title: 'สีตะกร้า',
                                  hintText: 'สีตะกร้า',
                                  value: 'สีแดง',
                                  items: ['สีแดง', 'สีเหลือง', 'สีฟ้า'],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: FormDropdown(
                                  onChanged: (val) {},
                                  title: 'สีตะกร้า',
                                  hintText: 'สีตะกร้า',
                                  value: 'สีแดง',
                                  items: ['สีแดง', 'สีเหลือง', 'สีฟ้า'],
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: 230,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "มีตะกร้า",
                                      style: TextStyle(
                                        fontSize: setFontSize(context, 0.015),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    SectionCount(
                                      countText: countCart.toString(),
                                      fontSize: setFontSize(context, 0.015),
                                      sizeButton: 10,
                                      onAdd: () {
                                        setState(() {
                                          countCart++;
                                        });
                                      },
                                      onRemove: () {
                                        setState(() {
                                          if (countCart > 0) countCart--;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        height: 110,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x1A000000),
              offset: Offset(4, 4),
              blurRadius: 30.7,
            ),
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: setWidth(context, 0.7),
                height: 90,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Palette.blue,
                    side: const BorderSide(
                      width: 2.0,
                      color: Palette.blue,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_circle_outline,
                        size: 35,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "เพิ่มรายการพิมพ์",
                        style: TextStyle(
                          fontSize: setFontSize(context, 0.025),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SizedBox(
                  height: 90,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
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
                    onPressed: () {},
                    child: const Icon(
                      Icons.qr_code_scanner,
                      size: 50,
                      color: Palette.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FormManaget extends StatelessWidget {
  FormManaget({
    super.key,
    required this.controller,
    required this.canEdit,
    required this.label,
    this.fillColor,
    this.borderColor,
    this.valueColor,
  });
  TextEditingController controller = TextEditingController();
  bool canEdit;
  String label;
  Color? fillColor, borderColor, valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: setFontSize(context, 0.015),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          readOnly: !canEdit,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
            fillColor: canEdit ? fillColor ?? Colors.white : fillColor ?? const Color(0xFFE7EBEF),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor ?? const Color(0xFFAAB9C5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor ?? const Color(0xFFAAB9C5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor ?? const Color(0xFFAAB9C5)),
            ),
          ),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: setFontSize(context, 0.015),
            color: valueColor ?? Palette.greyText,
          ),
          controller: controller,
          validator: (value) => value == null || value.isEmpty ? 'Please select a date and time' : null,
        ),
      ],
    );
  }
}

class FormDropdown extends StatelessWidget {
  const FormDropdown({
    super.key,
    required this.onChanged,
    required this.title,
    required this.hintText,
    required this.value,
    required this.items,
    this.colorCode,
  });
  final Function(String?)? onChanged;
  final String? title, hintText, value;
  final List<String> items;
  final List<String>? colorCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(
            fontSize: setFontSize(context, 0.015),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFAAB9C5)),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              )),
          child: Padding(
            padding: const EdgeInsets.all(11.5),
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
                        child: (colorCode == null)
                            ? Text(
                                item,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: setFontSize(context, 0.015),
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
                  width: setWidth(context, 0.45),
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
