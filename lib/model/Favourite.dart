import 'package:cloud_firestore/cloud_firestore.dart';

class Favourite {
  String? product_name;
  String? short_name;
  int? price;
  int? itemcount;
  String? image;
  String? docid;

  Favourite(
      {this.product_name,
      this.short_name,
      this.price,
      this.itemcount,
      this.docid,
      this.image});

  Favourite.fromMap(DocumentSnapshot documentSnapshot) {
    docid = documentSnapshot.id;
    product_name = documentSnapshot["product_name"];
    short_name = documentSnapshot["short_name"];
    price = documentSnapshot["price"];
    itemcount = documentSnapshot["itemcount"];
    image = documentSnapshot["image"];
  }
}
