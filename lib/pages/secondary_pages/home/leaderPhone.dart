import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderPhone extends StatelessWidget {
  final List leaderMsg;
  final String leaderPhone;
  LeaderPhone({Key key, this.leaderMsg, this.leaderPhone}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),  
      child: InkWell(
        onTap: _launcherUrl,
        child: Row(
          children: <Widget>[
           Expanded(
             child:  Image.network(leaderMsg[0], fit: BoxFit.contain,),
           ),
            Expanded(
              child: Image.network(leaderMsg[1], fit: BoxFit.contain,),
            ),
            Expanded(
              child: Image.network(leaderMsg[2], fit: BoxFit.contain,),
            )
          ],
        )
      ),
    );
  }

  void _launcherUrl() async {
    String url = 'tel:' + leaderPhone;
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      print('不能访问');
    }
  }
}