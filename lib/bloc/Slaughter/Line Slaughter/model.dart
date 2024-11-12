class LineHistory_Model {
  int? id;
  int? order;
  String? date;
  String? remark;

  LineHistory_Model({this.id, this.order, this.date, this.remark});
}

class LineLot {
  int? id;
  String? lot_num;

  String? farm_name;
  LineLot({this.id, this.lot_num, this.farm_name});

}
