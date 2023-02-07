import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';
import 'res_image.dart';

decorationWithoutBorder({color, radius}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.all(
      Radius.circular(radius),
    ),
  );
}
successToast(msg) {
  defaultToast(msg, 'success'.tr, AppColors.primaryColor);
}

failedToast(msg) {
  defaultToast(msg, 'error'.tr, AppColors.colorRed);
}


defaultToast(String msg, String title, color) {
  Get.snackbar(
    title,
    msg,
    snackPosition: SnackPosition.BOTTOM,
    colorText: AppColors.lightBackgroundColor,
    messageText:Text(msg,style: TextStyle(color: Colors.white),),
    backgroundColor: color,
    duration: Duration(seconds: 1),
    margin: EdgeInsets.all(20),
    isDismissible: false,
    snackStyle: SnackStyle.FLOATING,
  );
}

Widget profileNetworkImage(userProfile) {
  return FadeInImage.assetNetwork(
    placeholder: Res.ic_user,
    fit: BoxFit.cover,
    image: userProfile,
    height: 35,
    width: 35,

    imageErrorBuilder: (context, object, stackTrace) {
      return Image.asset(
        Res.ic_user,
        height: 35,
        width:35,
      );
    },
  );
}
