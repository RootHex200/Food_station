import 'package:add_to_cart/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button_widgets extends StatelessWidget {
  double height;
  double width;
  String txt;
  FontWeight? fontWeight;
  double? fontsize;
  Color? colors;

  Button_widgets(
      {Key? key,
      required this.height,
      required this.width,
      required this.txt,
      
      this.fontWeight,
      this.fontsize,
      this.colors
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h, //50.h,
      width: width.w, //135.w,
      decoration: BoxDecoration(
        color: AppColor.red_bg,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child: Text(
          txt.toString(),
          style: TextStyle(
              color: Colors.white, fontSize: fontsize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
