class Carcass_HistoryModel {
  String total;
  String result;
  List orders;

  Carcass_HistoryModel(
      {required this.orders, required this.result, required this.total});
}

class LSQ_HistoryModel {
  int id, order;
  String weight, bf3, bf4, b, lsq;
 

  LSQ_HistoryModel(
      {required this.id,
      required this.order,
 
      required this.b,
      required this.bf3,
      required this.lsq,
      required this.weight,
      required this.bf4});
}
