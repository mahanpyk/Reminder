import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

const String baseURL = 'https://challenge.reval.me/v1/';

class BaseRepository {
  Dio dio = Dio();

  Future postRequest(
      {required String url, required Map<String, dynamic> parameters}) async {
    final response = await dio.post(
      baseURL + url,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        receiveDataWhenStatusError: true,
      ),
      data: parameters,
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      printError(
          info: "Request Sent error",
          logFunction: () {
            debugPrint(
                "url: ${baseURL + url}, data:$parameters 'Post Request'");
          });
      return Exception(response);
    }
  }
}
