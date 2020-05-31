class GroupCategory {
  int groupCategoryId;
  String groupCategoryName;
  String groupName;
  GroupCategory parent;
  bool deleted;

  GroupCategory({this.groupCategoryId, this.groupCategoryName, this.groupName, this.parent, this.deleted});
}