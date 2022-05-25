import 'package:add_to_cart/Controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Other_singin_method extends StatelessWidget {
  Other_singin_method({Key? key}) : super(key: key);
  List data = ["google.png", "apple.png", "facebook.png"];
  @override
  Widget build(BuildContext context) {
    Auth_controller auth_controller = Get.put(Auth_controller());
    return Container(
      width: MediaQuery.of(context).size.width.w,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(3, (index) {
            return InkWell(
              onTap: () {
                if (index == 0) {
                  auth_controller.signInWithGoogle();
                  print("google sing in");
                }
              },
              child: Container(
                height: 70.h,
                width: 95.h,
                margin: EdgeInsets.only(left: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.white,
                        width: 4)),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/images/" + data[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          })),
    );
  }
}
