import 'package:add_to_cart/Controller/Controller.dart';
import 'package:add_to_cart/Controller/cart_controller.dart';
import 'package:add_to_cart/Controller/favourite_controller.dart';
import 'package:add_to_cart/Controller/check_cart_item.dart';
import 'package:add_to_cart/Controller/check_favourite_item.dart';
import 'package:add_to_cart/model/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Firestore_controller extends GetxController {
  RxList<Product> products = RxList<Product>([]);
  void onInit() {
    super.onInit();
    products.bindStream(getProduct());
    Controller().onInit();
  }

  User_info_save(username, email, password, city) async {
    CollectionReference users = FirebaseFirestore.instance
        .collection('Allusers')
        .doc(email.toString())
        .collection("userinfo");

    await users
        .add({
          "user_name": username,
          "user_email": email,
          "password": password,
          "city_name": city,
        })
        .then((value) => Fluttertoast.showToast(msg: 'User added'))
        .catchError((e) => print(e));
  }

  Stream<List<Product>> getProduct() => FirebaseFirestore.instance
      .collection("productdata")
      .snapshots()
      .map((query) => query.docs.map((item) => Product.formMap(item)).toList());
}
