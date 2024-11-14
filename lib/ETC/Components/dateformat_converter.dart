import 'package:intl/intl.dart';

String convertDate(String buddhistDate) {
  // Split the date string
  List<String> parts = buddhistDate.split('/');
  
  // Convert each part to integer
  int day = int.parse(parts[0]);
  int month = int.parse(parts[1]);
  int yearBE = int.parse(parts[2]);
  
  // Adjust the Buddhist year to the Gregorian year
  int yearCE = yearBE - 543;

  // Create a DateTime object
  DateTime gregorianDate = DateTime(yearCE, month, day);

  // Format the date to the desired format
  return DateFormat('yyyy-MM-dd').format(gregorianDate);
}
