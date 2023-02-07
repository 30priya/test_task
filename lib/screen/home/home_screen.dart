import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_hostbook/util/app_colors.dart';
import 'package:task_hostbook/util/comman_function.dart';
import 'package:task_hostbook/util/res_dimens.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 20, top: 50),
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 12, left: 12, right: 12),
                  decoration: decorationWithoutBorder(
                      color: AppColors.lightBackgroundColor, radius: 18.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: const Icon(Icons.search_rounded,
                            size: 25, color: AppColors.hintColor),
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller.searchController,
                          autocorrect: true,
                          decoration: InputDecoration(
                              hintText: 'Search some user',
                              hintStyle: TextStyle(
                                color: AppColors.hintColor,
                                fontSize: dimen14,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              isDense: true),
                          style: TextStyle(
                            color: AppColors.darkBackgroundColor,
                            fontSize: dimen14,
                          ),
                          onChanged: (text) {
                            controller.onChanged(text);
                          },
                        ),
                      ),
                      Visibility(
                        visible: controller.searchText.isEmpty ? false : true,
                        child: GestureDetector(
                          onTap: () {
                            controller.clearSearchData();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 12),
                            child: const Icon(Icons.close_rounded,
                                size: 23, color: AppColors.hintColor),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ),
          Expanded(
            child: Obx(
              () =>controller.isLoadingPage.value?Center(child: const CircularProgressIndicator()):

              controller.searchText.isNotEmpty?


                  ListView.builder(
                  // controller: controller.listScrollController,
                  itemCount: controller.searchList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return searchWiget(index);
                  }): ListView.builder(
                  itemCount: controller. userList.value.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return userWiget(index);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  searchWiget(index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black.withOpacity(.4),
            Colors.black.withOpacity(1),
          ],
        ),
      ),
      padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
      margin: const EdgeInsets.only(left: 10, right: 10,top: 10,bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      ClipOval(
      child: SizedBox.fromSize(
      size: const Size.fromRadius(30), // Image radius
        child: profileNetworkImage(controller.searchList.value[index].avatarUrl))),
          Padding(
            padding:const EdgeInsets.only(left: 30, top: 10),
            child: Text(
              controller.searchList.value[index].login??"",
              style: TextStyle(
                color:Colors.grey,
                fontSize: dimen13,
              ),
            ),
          )
        ],
      ),
    );
  }

  userWiget(index){
    {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(.4),
              Colors.black.withOpacity(1),
            ],
          ),
        ),
        padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
        margin: const EdgeInsets.only(left: 10, right: 10,top: 10,bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(

                child: SizedBox.fromSize(
                    size: Size.fromRadius(30), // Image radius
                    child: profileNetworkImage(controller.userList.value[index].owner?.avatarUrl))),


            Padding(
              padding:  EdgeInsets.only(left: 30, top: 10),
              child: Text(
                controller.userList.value[index].name??"",
                style: TextStyle(
                  color:Colors.grey,
                  fontSize: dimen13,
                ),
              ),
            )
          ],
        ),
      );
    }
  }


}
