import 'dart:io';

import 'package:add_to_cart/Controller/Controller.dart';
import 'package:add_to_cart/Controller/cart_controller.dart';
import 'package:add_to_cart/Controller/favourite_controller.dart';
import 'package:add_to_cart/Controller/auth_controller.dart';
import 'package:add_to_cart/screen/Pages/update_userinfo.dart';
import 'package:add_to_cart/screen/Pages/login_page.dart';
import 'package:add_to_cart/widgets/colors.dart';
import 'package:add_to_cart/widgets/showmyDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Setting_page extends HookWidget {
  const Setting_page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    final Auth_controller auth_controller = Get.put(Auth_controller());
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
              child: Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                children: [
                  Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40.r)),
                        image: DecorationImage(
                            image: AssetImage("assets/images/mario.png"))),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sabitur Rahman",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.sp),
                      ),
                      Text(
                        "Edit personl details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21.sp,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 38, 36, 36),
                      borderRadius: BorderRadius.all(Radius.circular(40.r)),
                    ),
                    child: Icon(
                      Icons.dark_mode_rounded,
                      size: 40.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    "Dark Mode",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
                  ),
                  Expanded(child: Container()),
                  Obx(() => Switch(
                        value: controller.darkSwitch.value,
                        onChanged: (value) {
                          controller.darkcheck(value);

                          if (controller.darkSwitch.value) {
                            Get.changeTheme(ThemeData.dark());
                          } else {
                            Get.changeTheme(ThemeData.light());
                          }
                        },
                        activeColor: AppColor.red_bg,
                        hoverColor: AppColor.red_bg,
                        inactiveTrackColor: Colors.black,
                        inactiveThumbColor: Colors.blue,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w),
              child: Text(
                "Profile",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 20.sp),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade500,
                      borderRadius: BorderRadius.all(Radius.circular(40.r)),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 40.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    "Dark Mode",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
                  ),
                  Expanded(child: Container()),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              onTap: () {
                Get.to(Update_userinfo());
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Row(
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(40.r)),
                      ),
                      child: Icon(
                        Icons.key_rounded,
                        size: 40.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      "Change Password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.sp),
                    ),
                    Expanded(child: Container()),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w),
              child: Text(
                "Notifications",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 20.sp),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(40.r)),
                    ),
                    child: Icon(
                      Icons.circle_notifications,
                      size: 40.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    "Notifications",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
                  ),
                  Expanded(child: Container()),
                  Obx(() => Switch(
                        value: controller.notificationSwitch.value,
                        onChanged: controller.notificationcheck,
                        activeColor: AppColor.red_bg,
                        hoverColor: AppColor.red_bg,
                        inactiveTrackColor: Colors.black,
                        inactiveThumbColor: Colors.blue,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w),
              child: Text(
                "Regional",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 20.sp),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 127, 119, 243),
                      borderRadius: BorderRadius.all(Radius.circular(40.r)),
                    ),
                    child: Icon(
                      Icons.language,
                      size: 40.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    "Language",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
                  ),
                  Expanded(child: Container()),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              onTap: () {
                auth_controller.User_logout();
                Future.delayed(Duration(milliseconds: 20), () {
                  _showMyDialog(
                      context, "checked.png", "Logout Sucessfully", "");
                  Future.delayed(Duration(milliseconds: 1000), () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else {
                      exit(0);
                    }
                  });
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Row(
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 227, 110, 63),
                        borderRadius: BorderRadius.all(Radius.circular(40.r)),
                      ),
                      child: Icon(
                        Icons.logout,
                        size: 40.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.sp),
                    ),
                    Expanded(child: Container()),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                "App version 2.0.2",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 20.sp),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _showMyDialog(context, image, message, text_button) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Showmydialog(
            messsage: message, text_button: text_button, image: image);
      },
    );
  }
}
