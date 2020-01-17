import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/http_headers.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String textTitle = '还没有数据呢';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('极客时间'),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: _jike,
                  child: Text('点击获取极客时间数据'),
                ),
                Text(textTitle)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _jike() {
    getJiKeData().then((res) => {
          setState(() {
            textTitle = res['d']['categoryList'].toString();
            print(res['d']['categoryList'].toString());
          })
        }
        );
  }

  Future getJiKeData() async {
    try {
      Response response;
      Dio dio = new Dio();
      dio.options.headers = http_headers;
      response = await dio.get('https://gold-tag-ms.juejin.im/v1/categories');
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
