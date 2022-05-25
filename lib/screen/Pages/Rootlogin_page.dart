import 'dart:io';

import 'package:add_to_cart/Controller/Controller.dart';
import 'package:add_to_cart/screen/Pages/Register_page.dart';
import 'package:add_to_cart/screen/Pages/login_page.dart';
import 'package:add_to_cart/widgets/colors.dart';
import 'package:add_to_cart/widgets/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/button.dart';

class Root_page extends StatelessWidget {
  const Root_page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    var appwidth = MediaQuery.of(context).size.width;
    var appheight = MediaQuery.of(context).size.height;
    print("appwidth$appwidth and appheight$appheight");
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColor.root_page_bg,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 450.h,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 25.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r)),
                child: const Image(
                    height: double.maxFinite,
                    image:
                        AssetImage("assets/images/eCommerce-Statistics.jpg")),
              ),
              Obx(() {
                return controller.progress.value
                    ? const Center(child: CircularProgressIndicator())
                    : const Text("");
              }),
              SizedBox(
                height: 30.h,
              ),
              Center(
                  child: Text(
                Appstring.root_page[0],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
              )),
              SizedBox(
                height: 10.h,
              ),
              Center(
                  child: Text(
                Appstring.root_page[1],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
              )),
              SizedBox(
                height: 25.h,
              ),
              Center(
                  child: Text(
                Appstring.root_page[2],
                style: TextStyle(color: Colors.black54, fontSize: 19.sp),
              )),
              SizedBox(
                height: 5.h,
              ),
              Center(
                  child: Text(
                Appstring.root_page[3],
                style: TextStyle(color: Colors.black54, fontSize: 19.sp),
              )),
              SizedBox(
                height: 40.h,
              ),
              appwidth <= 360
                  ? Container(
                      height: 70.h,
                      width: appwidth,
                      margin: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Obx(
                        () {
                          return FittedBox(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.regi();

                                      Future.delayed(const Duration(seconds: 2),
                                          () {
                                        Get.to(Register_page());
                                        controller.progress.value = false;
                                      });
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 130.w,
                                      decoration: BoxDecoration(
                                          color: controller.regiCheck.value
                                              ? AppColor.regi_bg
                                              : AppColor.sing_bg,
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      child: Center(
                                        child: Text(
                                          "Register",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22.sp,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.sing();
                                      Future.delayed(const Duration(seconds: 2),
                                          () {
                                        Get.to(Login_page());
                                        controller.progress.value = false;
                                      });
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 130.w,
                                      decoration: BoxDecoration(
                                          color: controller.singCheck.value
                                              ? AppColor.regi_bg
                                              : AppColor.sing_bg,
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      child: Center(
                                        child: Text(
                                          "Sing In",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22.sp,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          );
                        },
                      ),
                    )
                  : Container(
                      height: 70.h,
                      width: appwidth,
                      margin: EdgeInsets.only(left: 20.h, right: 20.h),
                      child: Obx(
                        () {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.regi();

                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      Get.to(Register_page());
                                      controller.progress.value = false;
                                    });
                                  },
                                  // child: Button_widgets(height: double.maxFinite, width: 160.w, txt: 'Register',colors: Colors.black,fontsize: 22.sp,fontWeight: FontWeight.bold,),
                                  child: Container(
                                    height: double.maxFinite,
                                    width: 160.w,
                                    decoration: BoxDecoration(
                                        color: controller.regiCheck.value
                                            ? AppColor.regi_bg
                                            : AppColor.sing_bg,
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    child: Center(
                                      child: Text(
                                        "Register",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22.sp,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.sing();
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      Get.to(Login_page());
                                      controller.progress.value = false;
                                    });
                                  },
                                  child: Container(
                                    height: double.maxFinite,
                                    width: 160.w,
                                    decoration: BoxDecoration(
                                        color: controller.singCheck.value
                                            ? AppColor.regi_bg
                                            : AppColor.sing_bg,
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    child: Center(
                                      child: Text(
                                        "SingIn",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22.sp,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ]);
                        },
                      ),
                    ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
