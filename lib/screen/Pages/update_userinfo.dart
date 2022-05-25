import 'package:add_to_cart/Controller/userinfo_controller.dart';
import 'package:add_to_cart/screen/Pages/Main_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/colors.dart';
import '../../widgets/showmyDialog.dart';

class Update_userinfo extends HookWidget {
  const Update_userinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final username = useTextEditingController();
    final cityname = useTextEditingController();
    final userinfo = Get.put(Userinfo());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
              child: Center(
                  child: Text(
                "Change your Password",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp),
              ))),
          SizedBox(
            height: 40.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black, fontSize: 20.sp),
                  controller: username,
                  validator: (value) {
                    if (value == "") {
                      return "Required";
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mark_email_unread_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            style: BorderStyle.none,
                          )),
                      labelText: "Enter Username",
                      labelStyle:
                          TextStyle(color: Colors.black54, fontSize: 20.sp)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black, fontSize: 20.sp),
                  controller: cityname,
                  validator: (value) {
                    if (value == "") {
                      return "Required";
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mark_email_unread_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            style: BorderStyle.none,
                          )),
                      labelText: "Enter City name",
                      labelStyle:
                          TextStyle(color: Colors.black54, fontSize: 20.sp)),
                )
              ],
            )),
          ),
          SizedBox(
            height: 25.h,
          ),
          InkWell(
            onTap: () {
              userinfo.updateuserdata(username.text, cityname.text);
              Future.delayed(Duration(seconds: 2), () {
                if (userinfo.infoupdate.value) {
                  _showMyDialog(context, "checked.png",
                      "Credential Update successfully", " OK ");
                  Future.delayed(Duration(seconds: 1), () {
                    Get.to(Mainpage());
                  });
                } else {
                  _showMyDialog(context, "cancel.png",
                      "Credential not Updated Error,Try Agin", " OK ");
                }
              });
            },
            child: Container(
              height: 75.h,
              width: double.maxFinite,
              margin: EdgeInsets.only(left: 30.w, right: 30.w),
              decoration: BoxDecoration(
                  color: AppColor.red_bg,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Center(
                  child: Text(
                "Change",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 23.sp),
              )),
            ),
          ),
        ],
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
