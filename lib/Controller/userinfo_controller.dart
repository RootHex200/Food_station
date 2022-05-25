import 'package:add_to_cart/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Userinfo extends GetxController {
  RxList<User> user_info = RxList<User>();
  static final user_email = "".obs;
  final infoupdate = false.obs;
  CollectionReference firestore = FirebaseFirestore.instance
      .collection("Allusers")
      .doc(user_email.isNotEmpty ? user_email.value : "")
      .collection("userinfo");
  @override
  void onInit() {
    super.onInit();
    user_info.bindStream(get_userinof());
  }

  updateuserdata(username, city) async {
    await firestore.doc(user_info.length != 0 ? user_info[0].id : "").update({
      "user_name": username,
      "city_name": city,
    }).then((value) {
      infoupdate.value = true;
    }).catchError((e) {
      infoupdate.value = false;
    });
  }

  Stream<List<User>> get_userinof() {
    return firestore
        .snapshots()
        .map((query) => query.docs.map((item) => User.formMap(item)).toList());
  }
}
