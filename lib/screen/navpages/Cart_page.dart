// ignore_for_file: avoid_unnecessary_containers

import 'package:add_to_cart/Controller/Controller.dart';
import 'package:add_to_cart/Controller/cart_controller.dart';
import 'package:add_to_cart/widgets/colors.dart';
import 'package:add_to_cart/widgets/nav_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../widgets/button.dart';

class Cart_pages extends StatelessWidget {
  Cart_pages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return Scaffold(
        body: Column(
      children: [
        //cart header part
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Nav_button(
                    icons: Icon(Icons.arrow_back_rounded),
                    color: Colors.grey.withOpacity(0.2),
                  )),
              Expanded(child: Container()),
              Column(
                children: [
                  Text(
                    "Your Cart",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Item ${cartController.addtocart.length}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                ],
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
        //cart item part
        Expanded(
          child: SingleChildScrollView(
            child: Container(
                height: 600.h,
                width: MediaQuery.of(context).size.width.w,
                child: Obx(() => cartController.addtocart.length != 0
                    ? ListView.builder(
                        itemCount: cartController.addtocart.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              cartController.deletecartitme(
                                  cartController.addtocart[index].docid!);
                            },
                            child: Container(
                              height: 150.h,
                              width: MediaQuery.of(context).size.width.w,
                              margin: EdgeInsets.only(
                                  left: 20.w, right: 20.w, bottom: 20.h),
                              decoration: BoxDecoration(
                                  color: AppColor.list_bg,
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Container(
                                margin: EdgeInsets.only(left: 10.w),
                                child: MediaQuery.of(context).size.width < 360
                                    ? FittedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                                height: 100.h,
                                                width: 110,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.r),
                                                    color: Colors.grey
                                                        .withOpacity(0.1)),
                                                child: Image(
                                                  height: double.maxFinite,
                                                  width: double.maxFinite,
                                                  image: NetworkImage(
                                                      cartController
                                                          .addtocart[index]
                                                          .image!),
                                                )),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(top: 20.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            cartController
                                                                .addtocart[
                                                                    index]
                                                                .product_name!,
                                                            // "double beef",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    20.sp),
                                                          ),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          Text(
                                                            cartController
                                                                .addtocart[
                                                                    index]
                                                                .short_name!,
                                                            //  "Burger",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize:
                                                                    20.sp),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "\$",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.sp),
                                                      ),
                                                      Container(
                                                        width: 70.w,
                                                        child: Text(
                                                          cartController
                                                              .addtocart[index]
                                                              .price!
                                                              .toString(),
                                                          // "200",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20.sp),
                                                        ),
                                                      ),
                                                      Container(
                                                          height: 40.h,
                                                          width: 100.w,
                                                          decoration: BoxDecoration(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.r)),
                                                          child: Center(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 8.w,
                                                                      right:
                                                                          8.w),
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                        30.h,
                                                                    width: 30.w,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.r)),
                                                                    child: Center(
                                                                        child: InkWell(
                                                                      onTap:
                                                                          () {
                                                                        var item = cartController
                                                                            .addtocart[index]
                                                                            .itemcount!;
                                                                        item =
                                                                            item +
                                                                                1;
                                                                        cartController.updatedata(
                                                                            cartController.addtocart[index].docid!,
                                                                            item,
                                                                            index);
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                    )),
                                                                  ),
                                                                  Expanded(
                                                                      child:
                                                                          Container()),
                                                                  Text(
                                                                    cartController
                                                                        .addtocart[
                                                                            index]
                                                                        .itemcount
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            20.sp),
                                                                  ),
                                                                  Expanded(
                                                                      child:
                                                                          Container()),
                                                                  Container(
                                                                    height:
                                                                        30.h,
                                                                    width: 30.w,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.r)),
                                                                    child: Center(
                                                                        child: InkWell(
                                                                      onTap:
                                                                          () {
                                                                        var item = cartController
                                                                            .addtocart[index]
                                                                            .itemcount!;
                                                                        item =
                                                                            item -
                                                                                1;
                                                                        if (item ==
                                                                            0) {
                                                                          item =
                                                                              1;
                                                                        }
                                                                        cartController.updatedata(
                                                                            cartController.addtocart[index].docid!,
                                                                            item,
                                                                            index);
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .remove,
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                    )),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                              height: 100.h,
                                              width: 110,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r),
                                                  color: Colors.grey
                                                      .withOpacity(0.1)),
                                              child: Image(
                                                height: double.maxFinite,
                                                width: double.maxFinite,
                                                image: NetworkImage(
                                                    cartController
                                                        .addtocart[index]
                                                        .image!),
                                              )),
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          cartController
                                                              .addtocart[index]
                                                              .product_name!,
                                                          // "double beef",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20.sp),
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        Text(
                                                          cartController
                                                              .addtocart[index]
                                                              .short_name!,
                                                          //  "Burger",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
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
                                                  children: [
                                                    Text(
                                                      "\$",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20.sp),
                                                    ),
                                                    Container(
                                                      width: 70.w,
                                                      child: Text(
                                                        cartController
                                                            .addtocart[index]
                                                            .price!
                                                            .toString(),
                                                        // "200",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.sp),
                                                      ),
                                                    ),
                                                    Container(
                                                        height: 40.h,
                                                        width: 100.w,
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.3),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r)),
                                                        child: Center(
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 8.w,
                                                                    right: 8.w),
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  height: 30.h,
                                                                  width: 30.w,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.r)),
                                                                  child: Center(
                                                                      child:
                                                                          InkWell(
                                                                    onTap: () {
                                                                      var item = cartController
                                                                          .addtocart[
                                                                              index]
                                                                          .itemcount!;
                                                                      item =
                                                                          item +
                                                                              1;
                                                                      cartController.updatedata(
                                                                          cartController
                                                                              .addtocart[index]
                                                                              .docid!,
                                                                          item,
                                                                          index);
                                                                    },
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                  )),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Text(
                                                                  cartController
                                                                      .addtocart[
                                                                          index]
                                                                      .itemcount
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20.sp),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Container(
                                                                  height: 30.h,
                                                                  width: 30.w,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.r)),
                                                                  child: Center(
                                                                      child:
                                                                          InkWell(
                                                                    onTap: () {
                                                                      var item = cartController
                                                                          .addtocart[
                                                                              index]
                                                                          .itemcount!;
                                                                      item =
                                                                          item -
                                                                              1;
                                                                      if (item ==
                                                                          0) {
                                                                        item =
                                                                            1;
                                                                      }
                                                                      cartController.updatedata(
                                                                          cartController
                                                                              .addtocart[index]
                                                                              .docid!,
                                                                          item,
                                                                          index);
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                  )),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )),
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
        ),
        Container(
          height: 120.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: Offset(0, 3),
                    blurRadius: 4,
                    spreadRadius: 8)
              ],
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
          child: Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Price",
                        style:
                            TextStyle(color: Colors.black54, fontSize: 20.sp),
                      ),
                      Row(
                        children: [
                          Text(
                            "\$",
                            style: TextStyle(
                                color: AppColor.red_bg, fontSize: 20.sp),
                          ),
                          Obx(
                            () => Text(
                              cartController.totalprices.toString(),
                              style: TextStyle(
                                  fontSize: 30.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  Button_widgets(
                    height: 60,
                    width: 200,
                    txt: "Go to purchase",
                    fontWeight: FontWeight.bold,
                    fontsize: 25.sp,
                  ),
                ]),
          ),
        )
      ],
    ));
  }
}
