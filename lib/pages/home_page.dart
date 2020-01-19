import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../service/serice_method.dart';

// pages
import './secondary_pages/home/adBanner.dart';
import './secondary_pages/home/leaderPhone.dart';
import './secondary_pages/home/swiper.dart';
import './secondary_pages/home/topNavigator.dart';
import './secondary_pages/home/secondsKill.dart';

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

  final BannerArr = [
    'https://m.360buyimg.com/mobilecms/s376x240_jfs/t1/32449/33/15631/174497/5cc2d86bE0289110c/9c53e25651659d43.png!q70.jpg.dpg',
    'https://m.360buyimg.com/mobilecms/s376x240_jfs/t1/49601/16/12206/115887/5d91b4d5E34709952/aba2bcb4855e6e52.png!q70.jpg.dpg'
  ];

  //  leaderMsg
  final List<String> leaderMsg = [
    'https://m.360buyimg.com/mobilecms/s140x140_jfs/t1/105758/39/10683/35934/5e2315e9E41e43f6e/f65a24de73983da4.png!q70.jpg.dpg',
    'https://m.360buyimg.com/mobilecms/s140x140_jfs/t1/102953/18/10961/39735/5e2315f7Efcce3049/1d3de2bcc7e3fe77.png!q70.jpg.dpg',
    'https://m.360buyimg.com/mobilecms/jfs/t1/103804/16/10834/159993/5e231963E1017bb2c/b096e27d4c193715.gif'
  ];
  final String leaderPhone = '13296618721';

  // secondsSkillMsg
  final List<Map> secondsSkillArr = [
    {
      'url':
          'https://img14.360buyimg.com/n1/s150x150_jfs/t1/85292/40/10545/158194/5e1ebb1bEf9a2ca69/a4db5216d9d4f7ca.jpg.dpg',
      'currentPrice': '96',
      'originPrince': '298'
    },
    {
      'url':
          'https://img14.360buyimg.com/n1/s150x150_jfs/t1/67232/37/8586/92531/5d67882cE0dd981be/91f19a860a73d8ad.jpg.dpg',
      'currentPrice': '115',
      'originPrince': '339'
    },
    {
      'url':
          'https://img14.360buyimg.com/n1/s150x150_jfs/t1/88030/1/10421/163122/5e1bde07E6ce54c94/fe2fbf9bb8349d21.jpg.dpg',
      'currentPrice': '124.99',
      'originPrince': '299'
    },
    {
      'url':
          'https://img14.360buyimg.com/n1/s150x150_jfs/t12436/187/278016925/407757/24f24356/5a070460N41b5c1c1.jpg.dpg',
      'currentPrice': '39.8',
      'originPrince': '89'
    },
    {
      'url':
          'https://img14.360buyimg.com/n1/s150x150_jfs/t1/98913/32/143/442886/5da84a2eEc4f98df9/3fcb4daeec17d3c2.jpg.dpg',
      'currentPrice': '123.99',
      'originPrince': '399'
    },
    {
      'url':
          'https://img14.360buyimg.com/n1/s150x150_jfs/t1/86023/20/10708/172944/5e1e7e25Ecec8424c/89ee2f04ca3d9a9e.jpg.dpg',
      'currentPrice': '123.99',
      'originPrince': '399'
    },
    {
      'url':
          'https://img14.360buyimg.com/n1/s150x150_jfs/t1/66260/25/11056/149965/5d8825a6Eb47ec609/e64417c2637739fe.jpg.dpg',
      'currentPrice': '123.99',
      'originPrince': '399'
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

          body: ListView(
            children: <Widget>[
              Container(
                color: Color.fromRGBO(239, 13, 59, 1),
                child: Column(
                  children: <Widget>[
                    Container(
                        child: SingleChildScrollView(
                      child: SwiperItem(SwiperItemList: SwiperItemLists),
                    )),
                    Container(
                      height: ScreenUtil().setHeight(300),
                      child: TopNavigator(navigatorList: navigatorList),
                    ),
                    Container(
                      child: LeaderPhone(
                          leaderMsg: leaderMsg, leaderPhone: leaderPhone),
                    ),
                    SecondsKill(secondsSkillArr: secondsSkillArr),
                    Container(
                      child: SingleChildScrollView(
                        child: AdBanner(recommendBanner: BannerArr),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
