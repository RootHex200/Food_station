
import 'package:add_to_cart/model/item_check.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Check_cart_item extends GetxController {
  RxList<Item_check> check_cart = RxList<Item_check>([]);
  static final pd_name = ''.obs;
  static final user_mail = ''.obs;

  void onInit() {
    super.onInit();
    check_cart.bindStream(check_cart_item());
  }

  Stream<List<Item_check>> check_cart_item() {
    return FirebaseFirestore.instance
        .collection("Allusers")
        .doc(user_mail.value)
        .collection("Cart")
        .where("docid", isEqualTo: pd_name.value)
        .snapshots()
        .map((query) =>
            query.docs.map((item) => Item_check.fromMap(item)).toList());
  }

}
