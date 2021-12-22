class ProfileModel {
  bool activated;
  String createdBy;
  String createdDate;
  String email;
  int id;
  String imageUrl;
  String langKey;
  String lastModifiedBy;
  String lastModifiedDate;
  String login;
  String name;
  List<Roles> roles;
  String userType;

  ProfileModel(
      {this.activated,
      this.createdBy,
      this.createdDate,
      this.email,
      this.id,
      this.imageUrl,
      this.langKey,
      this.lastModifiedBy,
      this.lastModifiedDate,
      this.login,
      this.name,
      this.roles,
      this.userType});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    activated = json['activated'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    email = json['email'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    langKey = json['langKey'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedDate = json['lastModifiedDate'];
    login = json['login'];
    name = json['name'];
    if (json['roles'] != null) {
      roles = new List<Roles>();
      json['roles'].forEach((v) {
        roles.add(new Roles.fromJson(v));
      });
    }
    userType = json['userType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activated'] = this.activated;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['email'] = this.email;
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['langKey'] = this.langKey;
    data['lastModifiedBy'] = this.lastModifiedBy;
    data['lastModifiedDate'] = this.lastModifiedDate;
    data['login'] = this.login;
    data['name'] = this.name;
    if (this.roles != null) {
      data['roles'] = this.roles.map((v) => v.toJson()).toList();
    }
    data['userType'] = this.userType;
    return data;
  }
}

class Roles {
  List<String> authorities;
  int id;
  String name;
  String roleType;

  Roles({this.authorities, this.id, this.name, this.roleType});

  Roles.fromJson(Map<String, dynamic> json) {
    authorities = json['authorities'].cast<String>();
    id = json['id'];
    name = json['name'];
    roleType = json['roleType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorities'] = this.authorities;
    data['id'] = this.id;
    data['name'] = this.name;
    data['roleType'] = this.roleType;
    return data;
  }
}
