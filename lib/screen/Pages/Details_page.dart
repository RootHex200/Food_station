import 'package:add_to_cart/Controller/cart_controller.dart';
import 'package:add_to_cart/Controller/favourite_controller.dart';
import 'package:add_to_cart/Controller/check_cart_item.dart';
import 'package:add_to_cart/Controller/check_favourite_item.dart';
import 'package:add_to_cart/widgets/button.dart';
import 'package:add_to_cart/widgets/colors.dart';
import 'package:add_to_cart/widgets/nav_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Detailspage extends StatelessWidget {
  List details_data;
  Detailspage(this.details_data);
  List image_data = [
    ["burger.png", "Burger"],
    ["pizza.png", "Pizza"],
    ["drink.png", "Drinks"],
    ["sweets.png", "Sweets"],
    ["pizza.png", "Pizza"],
  ];

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    final Check_favourite_item check_favourite_item =
        Get.put(Check_favourite_item());
    final Check_cart_item check_cart_item = Get.put(Check_cart_item());
    final Favouritecontroller favouritecontroller =
        Get.put(Favouritecontroller());
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //header part of stack
                  Container(
                    height: 540.h,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 440.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  AppColor.first_gradient,
                                  AppColor.second_gradinet
                                ]),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(40.r),
                                    bottomRight: Radius.circular(50.r))),
                          ),
                        ),
                        Obx(
                          () => Positioned(
                              child: Container(
                            margin: EdgeInsets.only(
                                top: 50.h, left: 20.h, right: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Nav_button(
                                        icons: const Icon(
                                            Icons.arrow_back_ios_new_rounded),color: Colors.white,)),
                                InkWell(
                                  onTap: () {
                                    if (check_favourite_item
                                            .check_item.length ==
                                        0) {
                                      favouritecontroller.addto_favourite(
                                        details_data[0],
                                        details_data[1],
                                        details_data[6],
                                        details_data[7],
                                        details_data[8],
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: 'Your already added this item');
                                    }
                                  },
                                  child: Nav_button(
                                      icons: check_favourite_item
                                                  .check_item.length ==
                                              0
                                          ? Icon(
                                              Icons.favorite_outline_outlined,
                                              size: 30.sp,
                                              color: AppColor.red_bg,
                                            )
                                          : Icon(
                                              Icons.favorite,
                                              size: 30.sp,
                                              color: AppColor.red_bg,
                                            ),color: Colors.white,),
                                ),
                              ],
                            ),
                          )),
                        ),
                        Positioned(
                          left: 30,
                          right: 30,
                          child: Container(
                            height: 300.h,
                            width: 350.w,
                            margin: const EdgeInsets.only(top: 230),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: const Offset(0, 2),
                                  blurRadius: 4,
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40.r),
                                  bottomRight: Radius.circular(40.r),
                                  topLeft: Radius.circular(70.r),
                                  topRight: Radius.circular(70.r)),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 120.h, left: 20.w, right: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          details_data[0],
                                          style: TextStyle(
                                              fontSize: 30.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      // Container(
                                      //     height: 40.h,
                                      //     width: 110.w,
                                      //     decoration: BoxDecoration(
                                      //         color: AppColor.red_bg,
                                      //         borderRadius:
                                      //             BorderRadius.circular(15.r)),
                                      //     child: Center(
                                      //       child: Container(
                                      //         margin: EdgeInsets.only(
                                      //             left: 8.w, right: 8.w),
                                      //         child: Row(
                                      //           children: [
                                      //             Container(
                                      //               height: 30.h,
                                      //               width: 30.w,
                                      //               decoration: BoxDecoration(
                                      //                   color: Colors.white,
                                      //                   borderRadius:
                                      //                       BorderRadius.circular(
                                      //                           10.r)),
                                      //               child: Center(
                                      //                   child: InkWell(
                                      //                 onTap: () {},
                                      //                 child: Icon(
                                      //                   Icons.add,
                                      //                   color: Colors.red,
                                      //                 ),
                                      //               )),
                                      //             ),
                                      //             Expanded(child: Container()),
                                      //             Text(
                                      //               "0",
                                      //               style: TextStyle(
                                      //                   color: Colors.white),
                                      //             ),
                                      //             Expanded(child: Container()),
                                      //             Container(
                                      //               height: 30.h,
                                      //               width: 30.w,
                                      //               decoration: BoxDecoration(
                                      //                   color: Colors.white,
                                      //                   borderRadius:
                                      //                       BorderRadius.circular(
                                      //                           10.r)),
                                      //               child: Center(
                                      //                   child: InkWell(
                                      //                 onTap: () {},
                                      //                 child: Icon(
                                      //                   Icons.remove,
                                      //                   color: Colors.red,
                                      //                 ),
                                      //               )),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     )),
                                    ],
                                  ),
                                  Container(
                                    child: Text(
                                      details_data[1],
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.black54),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Divider(
                                    height: 10.h,
                                    thickness: 2,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text(
                                            details_data[2],
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text(
                                            details_data[3] + " Kcal",
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text(
                                            details_data[4] + " min",
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 00,
                          right: 00,
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 140),
                              child: Image(
                                  height: 200.h,
                                  width: 300.w,
                                  image: NetworkImage(details_data[7])),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Text("Ingredients",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.sp))),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                      height: 60.h,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 20.w),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: image_data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(right: 30.w),
                              child: Container(
                                child: Image(
                                    image: AssetImage("assets/images/" +
                                        image_data[index][0])),
                              ),
                            );
                          })),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Text("Description",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.sp))),

                  Container(
                      margin: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Text(details_data[5],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.black54, fontSize: 20.sp))),
                SizedBox(height: 10.h,),
                ],
              ),
            ),
          ),

          Container(
            height: 90.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      offset: const Offset(0, 3),
                      blurRadius: 4,
                      spreadRadius: 8)
                ],
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30.r))),
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
                            Text(
                              details_data[6],
                              style: TextStyle(
                                  fontSize: 30.sp, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        if (check_cart_item.check_cart.length == 0) {
                          cartController.addto_cart(
                            details_data[0],
                            details_data[1],
                            details_data[6],
                            details_data[7],
                            details_data[8],
                          );
                        } else {
                          Fluttertoast.showToast(msg: "Already added");
                        }
                      },
                      child: Button_widgets(
                        height: 60,
                        width: 200,
                        txt: "Add to Cart",
                        fontWeight: FontWeight.bold,
                        fontsize: 25.sp,
                      ),
                    ),
                  ]),
            ),
          )
        ]));
  }
}
