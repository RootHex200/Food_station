import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  String? product_name;
  String? short_name;
  int? price;
  int? itemcount;
  int? staticprice;
  String? image;
  String? docid;

  Cart(
      {this.product_name,
      this.short_name,
      this.price,
      this.itemcount,
      this.docid,
      this.staticprice,
      this.image});

  Cart.fromMap(DocumentSnapshot documentSnapshot) {
    docid = documentSnapshot.id;
    staticprice = documentSnapshot["staticprice"];
    product_name = documentSnapshot["product_name"];
    short_name = documentSnapshot["short_name"];
    price = documentSnapshot["price"];
    itemcount = documentSnapshot["itemcount"];
    image = documentSnapshot["image"];
  }
}
