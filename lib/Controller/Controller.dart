import 'dart:async';

import 'package:add_to_cart/widgets/showmyDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Controller extends GetxController {
  final item = 0.obs;
  final isChecked = true.obs;
  final regiCheck = true.obs;
  final singCheck = false.obs;
  final progress = false.obs;
  final dropdownvalue = 'Cumilla'.obs;
  final darkSwitch = false.obs;
  final notificationSwitch = false.obs;
  final currentvalue = 0.obs;
  final isConnected = false.obs;
  //currentindex function for mainpage bottomnavigation change page

  @override
  void onInit() {
    super.onInit();
    //Change value to name2
    checkinernetconection();
  }

  currentindex(value) {
    currentvalue.value = value;
  }

  changepasswordcheck() {
    if (isChecked.value) {
      isChecked.value = false;
    } else {
      isChecked.value = true;
    }
  }

  darkcheck(value) {
    darkSwitch.value = value;
  }

  notificationcheck(value) {
    notificationSwitch.value = value;
  }

  changedropdownvalue(value) {
    dropdownvalue.value = value;
  }

  Future regi() async {
    regiCheck.value = true;
    singCheck.value = false;
    progress.value = true;
  }

  Future sing() async {
    singCheck.value = true;
    regiCheck.value = false;
    progress.value = true;
  }

  changelistvalue(index) {
    item.value = index;
  }

  // check_internetconnection() async {
  //   bool isconect = await InternetConnectionChecker().hasConnection;
  //   isChecked.value = isconect;
  //   if (isconect == "false") {
  //     Fluttertoast.showToast(msg: "No internetconecction");
  //   } else {
  //     Fluttertoast.showToast(msg: "Internetconecction is active");
  //     Get.snackbar("Internet", "connection is active");
  //     Get.defaultDialog();
  //   }
  // }

  checkinernetconection() {
    InternetConnectionChecker().onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        Get.snackbar("Internet", "Connection availabel");
      } else if (status == InternetConnectionStatus.disconnected) {
        Get.defaultDialog(
            title: "Alert",
            middleText:
                "Interconnection is't availabel do you want to enable internetconeection to see data",
            onConfirm: () {
              SystemNavigator.pop();
            },
            onCancel: () {
              SystemNavigator.pop();
            });
        print(status);
      }
    });
  }
}
