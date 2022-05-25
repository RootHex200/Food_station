import 'dart:async';
import 'dart:io';
import 'package:add_to_cart/Controller/Controller.dart';
import 'package:add_to_cart/Controller/auth_controller.dart';
import 'package:add_to_cart/Controller/check_cart_item.dart';
import 'package:add_to_cart/Controller/check_favourite_item.dart';
import 'package:add_to_cart/Controller/firestore_controller.dart';
import 'package:add_to_cart/Controller/userinfo_controller.dart';
import 'package:add_to_cart/screen/Pages/Details_page.dart';
import 'package:add_to_cart/screen/Pages/Drawer_page.dart';
import 'package:add_to_cart/widgets/button.dart';

import 'package:add_to_cart/widgets/colors.dart';
import 'package:add_to_cart/widgets/home_delivery_service.dart';
import 'package:add_to_cart/widgets/nav_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home_pages extends StatelessWidget {
  bool isClickitem = false;
  int value = 0;
  List image_data = [
    ["burger.png", "Burger"],
    ["pizza.png", "Pizza"],
    ["drink.png", "Drinks"],
    ["sweets.png", "Sweets"]
  ];

  List transfer = [];
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    final Firestore_controller firestore_controller =
        Get.put(Firestore_controller());
    final Auth_controller auth_controller = Get.put(Auth_controller());
    final Userinfo userinfo = Get.put(Userinfo());

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
        backgroundColor: const Color(0XFFFAFAFA),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Builder(
            builder: (context) => Column(children: [
              Container(
                margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
                //top header desing
                child: Row(children: [
                  //profile continer in top
                  InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Nav_button(
                        icons: Icon(Icons.person),
                        color: Colors.grey.withOpacity(0.1),
                      )),
                  Expanded(child: Container()),
                  //city name in top
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "Location",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 18.sp),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: AppColor.red_bg,
                                size: 38.sp,
                              )
                            ],
                          ),
                        ),
                        Obx(
                         ()=>userinfo.user_info.length !=0?Text(
                            "${userinfo.user_info[0].city},Bangladesh",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.sp),
                          ):Text(''),
                        )
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Nav_button(
                      icons: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 40.sp,
                      ),
                      color: Colors.grey.withOpacity(0.1))
                ]),
              ),
              SizedBox(
                height: 20.h,
              ),
              //free home delivery service
              MediaQuery.of(context).size.width <= 397
                  ? Container(
                      height: 200.h,
                      width: MediaQuery.of(context).size.width.w,
                      margin: EdgeInsets.only(left: 10.w, right: 10.w),
                      decoration: BoxDecoration(
                          color: AppColor.delevary_man_bg,
                          borderRadius: BorderRadius.circular(30.r)),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Home_delivey_service()),
                    )
                  : Container(
                      height: 200.h,
                      width: MediaQuery.of(context).size.width.w,
                      margin: EdgeInsets.only(left: 20.w, right: 20.w),
                      decoration: BoxDecoration(
                          color: AppColor.delevary_man_bg,
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Home_delivey_service(),
                    ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 150.h,
                width: MediaQuery.of(context).size.width.w,
                margin: EdgeInsets.only(left: 20.w),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.changelistvalue(index);
                        },
                        child: Obx(
                          () => Container(
                            height: double.maxFinite.h,
                            width: 100.w,
                            margin: EdgeInsets.only(right: 20.w),
                            decoration: BoxDecoration(
                              color: controller.item.value == index
                                  ? AppColor.red_bg
                                  : AppColor.list_bg,
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 30.h),
                                  child: Image(
                                      height: 50.h,
                                      width: 50.w,
                                      image: AssetImage("assets/images/" +
                                          image_data[index][0])),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  image_data[index][1],
                                  style: TextStyle(
                                      color: controller.item.value == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 20.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 300.h,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 10.h),
                child: Obx(() => firestore_controller.products.length != 0
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: firestore_controller.products.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // Get.to(Detailspage(firestore_controller.products));
                              transfer = [
                                firestore_controller
                                    .products[index].product_name!, //0
                                firestore_controller
                                    .products[index].short_details!, //1
                                firestore_controller
                                    .products[index].rating!, //2
                                firestore_controller.products[index].kcal!, //3
                                firestore_controller.products[index].min!, //4
                                firestore_controller
                                    .products[index].description!, //5
                                firestore_controller.products[index].price!, //6
                                firestore_controller
                                    .products[index].image![0], //7
                                firestore_controller.products[index].docid, //8
                              ];
                              Check_favourite_item.pd_name.value =
                                  firestore_controller.products[index].docid!;
                              Check_cart_item.pd_name.value =
                                  firestore_controller.products[index].docid!;
                              Future.delayed(Duration(milliseconds: 20), () {
                                Get.to(Detailspage(transfer));
                              });
                            },
                            child: Container(
                              height: 295.h,
                              width: 250.w,
                              margin: EdgeInsets.only(
                                  right: 10.w,
                                  left: 10.w,
                                  bottom: 10.w,
                                  top: 2.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: Offset(0, 3),
                                      blurRadius: 3,
                                    )
                                  ]),
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 20.w, right: 20.w, top: 20.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 35.h,
                                              width: 70.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                  SizedBox(
                                                    width: 4.w,
                                                  ),
                                                  Text(
                                                    firestore_controller
                                                        .products[index]
                                                        .rating!,
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Icon(
                                              Icons.favorite,
                                              size: 35.sp,
                                              color: AppColor.red_bg,
                                            )
                                          ]),
                                    ),
                                    Container(
                                      child: Image(
                                          height: 100.h,
                                          width: 200.h,
                                          image: AssetImage(
                                              "assets/images/burgersss.png")),
                                    ),
                                    Text(
                                      firestore_controller
                                          .products[index].product_name!,
                                      // "Beef burger",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30.sp),
                                    ),
                                    Text(
                                      firestore_controller
                                          .products[index].short_details!,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 20.sp),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\$",
                                          style: TextStyle(
                                              color: AppColor.red_bg,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          firestore_controller
                                              .products[index].price!,
                                          // "300",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30.sp),
                                        ),
                                        Expanded(child: Container()),
                                        Container(
                                          height: 60.h,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            color: AppColor.red_bg,
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 50.sp,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                    : Center(child: CircularProgressIndicator())),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text("")
            ]),
          ),
        ),
        drawer: Drawer_page(),
      ),
    );
  }
}
