import 'dart:io';

import 'package:dio/dio.dart';
import 'package:task_hostbook/api_provider/DioLogger.dart';
import 'package:task_hostbook/model/search_model.dart';
import 'package:task_hostbook/model/view_model.dart';
import 'package:task_hostbook/util/comman_function.dart';

import 'api_constant.dart';

class ApiProvider {
  Dio _dio = Dio();
  DioError? _dioError;

  ApiProvider.base() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = baseUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      // options.headers = {'Content-Type': 'application/json'};
      DioLogger.onSend(tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) {
      _dioError = error;
      DioLogger.onError(tag, error);
      if (_checkSocketException(error)) {
        failedToast('Internet connection failed');
      }
      return handler.next(error);
    }));
  }

  Future funSearchList(searchText) async {
    try {
      Response response = await _dio.get('search/users?q=$searchText');
      print(response.data);
      return SearchModel.fromJson(response.data);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }



  Future<List<ViewModel>?> funViewList() async {
    try {
      final response = await _dio.get('orgs/HELLO/repos');
      var apiResponseJson = response.data;

        return (apiResponseJson as List).map((p)=>ViewModel.fromJson(p)).toList();

    } catch (error, stacktrace) {

      handleException(error, stacktrace,_dioError!);
    }
  }
}

bool _checkSocketException(DioError err) {
  return err.type == DioErrorType.other &&
      err.error != null &&
      err.error is SocketException;
}
