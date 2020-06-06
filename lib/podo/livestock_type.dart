class LivestockType {
  int livestockId;
  String livestockName;
  String notes;
  bool deleted;

  LivestockType({this.livestockId, this.livestockName, this.notes, this.deleted});

  LivestockType.fromJson(Map<String, dynamic> json){
    livestockId = json['livestockTypeId'];
    livestockName = json['livestockName'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.livestockId != null) {
      data['livestockTypeId'] = this.livestockId.toString();
    }
    data['livestockName'] = this.livestockName;
    data['notes'] = this.notes;
    return data;
  }
}