import 'package:farmapp/podo/group_category.dart';

class GroupCategoryDummy {
  List<GroupCategory> _listGroupCategory;
  GroupCategory _gcRegion1;
  GroupCategory _gcRegion2;

  GroupCategory _gcFarm11;
  GroupCategory _gcFarm12;
  GroupCategory _gcFarm21;
  GroupCategory _gcFarm22;

  GroupCategory _gcUnit111;
  GroupCategory _gcUnit112;
  GroupCategory _gcUnit113;
  GroupCategory _gcUnit121;
  GroupCategory _gcUnit122;
  GroupCategory _gcUnit123;
  GroupCategory _gcUnit211;
  GroupCategory _gcUnit212;
  GroupCategory _gcUnit213;
  GroupCategory _gcUnit221;
  GroupCategory _gcUnit222;
  GroupCategory _gcUnit223;

  GroupCategoryDummy() {
    _gcRegion1 = GroupCategory(groupCategoryId: 1, groupCategoryName: 'Region 1', groupName: 'Group Region', parent: null, deleted: false);
    _gcRegion2 = GroupCategory(groupCategoryId: 2, groupCategoryName: 'Region 2', groupName: 'Group Region', parent: null, deleted: false);

    _gcFarm11 = GroupCategory(groupCategoryId: 11, groupCategoryName: 'Farm 11', groupName: 'Group Farm', parent: _gcRegion1, deleted: false);
    _gcFarm12 = GroupCategory(groupCategoryId: 12, groupCategoryName: 'Farm 12', groupName: 'Group Farm', parent: _gcRegion1, deleted: false);
    _gcFarm21 = GroupCategory(groupCategoryId: 21, groupCategoryName: 'Farm 21', groupName: 'Group Farm', parent: _gcRegion2, deleted: false);
    _gcFarm22 = GroupCategory(groupCategoryId: 22, groupCategoryName: 'Farm 22', groupName: 'Group Farm', parent: _gcRegion2, deleted: false);

    _gcUnit111 = GroupCategory(groupCategoryId: 111, groupCategoryName: 'Unit 111', groupName: 'Group Unit', parent: _gcFarm11, deleted: false);
    _gcUnit112 = GroupCategory(groupCategoryId: 112, groupCategoryName: 'Unit 112', groupName: 'Group Unit', parent: _gcFarm11, deleted: false);
    _gcUnit113 = GroupCategory(groupCategoryId: 113, groupCategoryName: 'Unit 113', groupName: 'Group Unit', parent: _gcFarm11, deleted: false);
    _gcUnit121 = GroupCategory(groupCategoryId: 121, groupCategoryName: 'Unit 121', groupName: 'Group Unit', parent: _gcFarm12, deleted: false);
    _gcUnit122 = GroupCategory(groupCategoryId: 122, groupCategoryName: 'Unit 122', groupName: 'Group Unit', parent: _gcFarm12, deleted: false);
    _gcUnit123 = GroupCategory(groupCategoryId: 123, groupCategoryName: 'Unit 123', groupName: 'Group Unit', parent: _gcFarm12, deleted: false);
    _gcUnit211 = GroupCategory(groupCategoryId: 211, groupCategoryName: 'Unit 211', groupName: 'Group Unit', parent: _gcFarm21, deleted: false);
    _gcUnit212 = GroupCategory(groupCategoryId: 212, groupCategoryName: 'Unit 212', groupName: 'Group Unit', parent: _gcFarm21, deleted: false);
    _gcUnit213 = GroupCategory(groupCategoryId: 213, groupCategoryName: 'Unit 213', groupName: 'Group Unit', parent: _gcFarm21, deleted: false);
    _gcUnit221 = GroupCategory(groupCategoryId: 221, groupCategoryName: 'Unit 221', groupName: 'Group Unit', parent: _gcFarm22, deleted: false);
    _gcUnit222 = GroupCategory(groupCategoryId: 222, groupCategoryName: 'Unit 222', groupName: 'Group Unit', parent: _gcFarm22, deleted: false);
    _gcUnit223 = GroupCategory(groupCategoryId: 223, groupCategoryName: 'Unit 223', groupName: 'Group Unit', parent: _gcFarm22, deleted: false);

    _listGroupCategory = [
      _gcRegion1,
      _gcRegion2,

      _gcFarm11,
      _gcFarm12,
      _gcFarm21,
      _gcFarm22,

      _gcUnit111,
      _gcUnit112,
      _gcUnit113,
      _gcUnit121,
      _gcUnit122,
      _gcUnit123,
      _gcUnit211,
      _gcUnit212,
      _gcUnit213,
      _gcUnit221,
      _gcUnit222,
      _gcUnit223
    ];
  }

  GroupCategory getGroupCategory(int index) {
    return _listGroupCategory[index];
  }

  List<GroupCategory> getListGroupCategory() {
    return _listGroupCategory;
  }
}