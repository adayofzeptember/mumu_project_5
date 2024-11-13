import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/ButtonComponent.dart';
import 'package:mumu_project/ETC/FormShowDialog.dart';
import 'package:mumu_project/ETC/SlideSwitchComponent.dart';
import 'package:mumu_project/ETC/TextFormFieldComponent.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/formdropdown.dart';
import 'package:mumu_project/ETC/listAddLast.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/ETC/section_count.dart';
import 'package:mumu_project/alert_components/color_cart.dart';
import 'package:mumu_project/alert_components/multi_section.dart';
import 'package:mumu_project/alert_components/note_send_edit.dart';
import 'package:mumu_project/alert_components/showImageGirdForSelect.dart';

class PageHeadOffal extends StatefulWidget {
  const PageHeadOffal({Key? key}) : super(key: key);

  @override
  _PageHeadOffalState createState() => _PageHeadOffalState();
}

class _PageHeadOffalState extends State<PageHeadOffal> {
  String? lotNo, weightNo, secType;
  Map<String, dynamic>? colorSizeCart;
  int countCart = 0;
  String? nameProduct;
  int countHead = 0;
  String? sizeBag;
  int countBag = 0;

  bool checkClean = false;
  bool checkColor = false;
  bool checkSmell = false;
  bool checkStrange = false;
  bool checkResult = false;

  List<String> selectedBroken = [];

