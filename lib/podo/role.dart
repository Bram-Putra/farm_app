class Role {
  int roleId;
  String roleName;
  String notes;
  List<RoleModule> moduleList = [];

  Role({this.roleId, this.roleName, this.notes, this.moduleList});

  Role.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    roleName = json['roleName'];
    notes = json['notes'];
    moduleList = [];
    var jModuleList = json['moduleList'];
    if(jModuleList!=null){
      for(int i=0; i<jModuleList.length-1; i++){
        RoleModule rm = RoleModule.fromJson(jModuleList[i]);
        moduleList.add(rm);
      }
    }
  }
}

class RoleModule {
  int roleModuleId;
  Module module;
  bool readOnly;
  bool active;

  RoleModule({this.roleModuleId, this.module, this.readOnly, this.active});

  RoleModule.fromJson(Map<String, dynamic> json) {
    roleModuleId = json['roleModuleId'];
    var jModule = json['module'];
    if (jModule != null) {
      module = Module.fromJson(jModule);
    }
    readOnly = json['readOnly'];
    active = json['active'];
  }
}

class Module {
  int moduleId;
  String moduleName;
  String parentName;
  String moduleUrl;
  bool deleted;

  Module({this.moduleId, this.moduleName, this.parentName, this.moduleUrl, this.deleted});

  Module.fromJson(Map<String, dynamic> json){
    moduleId = json['moduleId'];
    moduleName = json['moduleName'];
    parentName = json['parentName'];
    moduleUrl = json['moduleUrl'];
    deleted = json['deleted'];
  }
}