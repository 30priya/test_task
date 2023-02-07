import 'package:get/get.dart';
import 'package:task_hostbook/screen/home/home_binding.dart';
import 'package:task_hostbook/screen/home/home_screen.dart';
import 'package:task_hostbook/screen/splash/splash_binding.dart';
import 'package:task_hostbook/screen/splash/splash_screen.dart';

import 'app_route.dart';

class AppPages {
  static var transitionDuration = const Duration(
    milliseconds: 550,
  );

  static final pages = [
    GetPage(
      name: AppRoutes.initial_page,
      transitionDuration: transitionDuration,
      page: () => SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: AppRoutes.home_screen,
      transitionDuration: transitionDuration,
      page: () => HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.native,
    ),
  ];
}