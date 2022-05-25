//import 'dart:html';

import 'package:add_to_cart/Controller/cart_controller.dart';
import 'package:add_to_cart/Controller/check_cart_item.dart';
import 'package:add_to_cart/Controller/check_favourite_item.dart';
import 'package:add_to_cart/Controller/favourite_controller.dart';
import 'package:add_to_cart/Controller/firestore_controller.dart';
import 'package:add_to_cart/Controller/userinfo_controller.dart';
import 'package:add_to_cart/screen/navpages/Home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth_controller extends GetxController {
  final _auth = FirebaseAuth.instance;
  Firestore_controller firestore_controller = Get.put(Firestore_controller());
  final auth_checking_regi = false.obs;
  final auth_checking_log = false.obs;
  final current_auth_state = false.obs;
  final credentialupdate = false.obs;
  final sing_out = false.obs;

  user_current_check() async {
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        current_auth_state.value = false;
        print('User is currently signed out!');
      } else {
        CartController.user_mail.value = user.email.toString();
        Favouritecontroller.user_email.value = user.email.toString();
        Check_cart_item.user_mail.value = user.email.toString();
        Check_favourite_item.user_email.value = user.email.toString();
        Userinfo.user_email.value = user.email.toString();
        current_auth_state.value = true;
        print('User is signed in!');
      }
    });
  }

  User_register(username, email, password, city) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      firestore_controller.User_info_save(username, email, password, city);
      auth_checking_regi.value = true;
    }).catchError((e) => print(e));
  }

  User_login(email, password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      auth_checking_log.value = true;
    }).catchError((e) => print(e));
  }

  User_logout() async {
    await FirebaseAuth.instance.signOut().then((value) {
      sing_out.value = true;
    }).catchError((e) => print(e));
  }

  UserUpdateCredential(email, password) async {
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("user sing out");
      } else {
        print(user.email);
        user.updateEmail(email).then((value) async {
          await FirebaseAuth.instance.authStateChanges().listen((User? user) {
            if (user == null) {
              print("User sing oout");
            } else {
              user
                  .updatePassword(password)
                  .then((value) => credentialupdate.value = true)
                  .catchError((e) => print(e));
            }
          });
        }).catchError((e) => print("not updated "));
      }
    });
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => Get.to(Home_pages()))
        .catchError((e) => print("not singing......."));
  }
}
