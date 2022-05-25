import 'package:add_to_cart/Controller/Controller.dart';
import 'package:add_to_cart/model/Cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CollectionReference cart_instance = FirebaseFirestore.instance
      .collection('Allusers')
      .doc(user_mail.value)
      .collection("Cart");
  RxList<Cart> addtocart = RxList<Cart>([]);
  var totalprices = 0.obs;
  static final user_mail = ''.obs;
  void onInit() {
    super.onInit();
    addtocart.bindStream(getCart());
    Controller().onInit();
  }

  addto_cart(productname, shortname, price, image, docid) async {
    await cart_instance
        .add({
          "docid": docid,
          "product_name": productname,
          "short_name": shortname,
          "price": int.parse(price),
          "staticprice":int.parse(price),
          "itemcount": 1.toInt(),
          "image": image
        })
        .then((value) => Fluttertoast.showToast(msg: "Add to cart"))
        .catchError((e) => print(e));
  }

  updatedata(docid, itemvalue,index) async {
    await cart_instance
        .doc(docid)
        .update({"itemcount": itemvalue,"price":addtocart[index].staticprice! * itemvalue!})
        .then((value) => Sum())
        .catchError((e) => print("eeror"));
  }

  deletecartitme(docid) async {
    await cart_instance
        .doc(docid)
        .delete()
        .then((value) => Sum())
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Stream<List<Cart>> getCart() => FirebaseFirestore.instance
      .collection("Allusers")
      .doc(user_mail.value)
      .collection("Cart")
      .snapshots()
      .map((query) => query.docs.map((item) => Cart.fromMap(item)).toList());

  Sum() {
    var result = addtocart.isNotEmpty
        ? addtocart
            .map((element) => element.price)
            .reduce((value, element) => value! + element!)
        : 0;

    totalprices.value = result!;
    
  }
}
