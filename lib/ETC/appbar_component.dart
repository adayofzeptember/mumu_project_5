import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/screens/Slaughter%20Department/main_slaughter.dart';

class AppBarNameLastNameRoleAndLogout extends StatelessWidget {
  const AppBarNameLastNameRoleAndLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Spacing between avatar and text
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'รจเรข พินสายออ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'ผู้ตรวจสอบ', // User's role or position
              style: TextStyle(
                color: Palette.someGrey,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        const CircleAvatar(
          maxRadius: 30,
          backgroundColor: Color.fromARGB(255, 54, 28, 32),
          child: Icon(
            Icons.person,
            size: 40,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {
            logoutAlert(context);
          },
          icon: const Icon(Icons.logout, color: Colors.black),
          label: const Text(
            'ออกจากระบบ', // Logout text
            style: TextStyle(color: Color.fromARGB(255, 38, 38, 38), fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(12),
            backgroundColor: Colors.white,
            side: const BorderSide(color: Color.fromARGB(255, 23, 23, 23), width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
          ),
        ),
      ],
    );
  }
}

class AppBarHomeMenu extends StatelessWidget {
  const AppBarHomeMenu({
    super.key,
    required this.title,
    this.canBack = true,
  });
  final String title;
  final bool canBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (canBack == true) {
          Navigator.pop(context);
        }
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Palette.mainRed,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.house,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
