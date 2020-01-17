// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController typeController = TextEditingController();
//   String showText = '欢迎来到王者荣耀';
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text('首页'),
//           ),
//           body: SingleChildScrollView(
//             //  SingleChildScrollView 解决输入框弹起时界面超出问题
//             child: Container(
//               child: Column(
//                 children: <Widget>[
//                   TextField(
//                     controller: typeController,
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.all(10.0),
//                         labelText: '什么类型',
//                         helperText: '请输入你喜欢的类型'),
//                     autofocus: false,
//                   ),
//                   RaisedButton(
//                     onPressed: _choose,
//                     child: Text('选择完毕'),
//                   ),
//                   Text(
//                     showText,
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                   ),
//                   RaisedButton(
//                     onPressed: _tip,
//                     child: Text('你点击试一下'),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(10.0),
//                     child: Text(
//                       '你试一下， 试试就试试，  你倒是试一试啊， 还是不是了吧， 你说到底有多撒好歌试试',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )),
//     );
//   }

//   void _tip() {
//     showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               title: Text('hello boys and girls'),
//             ));
//   }

//   void _choose() {
//     if (typeController.text.toString() == '') {
//       showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//                 title: Text('请填写你想搜索的东东？？？'),
//               ));
//     } else {
//       getData(typeController.text.toString()).then((res) {
//         setState(() {
//           print(res['data']['name'].toString());
//           showText = res['data']['name'].toString();
//         });
//       });
//     }
//   }

//   Future getData(String typeText) async {
//     try {
//       Response response;
//       var data = {'name': typeText};
//       response = await Dio().post(
//           'https://www.easy-mock.com/mock/5e204e38e1c2cf1d346e0ddd/example/big__bear',
//           queryParameters: data);
//       print(response.data);
//       return response.data;
//     } catch (e) {
//       return print(e);
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../service/serice_method.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String membetTitle = '正在获取数据';

  // 轮播数据
  List SwiperItemLists = [
    'https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/109018/6/4493/88173/5e200edaEc1dd916f/65f2b09c70f866aa.jpg.dpg',
    'https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/84950/39/9494/164222/5e0eaf9fEecca86ec/85c7874c12f58f39.jpg!cr_1125x445_0_171!q70.jpg.dpg',
    'https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/84928/39/10759/100689/5e1ea9f0E36063b75/a3a7b5a569410d4f.jpg!cr_1125x445_0_171!q70.jpg.dpg'
  ];

  // tab数据
  List navigatorList = [
    {
      'image':
          'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/85214/22/10591/16309/5e1d7678Eb1ca0f7f/17731dcc3f9fd7a1.png.webp',
      'mailCategoryName': '京东超市'
    },
    {
      'image':
          'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/106331/11/10653/16676/5e1d774dEd46f78ea/95416b005b867a34.png.webp',
      'mailCategoryName': '数码电器'
    },
    {
      'image':
          'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/89547/14/10538/16176/5e1d7684E03704180/61550d9274e82cbc.png.webp',
      'mailCategoryName': '京东服饰'
    },
    {
      'image':
          'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/100988/18/10619/17121/5e1d7688E412602ff/50b1935ae75df092.png.webp',
      'mailCategoryName': '京东生鲜'
    },
    {
      'image':
          'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/99968/19/10560/17489/5e1d768cE0a4eafae/e92e06dd18852b8f.png.webp',
      'mailCategoryName': '京东到家'
    },
    {
      'image':
          'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/97417/39/10487/16365/5e1d7692Edd330358/4e2b42277be20259.png.webp',
      'mailCategoryName': '充值缴费'
    },
    {
      'image':
          'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/97282/19/10555/16981/5e1d7696Ee3c5b609/eb18ad8da77ce95b.png.webp',
      'mailCategoryName': '9.9元拼'
    },
    {
      'image':
          'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/86442/13/10501/17016/5e1d769bE57cab1cb/7c4aa54e0a56440e.png.webp',
      'mailCategoryName': '领券'
    },
    {
      'image':
          'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/106799/38/10705/16784/5e1d769fEaf123f68/799fc31e4850e450.png.webp',
      'mailCategoryName': '赚钱'
    },
    {
      'image':
          'https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/91489/15/10634/17524/5e1d76a4E514a57ce/1e89e7f74e9a00b3.png.webp',
      'mailCategoryName': 'PLUS会员'
    }
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
          title: Text('首页'),
        ),
        // body: FutureBuilder(                 //  有了futureBuilder 这个widget 就不需要initState了
        //   future: getHomePageContext(),
        //   builder: (context, snapshot) {
        //     if(snapshot.hasData) {
        //       var data = json.decode(snapshot.data.toString());   // 数据反编译 使用json就需要引入import 'dart:convert';
        //       List<Map> SwiperItemLists = (data['data']['slides'] as List).cast();  // 后台数据
        //       List<Map> NavigatorList = (data['data']['category'] as List).cast();
        //       return Column(
        //         children: <Widget>[
        //           SwiperItem(SwiperItemList: SwiperItemLists),
        //           TopNavigator(navigatorList: NavigatorList)
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
              Container(
                  color: Color.fromRGBO(239, 13, 59, 1),
                  child: SingleChildScrollView(
                    child: SwiperItem(SwiperItemList: SwiperItemLists),
                  )),
              Container(
                color: Color.fromRGBO(239, 13, 59, 1),
                child: TopNavigator(navigatorList: navigatorList),
              )
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

//
class TopNavigator extends StatelessWidget {
  final List navigatorList;
  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItem(BuildContext context, item) {
    return InkWell(
        onTap: () {
          print('点击了导航');
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(item['image'], width: ScreenUtil().setWidth(90.0)),
              Text(
                item['mailCategoryName'],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    if (navigatorList.length > 10) {
      navigatorList.removeRange(10, navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: navigatorList.map((item) {
          return _gridViewItem(context, item);
        }).toList(),
      ),
    );
  }
}
