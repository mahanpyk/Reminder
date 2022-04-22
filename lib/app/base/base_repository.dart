import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const String baseURL = 'https://challenge.reval.me/v1/';

class BaseRepository {
  Dio dio = Dio(BaseOptions(
    contentType: 'application/json',
    baseUrl: baseURL,
  ));

  Future postRequest(
      {required String url, required Map<String, dynamic> parameters}) async {
    try {
      final response = await dio
          .post(
        url,
        options: Options(
          headers: {'Accept': 'application/json'},
          receiveDataWhenStatusError: true,
        ),
        data: parameters,
      )
          .catchError((onError) {
        debugPrint("error:${onError.toString()}");
      });

      if (response.statusCode == 200) {
        return response.data;
      } else {
        printError(
            info: "Request Sent error",
            logFunction: () {
              debugPrint(
                  "url: ${baseURL + url}, data:$parameters 'Post Request'");
            });
        return throw (response);
      }
    } catch (e) {
      return throw (e);
    }
  }
}
