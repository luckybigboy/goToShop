import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondsKill extends StatelessWidget {
  final List secondsSkillArr;
  SecondsKill({Key key, this.secondsSkillArr}) : super(key: key);
  
  // 秒杀标题区域
  Widget _skillTitle() {
    return Row(
      children: <Widget>[
        Text(
          '京东秒杀',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        Text(
          '16点场',
        ),
      ],
    );
  }
  
  // 秒杀内容区域
  Widget _secondSkillList(item) {
    return Column(
      children: <Widget>[
        Image.network(
          item['url'],
          width: ScreenUtil().setWidth(120),
        ),
        Text(
          '￥' + item['currentPrice'],
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        Text(
          '￥' + item['originPrince'],
          style: TextStyle(
              decoration: TextDecoration.lineThrough, color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget _gridViewItem(BuildContext context, item) {
    return InkWell(
        onTap: _toPage(),
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
            child: _secondSkillList(item)));
  }

  _toPage() {
    return print('你一点击');
  }

  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: <Widget>[
          _skillTitle(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: secondsSkillArr.map((item) {
              return _gridViewItem(context, item);
            }).toList()),
          )
        ],
      ),
    );
  }
}
