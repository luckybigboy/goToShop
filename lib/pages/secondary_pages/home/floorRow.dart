import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloorRow extends StatelessWidget {
  final floorArr;
  FloorRow({Key key, this.floorArr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[_firstRow(), _secondRow()],
    );
  }

  Widget _item(url) {
    return InkWell(
      child: Container(
        width: ScreenUtil().setWidth(375),
        child: Image.network(url, fit: BoxFit.fill,),
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        _item(floorArr['top']["firstLeftImg"]),
        Column(
          children: <Widget>[
            _item(floorArr["top"]["firstRightImg"][0]),
            _item(floorArr["top"]["firstRightImg"][1])
          ],
        )
      ],
    );
  }

  Widget _secondRow() {
    return Row(
      children: <Widget>[
        _item(floorArr["bottom"]["left"]),
        _item(floorArr["bottom"]["right"])
      ],
    );
  }
}