  String? weightCart;
  String? note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ส่วนรองพื้น (ถ้ามี)",
                    style: TextStyle(
                      fontSize: setFontSize(context, 0.025),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormShowDialog(
                    onTap: () async {
                      secType = await showImageGirdForSelect(context, "เลือกส่วนรองพื้น (ถ้ามี)");
                      setState(() {});
                    },
                    value: secType,
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: setWidth(context, 0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "สี/ขนาดตะกร้า",
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.025),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        FormShowDialog(
                          valueColor: colorSizeCart != null ? colorSizeCart!['color'] : null,
                          value: colorSizeCart != null ? "${colorSizeCart!['name']} - ${colorSizeCart!['size']}" : null,
                          onTap: () async {
                            colorSizeCart = await showColorCart(context, colorSizeCart);
                            if (colorSizeCart != null) print(colorSizeCart);

                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "จำนวนตะกร้า",
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.025),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SectionCount(
                          countText: countCart.toString(),
                          onAdd: () {
                            setState(() {
                              countCart++;
                            });
                          },
                          onRemove: () {
                            setState(() {
                              if (countCart > 0) {
                                countCart--;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: setWidth(context, 0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ชื่อสินค้า",
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
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "จำนวนหัวหมู",
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.025),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SectionCount(
                          countText: countCart.toString(),
                          onAdd: () {
                            setState(() {
                              countCart++;
                            });
                          },
                          onRemove: () {
                            setState(() {
                              if (countCart > 0) {
                                countCart--;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: setWidth(context, 0.5),
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
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "จำนวนถุงต่อตะกร้า",
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.025),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SectionCount(
                          countText: countBag.toString(),
                          onAdd: () {
                            setState(() {
                              countBag++;
                            });
                          },
                          onRemove: () {
                            setState(() {
                              if (countBag > 0) {
                                countBag--;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              const SizedBox(height: 50),
              Divider(color: Colors.black.withOpacity(0.05), thickness: 2.5),
              const SizedBox(height: 18),
              Text(
                "รายงานกระบวนการชำแหละ",
                style: TextStyle(fontSize: setFontSize(context, 0.035), fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: setWidth(context, 0.45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ความสะอาด",
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.025),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SlideSwitchComponent(
                          value: checkClean,
                          onSwipe: () {
                            setState(() {
                              checkClean = !checkClean;
                            });
                          },
                          textOff: "ผ่าน",
                          textOn: "ไม่ผ่าน",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: setWidth(context, 0.45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "สี",
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.025),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SlideSwitchComponent(
                          value: checkColor,
                          onSwipe: () {
                            setState(() {
                              checkColor = !checkColor;
                            });
                          },
                          textOff: "ปกติ",
                          textOn: "ไม่ปกติ",
                        ),
                      ],
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "กลิ่น",
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.025),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SlideSwitchComponent(
                          value: checkSmell,
                          onSwipe: () {
                            setState(() {
                              checkSmell = !checkSmell;
                            });
                          },
                          textOff: "ปกติ",
                          textOn: "ไม่ปกติ",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: setWidth(context, 0.45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "สิ่งแปลกปลอม",
                          style: TextStyle(
                            fontSize: setFontSize(context, 0.025),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SlideSwitchComponent(
                          value: checkStrange,
                          onSwipe: () {
                            setState(() {
                              checkStrange = !checkStrange;
                            });
                          },
                          textOff: "ไม่พบ",
                          textOn: "พบ",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: setWidth(context, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ผลการตรวจเพื่อการขาย",
                      style: TextStyle(
                        fontSize: setFontSize(context, 0.025),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SlideSwitchComponent(
                      width: setWidth(context, 1) - 60,
                      value: checkResult,
                      onSwipe: () {
                        setState(() {
                          checkResult = !checkResult;
                        });
                      },
                      textOff: "จำหน่ายได้",
                      textOn: "สินค้าเสียหาย",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              Text(
                "ลักษณะที่เสียหาย",
                style: TextStyle(
                  fontSize: setFontSize(context, 0.025),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              FormShowDialog(
                onTap: () {
                  multiSelect(context, selectedBroken).then((value) {
                    if (value != null) {
                      selectedBroken = value;
                      setState(() {});
                    }
                  });
                },
                children: selectedBroken
                    .map(
                      (e) => Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFF5F5F5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              e,
                              style: TextStyle(
                                fontSize: setFontSize(context, 0.025),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedBroken.remove(e);
                                });
                              },
                              child: const Icon(Icons.close),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 28),
              Text(
                "หมายเหตุ",
                style: TextStyle(
                  fontSize: setFontSize(context, 0.025),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormFieldComponent(
                controllerString: note,
              ),
              const SizedBox(height: 28),
              Text(
                "น้ำหนักที่ชั่ง",
                style: TextStyle(
                  fontSize: setFontSize(context, 0.025),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormFieldComponent(
                textAlign: TextAlign.end,
                controllerString: weightCart,
                keyboardType: TextInputType.number,
                valueSize: setFontSize(context, 0.035),
              ),
              const SizedBox(height: 28),
              Text(
                "รายการที่เพิ่มล่าสุด",
                style: TextStyle(
                  fontSize: setFontSize(context, 0.025),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListAddLast(
                    label: 'ลำดับ',
                    value: '1',
                    width: setWidth(context, 0.1),
                  ),
                  const SizedBox(width: 18),
                  ListAddLast(
                    label: 'แผนก',
                    value: 'ตัดแต่ง',
                    width: setWidth(context, 0.5),
                  ),
                  const SizedBox(width: 18),
                  ListAddLast(
                    label: 'จำนวน(เลท)',
                    value: '50',
                    width: setWidth(context, 0.23),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              ButtonComponent(
                onPressed: () {
                  showNoteSendEdit(context);
                },
                title: "แจ้งแก้ไขรายการล่าสุด",
                bg: const Color(0xFFF1B44C),
                icon: const ImageIcon(
                  AssetImage("assets/images/pen-line.png"),
                  size: 30,
                  color: Colors.white,
                ),
                textStyle: TextStyle(
                  fontSize: setFontSize(context, 0.03),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: setHeight(context, 0.15)),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        height: 140,
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
          padding: const EdgeInsets.all(30),
          child: ButtonComponent(
            onPressed: () {},
            title: "เพิ่ม",
            bg: Palette.blue,
            icon: const Icon(Icons.add_circle_outline, size: 35, color: Colors.white),
            textStyle: TextStyle(
              fontSize: setFontSize(context, 0.03),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
