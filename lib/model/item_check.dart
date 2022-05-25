




import 'package:cloud_firestore/cloud_firestore.dart';

class Item_check {
  String? product_name;
  String? short_name;
  int? price;
  int? itemcount;
  String? image;

  Item_check(
      {this.product_name,
      this.short_name,
      this.price,
      this.itemcount,
      this.image});

  Item_check.fromMap(DocumentSnapshot documentSnapshot) {
    product_name = documentSnapshot["product_name"];
    short_name = documentSnapshot["short_name"];
    price = documentSnapshot["price"];
    itemcount = documentSnapshot["itemcount"];
    image = documentSnapshot["image"];
  }
}
