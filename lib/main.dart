import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leads_test/login.dart';
import 'package:sizer/sizer.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType){

          return GetMaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(

              primarySwatch: Colors.pink,
            ),
            home: Login()//Home(),
          );
        });
  }
}

