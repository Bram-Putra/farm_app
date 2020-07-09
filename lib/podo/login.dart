class Login {
  String userName;
  String userPassword;

  Login({this.userName, this.userPassword});

  Login.fromJson(Map<String, dynamic> json){
    userName = json['userName'];
    userPassword = json['userPassword'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['userPassword'] = this.userPassword;
    return data;
  }
}