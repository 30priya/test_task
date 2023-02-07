import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

String tag = 'api_provider';
const baseUrl = 'https://api.github.com/';



handleException(error,stacktrace,DioError dioError){
  debugPrint("Exception occurred: $error stackTrace: $stacktrace");
  print(dioError.error.toString());
  print(dioError.toString());
  if (dioError.response!.statusCode == 401) {
    throwIfNoSuccess("unauthorized");
  } else if (dioError.response!.statusCode == 500) {
    if (dioError.response!.data == null) {
      throwIfNoSuccess("server_error");
    } else {
      throwIfNoSuccess(dioError.response!.data['message']);
    }
  } else {
    if (dioError.response!.data == null) {
      throwIfNoSuccess("something_went_wrong");
    } else {
      throwIfNoSuccess(dioError.response!.data['message']);
    }
  }
}

void throwIfNoSuccess(String response) {
  throw HttpException(response);
}