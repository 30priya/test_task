import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_hostbook/routes/app_page.dart';
import 'package:task_hostbook/routes/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(

        title: "HostBooks",
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        initialRoute: AppRoutes.initial_page,
        enableLog: true,
      );
    });
  }

}