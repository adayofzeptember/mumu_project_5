import 'package:intl/intl.dart';

String convertDate(String buddhistDate) {
  List<String> parts = buddhistDate.split('/');

  int day = int.parse(parts[0]);
  int month = int.parse(parts[1]);
  int yearBE = int.parse(parts[2]);

  int yearCE = yearBE - 543;
  

  DateTime gregorianDate = DateTime(yearCE, month, day);

  return DateFormat('yyyy-MM-dd').format(gregorianDate);
}
