import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_hostbook/api_provider/api_provider.dart';
import 'package:task_hostbook/model/search_model.dart';
import 'package:task_hostbook/model/view_model.dart';
import 'package:task_hostbook/util/comman_function.dart';

class HomeController extends GetxController{

  var searchController = TextEditingController();
  final focusNode = FocusNode();

  var searchList = <Items>[].obs;
  var userList = <ViewModel>[].obs;

  var searchText = "".obs;

  var isLoadingPage = true.obs;


  @override
  void onInit() {

    Future.delayed(Duration.zero,(){
      getApiView();
    });
    super.onInit();
  }


  onChanged(searchText) {
    this.searchText.value = searchText;
    getApiSearch(this.searchText.value);

  }



  clearSearchData(){
    searchText.value = "";
    searchController.text = "";
    focusNode.unfocus();
    getApiSearch("p");
  }










  getApiSearch(searchText) async {
    SearchModel searchModel = await ApiProvider.base().funSearchList(searchText);
    if(searchModel.incompleteResults==false){
     searchList.value= searchModel.items!;
    }

  }



  getApiView() async {
    try {
      List<ViewModel>? viewModel = await ApiProvider.base().funViewList();
      viewModel?.sort((a, b) {
        return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
      });
      userList.value = viewModel!;
      isLoadingPage.value = false;

    } on HttpException catch (exception) {
      isLoadingPage.value = false;

      debugPrint(exception.message);
      failedToast(exception.message);
    } catch (exception) {
      isLoadingPage.value = false;

      debugPrint(exception.toString());
      failedToast(exception.toString());
    }








  }





}