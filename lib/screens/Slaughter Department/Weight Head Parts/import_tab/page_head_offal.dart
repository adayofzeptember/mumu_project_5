import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/ButtonComponent.dart';
import 'package:mumu_project/ETC/FormShowDialog.dart';
import 'package:mumu_project/ETC/SlideSwitchComponent.dart';
import 'package:mumu_project/ETC/TextFormFieldComponent.dart';
import 'package:mumu_project/ETC/colors_palette%202.dart';
import 'package:mumu_project/ETC/formdropdown.dart';
import 'package:mumu_project/ETC/listAddLast.dart';
import 'package:mumu_project/ETC/mediaQuery_set.dart';
import 'package:mumu_project/ETC/section_count.dart';

class PageHeadOffal extends StatefulWidget {
  const PageHeadOffal({Key? key}) : super(key: key);

  @override
  _PageHeadOffalState createState() => _PageHeadOffalState();
}

class _PageHeadOffalState extends State<PageHeadOffal> {
  String? lotNo, weightNo, secType;
  String? colorSizeCart;
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
                      title: 'หมายเลขเครื่องชั่ง',
                      title2: '',
                      titleColor: Colors.black,
                      hintText: weightNo ?? 'เลือกแผนก',
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
              FormDropdown(
                title: 'ส่วนรองพื้น (ถ้ามี)',
                title2: '',
                titleColor: Colors.black,
                hintText: secType ?? 'เลือกประเภทส่วนรองพื้น',
                value: secType,
                items: const ['test1', 'test2', 'test3'],
                onChanged: (value) {
                  setState(() {
                    secType = value;
                  });
                },
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: setWidth(context, 0.45),
                    child: FormDropdown(
                      title: 'สี/ขนาดตะกร้า',
                      title2: '',
                      titleColor: Colors.black,
                      hintText: 'เลือกแผนก',
                      value: "test1",
                      items: const ['test1', 'test2', 'test3'],
                      colorCode: const [
                        "0xFFF44336",
                        "0xFF4CAF50",
                        "0xFF2196F3",
                      ],
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    width: setWidth(context, 0.45),
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
                    width: setWidth(context, 0.45),
                    child: FormDropdown(
                      title: 'ชื่อสินค้า',
                      title2: '',
                      titleColor: Colors.black,
                      hintText: nameProduct ?? '',
                      value: nameProduct,
                      items: const ['test1', 'test2', 'test3'],
                      onChanged: (value) {
                        setState(() {
                          nameProduct = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: setWidth(context, 0.45),
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
                    width: setWidth(context, 0.45),
                    child: FormDropdown(
                      title: 'ขนาดถุง',
                      title2: '',
                      titleColor: Colors.black,
                      hintText: sizeBag ?? 'เลือกขนาดถุง',
                      value: sizeBag,
                      items: const ['test1', 'test2', 'test3'],
                      onChanged: (value) {
                        setState(() {
                          sizeBag = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: setWidth(context, 0.45),
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
                onPressed: () {},
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
            bg: const Color(0xFF1890FF),
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

Future<List<String>?> multiSelect(context, getSelected) async {
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  List<String> selectedOptions = getSelected;

  final result = await showModalBottomSheet<List<String>>(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            height: setHeight(context, 0.6),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ลักษณะที่เสียหาย',
                    style: TextStyle(fontSize: setFontSize(context, 0.03), fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          checkColor: Colors.white,
                          activeColor: Palette.mainRed,
                          title: Text(
                            options[index],
                            style: TextStyle(
                              fontSize: setFontSize(context, 0.025),
                            ),
                          ),
                          value: selectedOptions.contains(options[index]),
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selectedOptions.add(options[index]);
                              } else {
                                selectedOptions.remove(options[index]);
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: const Color(0xFFE6F3FF),
                        side: const BorderSide(
                          width: 2.0,
                          color: Color(0xFF1890FF),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, selectedOptions);
                      },
                      child: Text(
                        'ยืนยัน',
                        style: TextStyle(
                          fontSize: setFontSize(context, 0.03),
                          color: const Color(0xFF1890FF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
  return result;
}
