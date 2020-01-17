import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';   //  导入后才能使用 ContentType
import '../config/service_url.dart';


//  首页数据
Future getHomePageContext() async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    var formData = {'lon': '322323', 'lat': '23323'};  // 传给后台的数据
    response = await dio.post(servicePath['homePageContext'], data: formData); 
    if(response.statusCode == 200) {
       return response.data;
    } else {
       throw Exception('后台接口异常，请稍后再试');
    }
  } catch(e) {
     return print("error ===== $e");
  }
}