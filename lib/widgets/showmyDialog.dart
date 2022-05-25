import 'package:add_to_cart/screen/Pages/Main_pages.dart';
import 'package:add_to_cart/screen/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Showmydialog extends StatelessWidget {
  final String messsage;
  final String text_button;
  final String image;
  Showmydialog(
      {Key? key,
      required this.messsage,
      required this.text_button,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Image(
          height: 80.h,
          width: 60.w,
          image: AssetImage("assets/images/" + image.toString())),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Center(
                child: Text(
              messsage.toString(),
              style: TextStyle(fontSize: 20.sp),
            ))
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            text_button.toString(),
            style: TextStyle(fontSize: 23.sp,color: Colors.green.shade500),
          ),
          onPressed: () {
            if (text_button == "Go to") {
              Navigator.of(context).pop();
              Get.to(Mainpage());
            } else if (text_button == "ok") {
              Get.to(Login_page());
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
