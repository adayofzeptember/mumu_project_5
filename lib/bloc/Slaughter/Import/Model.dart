class UI2_4 {
  String? number;
  String? weigh;
  String? grade;
  String? howitlooks;
  String? type;

  UI2_4({this.grade, this.howitlooks, this.number, this.type, this.weigh});
}

class Weight_History {
  String? order;
  String? id;
  String? weight;
  String? pig_type;
  String? weight_type;
  String? pig_discount;

  Weight_History(
      {required this.order,
      required this.id,
      required this.weight,
      required this.pig_type,
      required this.weight_type,
      required this.pig_discount});
}

class Abnormal {
  int id;
  int amount;

  Abnormal({required this.id, required this.amount});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "amount": amount,
    };
  }
}
