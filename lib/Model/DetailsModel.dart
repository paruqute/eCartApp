// To parse this JSON data, do
//
//     final detailsModel = detailsModelFromJson(jsonString);

import 'dart:convert';

DetailsModel detailsModelFromJson(String str) => DetailsModel.fromJson(json.decode(str));

String detailsModelToJson(DetailsModel data) => json.encode(data.toJson());

class DetailsModel {
  DetailsModel({
    this.name,
    this.id,
    this.sku,
    this.evoucher,
    this.ecard,
    this.description,
    this.shortDescription,
    this.brand,
    this.image,
    this.hasOptions,
    this.productTag,
    this.preorder,
    this.preorderinfo,
    this.price,
    this.specialPrice,
    this.status,
    this.attrs,
  });

  String name;
  String id;
  String sku;
  int evoucher;
  int ecard;
  String description;
  dynamic shortDescription;
  String brand;
  List<String> image;
  int hasOptions;
  String productTag;
  String preorder;
  Preorderinfo preorderinfo;
  double price;
  int specialPrice;
  int status;
  Attrs attrs;

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
    name: json["name"],
    id: json["id"],
    sku: json["sku"],
    evoucher: json["evoucher"],
    ecard: json["ecard"],
    description: json["description"],
    shortDescription: json["short_description"],
    brand: json["brand"],
    image: List<String>.from(json["image"].map((x) => x)),
    hasOptions: json["has_options"],
    productTag: json["product_tag"],
    preorder: json["preorder"],
    preorderinfo: Preorderinfo.fromJson(json["preorderinfo"]),
    price: json["price"].toDouble(),
    specialPrice: json["special_price"],
    status: json["status"],
    attrs: Attrs.fromJson(json["attrs"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "sku": sku,
    "evoucher": evoucher,
    "ecard": ecard,
    "description": description,
    "short_description": shortDescription,
    "brand": brand,
    "image": List<dynamic>.from(image.map((x) => x)),
    "has_options": hasOptions,
    "product_tag": productTag,
    "preorder": preorder,
    "preorderinfo": preorderinfo.toJson(),
    "price": price,
    "special_price": specialPrice,
    "status": status,
    "attrs": attrs.toJson(),
  };
}

class Attrs {
  Attrs({
    this.color,
    this.specs,
  });

  String color;
  List<Spec> specs;

  factory Attrs.fromJson(Map<String, dynamic> json) => Attrs(
    color: json["color"],
    specs: List<Spec>.from(json["specs"].map((x) => Spec.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "color": color,
    "specs": List<dynamic>.from(specs.map((x) => x.toJson())),
  };
}

class Spec {
  Spec({
    this.value,
    this.icon,
    this.title,
  });

  String value;
  String icon;
  String title;

  factory Spec.fromJson(Map<String, dynamic> json) => Spec(
    value: json["value"],
    icon: json["icon"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "icon": icon,
    "title": title,
  };
}

class Preorderinfo {
  Preorderinfo({
    this.preorderType,
    this.preorderPercentage,
    this.preorderMsg,
    this.freePreorderNote,
    this.preOrderQty,
    this.isPreorderProduct,
    this.availabilityOn,
  });

  String preorderType;
  String preorderPercentage;
  String preorderMsg;
  String freePreorderNote;
  String preOrderQty;
  String isPreorderProduct;
  String availabilityOn;

  factory Preorderinfo.fromJson(Map<String, dynamic> json) => Preorderinfo(
    preorderType: json["preorderType"],
    preorderPercentage: json["preorderPercentage"],
    preorderMsg: json["preorderMsg"],
    freePreorderNote: json["freePreorderNote"],
    preOrderQty: json["preOrderQty"],
    isPreorderProduct: json["isPreorderProduct"],
    availabilityOn: json["availabilityOn"],
  );

  Map<String, dynamic> toJson() => {
    "preorderType": preorderType,
    "preorderPercentage": preorderPercentage,
    "preorderMsg": preorderMsg,
    "freePreorderNote": freePreorderNote,
    "preOrderQty": preOrderQty,
    "isPreorderProduct": isPreorderProduct,
    "availabilityOn": availabilityOn,
  };
}
