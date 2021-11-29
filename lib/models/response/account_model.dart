class AccountModel {
  AccountModel({this.responseModel, this.code, this.message, this.status});
  bool status;
  int code;
  String message;
  ResponseModel responseModel;
  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        responseModel: json['response'] == null
            ? null
            : ResponseModel.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "response": responseModel,
      };
}

class ResponseModel {
  ResponseModel({
    this.id,
    this.login,
    this.name,
    this.email,
    this.imageUrl,
    this.activated,
    this.langKey,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.roles,
    this.userType,
  });

  int id;
  String login;
  dynamic name;
  dynamic email;
  dynamic imageUrl;
  bool activated;
  dynamic langKey;
  String createdBy;
  DateTime createdDate;
  String lastModifiedBy;
  DateTime lastModifiedDate;
  List<dynamic> roles;
  String userType;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        id: json["id"],
        login: json["login"],
        name: json["name"],
        email: json["email"],
        imageUrl: json["imageUrl"],
        activated: json["activated"],
        langKey: json["langKey"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        lastModifiedBy: json["lastModifiedBy"],
        lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
        roles: List<dynamic>.from(json["roles"].map((x) => x)),
        userType: json["userType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login": login,
        "name": name,
        "email": email,
        "imageUrl": imageUrl,
        "activated": activated,
        "langKey": langKey,
        "createdBy": createdBy,
        "createdDate": createdDate.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "lastModifiedDate": lastModifiedDate.toIso8601String(),
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "userType": userType,
      };
}
