import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderPhone extends StatelessWidget {
  final List leaderMsg;
  final String leaderPhone;
  final List leaderImgs;
  LeaderPhone({Key key, this.leaderMsg, this.leaderPhone, this.leaderImgs})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
      child: InkWell(
          onTap: _launcherUrl,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 55.0,
                top: 20.0,
                child: Container(
                  width: ScreenUtil().setWidth(120),
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                  child: Image.network(
                    '${leaderImgs[0]}',
                    fit: BoxFit.fill,
                    width: ScreenUtil().setWidth(120),
                    height: ScreenUtil().setHeight(150),
                  ),
                  // child: Swiper(
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Image.network(
                  //       '${leaderImgs[index]}',
                  //       fit: BoxFit.fill,
                  //       width: ScreenUtil().setWidth(120),
                  //       height: ScreenUtil().setHeight(150),
                  //     );
                  //   },
                  //   itemCount: 3,
                  //   pagination: new SwiperPagination(),
                  //   autoplay: true,
                  // ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Image.network(
                      leaderMsg[0],
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: Image.network(
                      leaderMsg[1],
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: Image.network(
                      leaderMsg[2],
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  void _launcherUrl() async {
    String url = 'tel:' + leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('不能访问');
    }
  }
}
