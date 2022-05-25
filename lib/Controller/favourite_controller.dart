import 'package:add_to_cart/Controller/Controller.dart';
import 'package:add_to_cart/model/Favourite.dart';
import 'package:add_to_cart/model/Cart.dart';
import 'package:add_to_cart/model/item_check.dart';
import 'package:add_to_cart/screen/Pages/Details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Favouritecontroller extends GetxController {
  CollectionReference favourite_instance = FirebaseFirestore.instance
      .collection("Allusers")
      .doc(user_email.value)
      .collection("FavouriteData");
  static final user_email = ''.obs;
  RxList<Favourite> getfavouritedata = RxList<Favourite>([]);
  void onInit() {
    super.onInit();
    getfavouritedata.bindStream(getFavourite());
    Controller().onInit();
  }

  addto_favourite(productname, shortname, price, image, docid) async {
    await favourite_instance
        .add({
          "docid": docid,
          "product_name": productname,
          "short_name": shortname,
          "price": int.parse(price),
          "itemcount": 0.toInt(),
          "image": image
        })
        .then((value) => Fluttertoast.showToast(msg: value.toString()))
        .catchError((e) => print(e));
  }

  deletefavouriteitme(docid) async {
    await favourite_instance
        .doc(docid)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Stream<List<Favourite>> getFavourite() => favourite_instance
      .snapshots()
      .map((query) =>
          query.docs.map((item) => Favourite.fromMap(item)).toList());
}
