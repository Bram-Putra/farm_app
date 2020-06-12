import 'package:farmapp/podo/materi.dart';

class FeedingMaterial {
  int feedingMaterialId;
  int orderNumber;
  Materi material;
  double quantity;

  FeedingMaterial() {}

  FeedingMaterial.fromJson(Map<String, dynamic> json){
    feedingMaterialId = json['feedingMaterialId'];
    orderNumber = json['orderNumber'];
    quantity = json['quantity'];
    var jsonMaterial = json['material'];
    if(jsonMaterial!=null) {
      material = Materi.fromJson(jsonMaterial);
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.feedingMaterialId!=null) {
      data['feedingMaterialId'] = this.feedingMaterialId;
    }
    data['material'] = this.material;
    data['orderNumber'] = this.orderNumber;
    data['quantity'] = this.quantity;
    return data;
  }
}

