


import 'package:add_to_cart/widgets/button.dart';
import 'package:add_to_cart/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home_delivey_service extends StatelessWidget {
  const Home_delivey_service({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.w, top: 25.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Free Home",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28.sp),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Delivery",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.sp,
                                  color: AppColor.red_bg),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Service",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Button_widgets(height: 50, width: 135, txt: "Order Now")
                      ],
                    ),
                  ),
                        
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Image(
                        height: double.maxFinite.h,
                        image: const AssetImage("assets/images/boy.png"),
                        fit: BoxFit.cover),
                  ),
                ],
              );
  }
}