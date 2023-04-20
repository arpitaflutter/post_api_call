// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.productOffer,
    required this.productCategory,
    required this.productImage,
    required this.productDesc,
    required this.productRate,
  });

  String id;
  String productName;
  String productPrice;
  String productOffer;
  String productCategory;
  String productImage;
  String productDesc;
  String productRate;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    productName: json["product_name"],
    productPrice: json["product_price"],
    productOffer: json["product_offer"],
    productCategory: json["product_category"],
    productImage: json["product_image"],
    productDesc: json["product_desc"],
    productRate: json["product_rate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "product_price": productPrice,
    "product_offer": productOffer,
    "product_category": productCategory,
    "product_image": productImage,
    "product_desc": productDesc,
    "product_rate": productRate,
  };
}
