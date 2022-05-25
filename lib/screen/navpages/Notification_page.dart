

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notification_page extends StatefulWidget {
  const Notification_page({ Key? key }) : super(key: key);

  @override
  State<Notification_page> createState() => _Notification_pageState();
}

class _Notification_pageState extends State<Notification_page> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Text("Working On Future"),),
    );
  }
}