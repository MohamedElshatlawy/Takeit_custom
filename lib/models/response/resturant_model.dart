class ResturantModel {
  ResturantModel({this.responseModel});

  ResponseModel responseModel;
  factory ResturantModel.fromJson(Map<String, dynamic> json) => ResturantModel(
        responseModel: json['response'] == null
            ? null
            : ResponseModel.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "response": responseModel,
      };
}

class ResponseModel {
  ResponseModel({
    this.id,
    this.restaurantId,
    this.name,
    this.branchName,
    this.config,
    this.logo,
    this.assets,
    this.workingHours,
    this.cuisines,
    this.location,
  });

  int id;
  int restaurantId;
  String name;
  String branchName;
  String config;
  String logo;
  List<Asset> assets;
  WorkingHours workingHours;
  List<Cuisine> cuisines;
  String location;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        id: json["id"],
        restaurantId: json["restaurantId"],
        name: json["name"],
        branchName: json["branchName"],
        config: json["config"],
        logo: json["logo"],
        assets: List<Asset>.from(json["assets"].map((x) => Asset.fromJson(x))),
        workingHours: WorkingHours.fromJson(json["workingHours"]),
        cuisines: List<Cuisine>.from(
            json["cuisines"].map((x) => Cuisine.fromJson(x))),
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "restaurantId": restaurantId,
        "name": name,
        "branchName": branchName,
        "config": config,
        "logo": logo,
        "assets": List<dynamic>.from(assets.map((x) => x.toJson())),
        "workingHours": workingHours.toJson(),
        "cuisines": List<dynamic>.from(cuisines.map((x) => x.toJson())),
        "location": location,
      };
}

class Asset {
  Asset({
    this.id,
    this.url,
    this.type,
    this.tags,
  });

  int id;
  String url;
  String type;
  List<Tag> tags;

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        id: json["id"],
        url: json["url"],
        type: json["type"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "type": type,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
      };
}

class Tag {
  Tag({
    this.id,
    this.name,
    this.merchant,
  });

  int id;
  String name;
  dynamic merchant;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        merchant: json["merchant"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "merchant": merchant,
      };
}

class Cuisine {
  Cuisine({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Cuisine.fromJson(Map<String, dynamic> json) => Cuisine(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class WorkingHours {
  WorkingHours({
    this.from,
    this.to,
  });

  String from;
  String to;

  factory WorkingHours.fromJson(Map<String, dynamic> json) => WorkingHours(
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
      };
}
