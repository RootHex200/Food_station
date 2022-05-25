import 'package:add_to_cart/model/Favourite.dart';
import 'package:add_to_cart/model/item_check.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Check_favourite_item extends GetxController {
  static final user_email = ''.obs;
  RxList<Item_check> check_item = RxList<Item_check>([]);
  static final pd_name = ''.obs;

  void onInit() {
    super.onInit();
    check_item.bindStream(check_favourite_item());
  }

  Stream<List<Item_check>> check_favourite_item() {
    return FirebaseFirestore.instance
        .collection("Allusers")
        .doc(user_email.value)
        .collection("FavouriteData")
        .where("docid", isEqualTo: pd_name.value)
        .snapshots()
        .map((query) =>
            query.docs.map((item) => Item_check.fromMap(item)).toList());
  }
}
