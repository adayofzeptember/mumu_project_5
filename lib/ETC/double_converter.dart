String convertToDouble(String value) {
  try {
    double result = double.parse(value);

    return result.toStringAsFixed(2);
  } catch (e) {
    print("Error: $e");
    return "0.00";
  }
}
