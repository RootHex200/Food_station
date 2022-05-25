import 'package:add_to_cart/Controller/Controller.dart';
import 'package:add_to_cart/Controller/auth_controller.dart';
import 'package:add_to_cart/screen/Pages/Register_page.dart';
import 'package:add_to_cart/widgets/colors.dart';
import 'package:add_to_cart/widgets/showmyDialog.dart';
import 'package:add_to_cart/widgets/singin_with_other.dart';
import 'package:add_to_cart/widgets/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Login_page extends HookWidget {
  Login_page({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  List data = ["google.png", "apple.png", "facebook.png"];
  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    final Auth_controller auth_controller = Get.put(Auth_controller());
    final emailcontroller = useTextEditingController();
    final passcontoller = useTextEditingController();
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [AppColor.grdient_1st, AppColor.root_page_bg])),
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50.h),
                  child: Center(
                      child: Text(
                    Appstring.login_page[0],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                  )),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                    child: Text(
                  Appstring.login_page[1],
                  style: TextStyle(color: Colors.black54, fontSize: 25.sp),
                )),
                Center(
                    child: Text(
                  Appstring.login_page[2],
                  style: TextStyle(color: Colors.black54, fontSize: 25.sp),
                )),
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Required";
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: emailcontroller,
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.sp),
                          strutStyle: StrutStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(Icons.mark_email_unread_outlined),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: const BorderSide(
                                    style: BorderStyle.none,
                                  )),
                              labelText: "Enter Email",
                              labelStyle: TextStyle(
                                  color: Colors.black54, fontSize: 20.sp)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Obx(
                          () => TextFormField(
                            controller: passcontoller,
                            obscureText:
                                controller.isChecked.value ? true : false,
                            keyboardType: TextInputType.emailAddress,
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.sp),
                            validator: (value) {
                              if (value == "") {
                                return "Required";
                              } else if (value!.length < 6) {
                                return "Password should be atleast 6 characters";
                              } else if (value.length > 15) {
                                return "Password should not be greater than 15 characters";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person_outlined),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      controller.changepasswordcheck();
                                    },
                                    child: controller.isChecked.value
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: const BorderSide(
                                      style: BorderStyle.none,
                                    )),
                                labelText: "Enter Password",
                                labelStyle: TextStyle(
                                    color: Colors.black54, fontSize: 20.sp)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.only(right: 30.h),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Recovery Password",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            fontSize: 19.sp),
                      )),
                ),
                SizedBox(
                  height: 25.h,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      auth_controller.User_login(
                          emailcontroller.text, passcontoller.text);
                      Future.delayed(Duration(seconds: 3), () {
                        if (auth_controller.auth_checking_log.value == true) {
                          _showMyDialog(context, "checked.png",
                              "Login successfully", "Go to");
                        } else {
                          _showMyDialog(
                              context, "cancel.png", "Error,Try Agin", "Ok");
                        }
                      });
                    }
                  },
                  child: Container(
                    height: 75.h,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: 30.w, right: 30.w),
                    decoration: BoxDecoration(
                        color: AppColor.red_bg,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Center(
                        child: Text(
                      "Sing In",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 23.sp),
                    )),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Center(
                  child: Text(
                    "or continue with",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                        fontSize: 19.sp),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                MediaQuery.of(context).size.width <= 360
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Other_singin_method())
                    : Other_singin_method(),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Not a memebr?",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            fontSize: 19.sp),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => Get.to(Register_page()),
                        child: Text(
                          "Register now",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w700,
                              fontSize: 19.sp),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _showMyDialog(context, image, message, text_button) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Showmydialog(
            messsage: message, text_button: text_button, image: image);
      },
    );
  }
}
