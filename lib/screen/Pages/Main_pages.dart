import 'package:add_to_cart/Controller/Controller.dart';
import 'package:add_to_cart/screen/navpages/Favourite_page.dart';
import 'package:add_to_cart/screen/navpages/Home_page.dart';
import 'package:add_to_cart/screen/navpages/Notification_page.dart';

import 'package:get/get.dart';

import 'package:add_to_cart/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mainpage extends StatelessWidget {
  var pages = [
    Home_pages(),
    Favourite_pages(),
    Notification_page(),
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Obx(
      ()=> Scaffold(
        body: pages[controller.currentvalue.value],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 2.0,
            onTap: controller.currentindex,
            currentIndex: controller.currentvalue.value,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            selectedItemColor: AppColor.red_bg,
            unselectedItemColor: Colors.grey,
            backgroundColor: AppColor.bottom_bg,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 30.sp,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    size: 30.sp,
                  ),
                  label: "Favourite"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notification_add,
                    size: 30.sp,
                  ),
                  label: "Notification"),
            ]),
      ),
    );
  }
}
