//import 'dart:js';

import 'package:add_to_cart/Controller/auth_controller.dart';
import 'package:add_to_cart/screen/Pages/Main_pages.dart';
import 'package:add_to_cart/screen/Pages/Rootlogin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options:const  FirebaseOptions(
      //   apiKey: "AIzaSyBIo-Y3FW3jFoxOM9gXZT45JSM5HYDs9To",
      //   appId: "flutterfirebase-e570a",
      //   messagingSenderId: "5932205645",
      //   projectId: "flutterfirebase-e570a",
      // ),
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends HookWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Auth_controller auth_controller = Get.put(Auth_controller());
    var appheight = MediaQuery.of(context).size.height;
    var appweight = MediaQuery.of(context).size.width;
        auth_controller.user_current_check();
    return ScreenUtilInit(
      designSize: Size(appweight, appheight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (child) => Material(child: child),
      child: Obx(
        () => auth_controller.current_auth_state.value == true
            ? Mainpage()
            : const Root_page(),
      ),
    );
  }
}
