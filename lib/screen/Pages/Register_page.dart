//import 'dart:html';

import 'package:add_to_cart/Controller/Controller.dart';
import 'package:add_to_cart/Controller/auth_controller.dart';
import 'package:add_to_cart/screen/Pages/Main_pages.dart';
import 'package:add_to_cart/widgets/colors.dart';
import 'package:add_to_cart/widgets/showmyDialog.dart';
import 'package:add_to_cart/widgets/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Register_page extends HookWidget {
  Register_page({Key? key}) : super(key: key);
  String dropdownvalue = 'Cumilla';

  // List of items in our dropdown menu
  var items = [
    'Cumilla',
    'Dhaka',
    'Chandpur',
    'Lakhsam',
    'Noyakhali',
  ];
  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    final Auth_controller auth_controller = Get.put(Auth_controller());
    final _formKey = GlobalKey<FormState>();
    final namecontroller = useTextEditingController();
    final emailcontroller = useTextEditingController();
    final passcontoller = useTextEditingController();
    final confepacontoller = useTextEditingController();
    final pagecontroller = PageController();

    useEffect(() {
      return () {
        pagecontroller.dispose();
      };
    }, []);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [AppColor.grdient_1st, AppColor.root_page_bg])),
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
                          controller: namecontroller,
                          keyboardType: TextInputType.name,
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.sp),
                          strutStyle: StrutStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person_add),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: const BorderSide(
                                    style: BorderStyle.none,
                                  )),
                              labelText: "Enter Username",
                              labelStyle: TextStyle(
                                  color: Colors.black54, fontSize: 20.sp)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Required";
                            }
                          },
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
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
                            obscureText:
                                controller.isChecked.value ? true : false,
                            keyboardType: TextInputType.text,
                            controller: passcontoller,
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
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Obx(
                          () => TextFormField(
                            obscureText:
                                controller.isChecked.value ? true : false,
                            keyboardType: TextInputType.text,
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
                                labelText: "Enter Conferm Password",
                                labelStyle: TextStyle(
                                    color: Colors.black54, fontSize: 20.sp)),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => DropdownButton(
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.black,
                                  ),
                                  // Initial Value
                                  value: controller.dropdownvalue.value.toString(),

                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),

                                  // Array list of items
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (newValue) {
                                    controller.changedropdownvalue(newValue);
                                  },
                                ),
                              ),
                              Obx(
                                () => DropdownButton(
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.black,
                                  ),
                                  // Initial Value
                                  value: controller.dropdownvalue.value.toString(),

                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),

                                  // Array list of items
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (newValue) {
                                    controller.changedropdownvalue(newValue);
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    auth_controller.User_register(
                        namecontroller.text,
                        emailcontroller.text,
                        passcontoller.text.toString(),
                        dropdownvalue);
                    Future.delayed(Duration(seconds: 3), () {
                      if (auth_controller.auth_checking_regi.value) {
                        _showMyDialog(context, "checked.png",
                            "Register successfully", "Go to");
                      } else {
                        _showMyDialog(
                            context, "cancel.png", "Error,Try Agin", " ok");
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
                    "Sing up",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 23.sp),
                  )),
                ),
              ),
           
              SizedBox(height: 10.h,),
            ],
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
