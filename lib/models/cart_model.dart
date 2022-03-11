import 'package:flutter/material.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.isExist = false,
      this.quantity = 1,
      this.time});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    img = json['img'];
    isExist = json['isExist'];
    time = json['time'];
  }
}
