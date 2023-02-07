import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        ),
        child: Center(
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(controller.rotationController!),
            child: Container(
                child:const FlutterLogo(size:50)
            )
          ),
        ),
      ),
    );
  }
}

