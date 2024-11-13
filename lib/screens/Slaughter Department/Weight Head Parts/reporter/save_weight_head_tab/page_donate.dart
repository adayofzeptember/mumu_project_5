import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mumu_project/ETC/ButtonComponent.dart';
import 'package:mumu_project/ETC/TextFormFieldComponent.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/ETC/formdropdown.dart';
import 'package:mumu_project/ETC/mediaQuery_set%202.dart';

class PageDonate extends StatefulWidget {
  const PageDonate({Key? key}) : super(key: key);

  @override
  _PageDonateState createState() => _PageDonateState();
}

class _PageDonateState extends State<PageDonate> {
  String? lotNo, weightNo, weightCart;
  bool isBroken = false;
  List<File> selectedImages = [];
  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await picker.pickImage(
        source: source,
        imageQuality: 100,
        maxHeight: 1000,
        maxWidth: 1000,
      );

      if (pickedFile != null) {
        setState(() {
          selectedImages.add(File(pickedFile.path));
        });
      } else {
        _showSnackBar('ไม่ได้เลือกรูป');
      }
    } catch (e) {
      _showSnackBar('เกิดข้อผิดพลาด: $e');
    }
  }

  Future<void> _pickMultipleImages() async {
    try {
      final pickedFiles = await picker.pickMultiImage(
        imageQuality: 100,
        maxHeight: 1000,
        maxWidth: 1000,
      );

      if (pickedFiles.isNotEmpty) {
        setState(() {
          selectedImages.addAll(pickedFiles.map((file) => File(file.path)));
        });
      } else {
        _showSnackBar('ไม่ได้เลือกรูป');
      }
    } catch (e) {
      _showSnackBar('เกิดข้อผิดพลาด: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    selectedImages.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdownRow(),
            const SizedBox(height: 28),
            _buildTitle('ลักษณะสุกรผิดปกติ'),
            const SizedBox(height: 8),
            _buildToggleButtons(),
            const SizedBox(height: 28),
            _buildTitle("น้ำหนักที่ชั่ง"),
            const SizedBox(height: 8),
            TextFormFieldComponent(
              textAlign: TextAlign.end,
              controllerString: weightCart,
              keyboardType: TextInputType.number,
              valueSize: setFontSize(context, 0.035),
            ),
            const SizedBox(height: 28),
            Divider(color: const Color(0xFF000000).withOpacity(0.05), thickness: 2.5),
            const SizedBox(height: 28),
            _buildImageUploadSection(),
            SizedBox(height: setHeight(context, 0.15)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildDropdownRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDropdown(
          title: 'Lot No.',
          hintText: lotNo ?? 'เลือก Lot No.',
          value: lotNo,
          items: const ['test1', 'test2', 'test3'],
          onChanged: (value) {
            setState(() {
              lotNo = value;
            });
          },
        ),
        _buildDropdown(
          title: 'เลขเครื่องชั่ง',
          hintText: weightNo ?? 'เลขที่เครื่องชั่ง',
          value: weightNo,
          items: const ['test1', 'test2', 'test3'],
          onChanged: (value) {
            setState(() {
              weightNo = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String title,
    required String hintText,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return SizedBox(
      width: setWidth(context, 0.45),
      child: FormDropdown(
        title: title,
        title2: '',
        titleColor: Colors.black,
        hintText: hintText,
        value: value,
        items: items,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: setFontSize(context, 0.025), fontWeight: FontWeight.bold),
    );
  }

  Widget _buildToggleButtons() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(30),
      ),
      width: setWidth(context, 0.363),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildToggleButton("9 นิ้ว", !isBroken),
          _buildToggleButton("หมูท้อง", isBroken),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBroken = !isBroken;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: setWidth(context, 0.18),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isSelected ? Palette.mainRed : Colors.white,
          borderRadius: isSelected
              ? const BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))
              : const BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: setFontSize(context, 0.025),
          ),
        ),
      ),
    );
  }

  Widget _buildImageUploadSection() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'อัปโหลดภาพหมูเก้านิ้ว/ท้อง(บริจาค) ',
              style: TextStyle(color: Colors.black, fontSize: setFontSize(context, 0.025), fontWeight: FontWeight.bold),
            ),
            Text(
              '(แนบไฟล์ได้ 30 ภาพและแต่ละภาพไม่เกิน 2Mb.)',
              style: TextStyle(
                color: const Color(0xFF0B0A0A),
                fontSize: setFontSize(context, 0.02),
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildImageButton(
              icon: const Icon(Icons.login, size: 35, color: Palette.blue),
              title: "เพิ่มรูปภาพ",
              onPressed: _pickMultipleImages,
            ),
            const SizedBox(width: 20),
            _buildImageButton(
              icon: const Icon(FontAwesomeIcons.cameraRetro, size: 35, color: Palette.blue),
              title: "ถ่ายภาพ",
              onPressed: () => _pickImage(ImageSource.camera),
            ),
          ],
        ),
        const SizedBox(height: 20),
        if (selectedImages.isNotEmpty) _buildImageGrid(),
      ],
    );
  }

  Widget _buildImageButton({
    required Icon icon,
    required String title,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: ButtonComponent(
        icon: icon,
        side: const BorderSide(color: Palette.blue, width: 2),
        title: title,
        textStyle: TextStyle(
          color: Palette.blue,
          fontSize: setFontSize(context, 0.03),
          fontWeight: FontWeight.bold,
        ),
        bg: Palette.lightBlue,
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildImageGrid() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffe7ebef), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
        itemCount: selectedImages.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    selectedImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedImages.removeAt(index);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x66000000),
                          offset: Offset(0, 0),
                          blurRadius: 4.7,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Container(
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
          onPressed: () {
            print('Add data');
            print("lotNo ${lotNo}");
            print("weightNo ${weightNo}");
            print("weightCart ${weightCart}");
            print("isBroken $isBroken");
            print("selectedImages $selectedImages");
          },
          title: "เพิ่มข้อมูล",
          bg: Palette.blue,
          icon: const Icon(Icons.add_circle_outline, size: 35, color: Colors.white),
          textStyle: TextStyle(
            fontSize: setFontSize(context, 0.03),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
