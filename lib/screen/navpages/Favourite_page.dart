import 'dart:io';

import 'package:add_to_cart/Controller/favourite_controller.dart';

import 'package:add_to_cart/widgets/colors.dart';
import 'package:add_to_cart/widgets/nav_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Favourite_pages extends StatelessWidget {
  Favourite_pages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      final favouritecontroller =
      Get.put(Favouritecontroller());
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else {
          exit(0);
        }
        return "".isBool;
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Get.to(Favourite_pages());
                    },
                    child: Nav_button(icons: Icon(Icons.arrow_back_rounded),color: Colors.grey.withOpacity(0.1),)
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      Text(
                        "Your Favourite",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  height: 600.h,
                  width: MediaQuery.of(context).size.width,
                  child: Obx(() => favouritecontroller.getfavouritedata.length != 0
                      ? ListView.builder(
                          itemCount: favouritecontroller.getfavouritedata.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                favouritecontroller.deletefavouriteitme(
                                    favouritecontroller
                                        .getfavouritedata[index].docid!);
                              },
                              child: Container(
                                height: 140.h,
                                width: double.maxFinite.w,
                                margin: EdgeInsets.only(
                                    left: 20.w, right: 20.w, bottom: 20.h),
                                decoration: BoxDecoration(
                                    color: AppColor.list_bg,
                                    borderRadius: BorderRadius.circular(20.r)),
                                child: Container(
                                  margin: EdgeInsets.only(left: 20.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      //image of cart
                                      Container(
                                          height: 110.h,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              color: Colors.grey.withOpacity(0.1)),
                                          child:
                                          Image(
                                            height: double.maxFinite,
                                            width: double.maxFinite,
                                            image: NetworkImage(favouritecontroller.getfavouritedata[index].image!),
                                          )
                                          ),
                                      SizedBox(
                                        width: 20.h,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      favouritecontroller
                                                          .getfavouritedata[index]
                                                          .product_name!,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 20.sp),
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Text(
                                                      favouritecontroller
                                                          .getfavouritedata[index]
                                                          .short_name!,
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                          fontSize: 20.sp),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "\$",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20.sp),
                                                ),
                                                Container(
                                                  width: 70.w,
                                                  child: Text(
                                                    favouritecontroller
                                                        .getfavouritedata[index]
                                                        .price!
                                                        .toString(),
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20.sp),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 40.w,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      : Center(
                          child: CircularProgressIndicator(),
                        ))),
            ),
          ],
        ),
      ),
    );
  }
}
