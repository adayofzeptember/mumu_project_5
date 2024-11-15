// date_time_picker.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePickerHelper_Component {
  // Method for selecting a date
  static Future<void> selectDate(
    BuildContext context, {
    required Function(String) onDateSelected,
  }) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      // Adding 543 years to the picked date
      final DateTime buddhistDate = DateTime(
        pickedDate.year + 543,
        pickedDate.month,
        pickedDate.day,
      );

      // Formatting the date
      String formattedDate = DateFormat('dd/MM/yyyy').format(buddhistDate);
      onDateSelected(
          formattedDate); // Use the callback to pass the selected date
    }
  }

  static Future<void> selectTime(
    BuildContext context, {
    required Function(String) onTimeSelected,
  }) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final now = DateTime.now();
      final DateTime fullDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      String formattedTime = DateFormat('HH:mm:ss').format(fullDateTime);
      onTimeSelected(formattedTime);
    }
  }
}
