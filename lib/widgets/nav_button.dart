import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Nav_button extends StatelessWidget {
  Icon icons;
  Color? color;
  Nav_button({Key? key,required this.icons,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 60.w,
      decoration: BoxDecoration(
        
          borderRadius: BorderRadius.circular(15.r), color:color),
      child: Center(
          child:icons),
    );
  }
}
