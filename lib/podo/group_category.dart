class GroupCategory {
  int groupCategoryId;
  String groupCategoryName;
  String groupName;
  GroupCategory parent;
  bool deleted;

  GroupCategory({this.groupCategoryId, this.groupCategoryName, this.groupName, this.parent, this.deleted});

  GroupCategory.fromJson(Map<String, dynamic> json){
    groupCategoryId = json['groupCategoryId'];
    groupCategoryName = json['groupCategoryName'];
    groupName = json['groupName'];
    var jsonParent = json['parent'];
    if(jsonParent!=null) {
      parent = GroupCategory();
      parent.groupCategoryId = jsonParent['groupCategoryId'];
      parent.groupCategoryName = jsonParent['groupCategoryName'];
      parent.groupName = jsonParent['groupName'];
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.groupCategoryId!=null) {
      data['groupCategoryId'] = this.groupCategoryId.toString();
    }
    data['groupCategoryName'] = this.groupCategoryName;
    data['groupName'] = this.groupName;
    data['parent'] = this.parent;

    return data;
  }
}