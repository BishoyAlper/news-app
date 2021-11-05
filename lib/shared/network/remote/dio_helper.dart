import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

// base url: https://newsapi.org/
// method (url): v2/top-headlines?
// queri: country=us&category=business&apiKey=964a320e003946dd889621510b996d1e

class DioHelper{
  static Dio dio;

  static init(){
    dio= Dio(
        BaseOptions(
          baseUrl: "https://newsapi.org/",
          receiveDataWhenStatusError: true,
        ),
    );
  }

  static Future<Response>getData({
    @required String url,
    @required Map<String, dynamic> query
  }) async
  {
    return await dio.get(url, queryParameters: query);
  }
}