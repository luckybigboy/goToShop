import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//  轮播组件
class SwiperItem extends StatelessWidget {
  final List SwiperItemList;
  SwiperItem({Key key, this.SwiperItemList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print('设备的像素密度 + ${ScreenUtil.pixelRatio}');
    // print('设备的高 + ${ScreenUtil.screenHeight}');
    // print('设备的宽 + ${ScreenUtil.screenWidth}');
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(333),
      child: Swiper(
        itemBuilder: (context, index) => ClipRRect(
          // 为图片添加圆角
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
