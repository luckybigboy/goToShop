import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsRecommend extends StatelessWidget {
  final List goodsRecommend;
  GoodsRecommend({Key key, this.goodsRecommend}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(445),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[_recommendTitle(), _goodsList()],
      ),
    );
  }

  // 商品推荐
  Widget _recommendTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Text('商品推荐',
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
    );
  }

// 商品单独项
  Widget _item(index) {
    return InkWell(
      onTap: () {
        print('234');
      },
      child: Container(
        height: ScreenUtil().setHeight(370),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(left: BorderSide(width: 1, color: Colors.black12))),
        child: Column(
          children: <Widget>[
            Image.network(
              '${goodsRecommend[index]['url']}',
              fit: BoxFit.fill,
            ),
            Text(
              '￥${goodsRecommend[index]['currentPrice']}',
              style: TextStyle(color: Colors.red),
            ),
            Text(
              '￥${goodsRecommend[index]['originPrince']}',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

//  商品列表
  Widget _goodsList() {
    return Container(
      height: ScreenUtil().setHeight(370),
      child: ListView.builder(
        itemCount: goodsRecommend.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _item(index);
        },
      ),
    );
  }
}
