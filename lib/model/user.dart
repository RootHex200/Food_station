import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? name;
  String? email;
  String? city;
  String? division;
  String? id;

  User({this.name, this.email, this.city, this.division});

  User.formMap(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    name = documentSnapshot["user_name"];
    email = documentSnapshot["user_email"];
    city = documentSnapshot["city_name"];
  }
}
