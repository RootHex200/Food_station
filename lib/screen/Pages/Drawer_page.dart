import 'package:add_to_cart/Controller/cart_controller.dart';
import 'package:add_to_cart/Controller/userinfo_controller.dart';
import 'package:add_to_cart/screen/Pages/Main_pages.dart';
import 'package:add_to_cart/screen/Pages/Settting_page.dart';
import 'package:add_to_cart/screen/navpages/Cart_page.dart';
import 'package:add_to_cart/screen/navpages/Favourite_page.dart';
import 'package:add_to_cart/screen/navpages/Home_page.dart';
import 'package:add_to_cart/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Drawer_page extends StatefulWidget {
  const Drawer_page({Key? key}) : super(key: key);

  @override
  State<Drawer_page> createState() => _Drawer_pageState();
}

class _Drawer_pageState extends State<Drawer_page> {
  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    Userinfo userinfo = Get.put(Userinfo());
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 230.h,
            child: DrawerHeader(
                decoration: BoxDecoration(color: AppColor.red_bg),
                child: Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.r)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/mario.png"))),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Obx(
                        ()=>userinfo.user_info.length !=0? Text(
                          userinfo.user_info[0].name!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp),
                        ):Text(""),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(
                        ()=>userinfo.user_info.length !=0? Text(
                          userinfo.user_info[0].email!,
                          style: TextStyle(
                              color: AppColor.delevary_man_bg,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                        ):Text(""),
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.home,
                    size: 30.sp,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(Mainpage());
                  },
                ),
                ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 30.sp,
                    ),
                    title:
                        Text("My account", style: TextStyle(fontSize: 20.sp)),
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(Setting_page());
                    }),
                ListTile(
                    leading: Icon(
                      Icons.add_shopping_cart,
                      size: 30.sp,
                    ),
                    title: Text("My orders", style: TextStyle(fontSize: 20.sp)),
                    onTap: () {
                      cartController.Sum();
                      Navigator.pop(context);
                      Get.to(Cart_pages());
                    }),
                Divider(
                  height: 10.h,
                  thickness: 2,
                ),
                ListTile(
                    leading: Icon(
                      Icons.favorite_outline,
                      size: 30.sp,
                    ),
                    title: Text("My favourites",
                        style: TextStyle(fontSize: 20.sp)),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Favourite_pages()))),

                //  Align(
                //    alignment: Alignment.bottomCenter,
                //    child: ListTile(
                //           leading: Icon(
                //             Icons.add_shopping_cart,
                //             size: 30.sp,
                //           ),
                //           title: Text("Log Out", style: TextStyle(fontSize: 20.sp)),
                //           onTap: () => Navigator.push(context,
                //               MaterialPageRoute(builder: (_) => Home_pages()))),
                //  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
