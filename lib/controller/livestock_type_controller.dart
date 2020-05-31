import 'package:farmapp/podo/livestock_type.dart';

class LivestockTypeController {
  //TODO: [Mr. I] please populate LivestockType here:
  List<LivestockType> _listLivestockType = [];
  LivestockType _livestockType1;
  LivestockType _livestockType2;
  LivestockType _livestockType3;
  LivestockType _livestockType4;

  LivestockTypeController() {
    //TODO: [Mr. I] I use this as dummy data for LivestockType, please amend accordingly:
    _livestockType1 = LivestockType(livestockId: 1, livestockName: 'White Chicken', deleted: false);
    _livestockType2 = LivestockType(livestockId: 2, livestockName: 'Red Chicken', deleted: false);
    _livestockType3 = LivestockType(livestockId: 3, livestockName: 'Yellow Chicken', deleted: false);
    _livestockType4 = LivestockType(livestockId: 4, livestockName: 'Blue Chicken', deleted: false);
    _listLivestockType = [_livestockType1, _livestockType2, _livestockType3, _livestockType4];
  }

  List<LivestockType> getListLivestockType() {
    return _listLivestockType;
  }

  LivestockType getLivestockType(int index) {
    return _listLivestockType[index];
  }
}