import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  // ignore: non_constant_identifier_names
  String? product_name;
  // ignore: non_constant_identifier_names
  String? short_details;
  String? description;
  String? price;
  String? min;
  String? rating;
  String? kcal;
  List? image;
  String? docid;

  Product(
      // ignore: non_constant_identifier_names
      {required this.product_name,
      // ignore: non_constant_identifier_names
      required this.short_details,
      required this.description,
      required this.price,
      required this.min,
      required this.rating,
      required this.kcal,
      required this.docid,
      required this.image});

  Product.formMap(DocumentSnapshot documentSnapshot) {
    docid = documentSnapshot.id;
    description = documentSnapshot["description"];
    image = documentSnapshot["image"] ?? ["error", "error"];
    kcal = documentSnapshot["kcal"];
    min = documentSnapshot["min"];
    price = documentSnapshot["price"];
    product_name = documentSnapshot["product_name"];
    rating = documentSnapshot["rating"];
    short_details = documentSnapshot["short_details"];
  }
}
