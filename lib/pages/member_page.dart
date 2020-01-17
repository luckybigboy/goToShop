import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../service/serice_method.dart';


class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  String membetTitle = '正在获取数据';
  List SwiperItemLists = [
    'http://ppic.meituba.com/uploads/allimg/2016/10/11/158_888.jpg',
    'http://image.biaobaiju.com/uploads/20180802/00/1533140794-BTtDVFWOAu.jpg',
    'http://pic1.win4000.com/wallpaper/2018-08-13/5b71182898473.jpg'
  ];
  @override
  // void initState() {
  //   getHomePageContext().then((res) => {
  //         setState(() => {membetTitle = res.toString()})
  //       });
  //   // TODO: implement initState
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('会员中心'),
        ),
        // body: FutureBuilder(                 //  有了futureBuilder 这个widget 就不需要initState了
        //   future: getHomePageContext(),
        //   builder: (context, snapshot) {
        //     if(snapshot.hasData) {
        //       var data = json.decode(snapshot.data.toString());   // 数据反编译 使用json就需要引入import 'dart:convert';
        //       List<Map> SwiperItemLists = (data['data']['slides'] as List).cast();  // 后台数据
        //       return Column(
        //         children: <Widget>[
        //           SwiperItem(SwiperItemList: SwiperItemLists)
        //         ],
        //       );
        //     } else {
        //       return Center(
        //         child: Text('加载中...'),
        //       );
        //     }
        //   },
        // )

        body: Container(
          child: Column(
            children: <Widget>[
              SwiperItem(SwiperItemList: SwiperItemLists),
            ],
          ),
        ),
      ),
    );
  }
}

//  轮播组件
class SwiperItem extends StatelessWidget {
  final List SwiperItemList;
  SwiperItem({Key key, this.SwiperItemList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('设备的像素密度 + ${ScreenUtil.pixelRatio}');
    print('设备的高 + ${ScreenUtil.screenHeight}');
    print('设备的宽 + ${ScreenUtil.screenWidth}');
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(333),
      child: Swiper(
        itemBuilder: (context, index) => ClipRRect(    // 为图片添加圆角
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
          '${SwiperItemList[index]}',
          fit: BoxFit.fill,
        ),
        ),
        itemCount: SwiperItemList.length,
        pagination: SwiperPagination(),
        autoplay: true,
        duration: 500,
        viewportFraction: 0.9,
        scale: 0.9,
      ),
    );
  }
}
