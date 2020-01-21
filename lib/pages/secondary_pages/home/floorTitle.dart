import 'package:flutter/material.dart';

class FloorTitle extends StatelessWidget {
  final String floorTitle;
  FloorTitle({Key key, this.floorTitle}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Image.network(floorTitle),
    );
  }
}