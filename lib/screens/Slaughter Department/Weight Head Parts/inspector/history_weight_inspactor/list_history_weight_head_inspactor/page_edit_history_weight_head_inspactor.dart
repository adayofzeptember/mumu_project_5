import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/ButtonComponent.dart';
import 'package:mumu_project/ETC/FormShowDialog.dart';
import 'package:mumu_project/ETC/appbar_component.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/formdropdown.dart';
import 'package:mumu_project/ETC/mediaQuery_set%202.dart';
import 'package:mumu_project/alert_components/showImageGirdForSelect.dart';

class PageEditHistoryWeightHeadInspactor extends StatefulWidget {
  const PageEditHistoryWeightHeadInspactor({Key? key}) : super(key: key);

  @override
  _PageEditHistoryWeightHeadInspactorState createState() => _PageEditHistoryWeightHeadInspactorState();
}

class _PageEditHistoryWeightHeadInspactorState extends State<PageEditHistoryWeightHeadInspactor> {
  String? lotNo, weightNo, nameProduct, sizeBag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white, // Set background color to white
        toolbarHeight: setHeight(context, 0.06),
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to the right
          children: [
            AppBarHomeMenu(
              title: "บันทึกน้ำหนักหัวหมู/เครื่องใน ",
            ),
            AppBarNameLastNameRoleAndLogout(),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: 100,
              width: double.infinity,
              color: const Color(0xFFF5f5f5),
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: ButtonComponent(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 35,
                        color: Palette.mainRed,
                      ),
                      title: "ย้อนกลับ",
                      textStyle: TextStyle(
                        fontSize: setFontSize(context, 0.03),
                        fontWeight: FontWeight.bold,
                        color: Palette.mainRed,
                      ),
                      bg: const Color(0xFFF5f5f5),
                      onPressed: () => Navigator.pop(context),
                      borderRadius: 41,
                      side: const BorderSide(
                        color: Palette.mainRed,
                        width: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "ข้อมูลที่ต้องการแก้ไข ",
                              style: TextStyle(
                                fontSize: setFontSize(context, 0.03),
                                fontWeight: FontWeight.bold,
                                color: Palette.greyText,
                              ),
                            ),
                            const ImageIcon(
                              AssetImage('assets/images/pen-line.png'),
                              color: Palette.greyText,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "น้ำหนักที่ชั่ง : 170.00",
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.035),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1A000000), // #0000001A คือสีดำที่มีความโปร่งใส 10%
                      offset: Offset(4, 4), // ระยะของเงาตามแกน x และ y
                      blurRadius: 30.7, // ความเบลอของเงา
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "แก้ไขชั่งน้ำหนักหัวหมู/เครื่องใน",
                      style: TextStyle(fontSize: setFontSize(context, 0.035), fontWeight: FontWeight.bold, fontFamily: 'Prompt'),
                    ),
                    const SizedBox(height: 20),
                    Divider(
                      color: Colors.black.withOpacity(0.05),
                      thickness: 2.5,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: setWidth(context, 0.45),
                          child: FormDropdown(
                            title: 'Lot No.',
                            title2: '',
                            titleColor: Colors.black,
                            hintText: lotNo ?? 'เลือก Lot No.',
                            value: lotNo,
                            items: const ['test1', 'test2', 'test3'],
                            onChanged: (value) {
                              setState(() {
                                lotNo = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: setWidth(context, 0.45),
                          child: FormDropdown(
                            title: 'เลขเครื่องชั่ง',
                            title2: '',
                            titleColor: Colors.black,
                            hintText: weightNo ?? 'เลขที่เครื่องชั่ง',
                            value: weightNo,
                            items: const ['test1', 'test2', 'test3'],
                            onChanged: (value) {
                              setState(() {
                                weightNo = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: setWidth(context, 0.45),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "รายการชื่อสินค้า",
                                style: TextStyle(
                                  fontSize: setFontSize(context, 0.025),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              FormShowDialog(
                                value: nameProduct,
                                onTap: () async {
                                  nameProduct = await showImageGirdForSelect(context, "สินค้า");
                                  print(nameProduct);

                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: setWidth(context, 0.45),
                          child: FormDropdown(
                            title: 'ประเภทสินค้า',
                            title2: '',
                            titleColor: Colors.black,
                            hintText: 'auto',
                            value: weightNo,
                            items: [],
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      child: FormDropdown(
                        title: 'ขนาดถุง',
                        title2: '',
                        titleColor: Colors.black,
                        hintText: sizeBag ?? 'เลือกขนาดถุง',
                        value: sizeBag,
                        items: const ['49', '52', '54'],
                        onChanged: (value) {
                          setState(() {
                            sizeBag = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
