import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_hostbook/routes/app_route.dart';
class SplashController extends GetxController with GetTickerProviderStateMixin{

  AnimationController? rotationController;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero,() async {
    });
    rotationController = AnimationController(duration: const Duration(seconds: 0), vsync: this);
    rotationController!.forward(from: 0.0);
    _nextScreen();
  }
  _nextScreen() async {
    var _duration = Duration(seconds: 3);
     return Timer(_duration, (){
      Get.offNamed(AppRoutes.home_screen);
    });
  }

}