import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:startup_style/routers/application.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPage extends StatelessWidget {
  final String id;
  final String uid;
  final String uid2;
  UserPage({this.id, this.uid, this.uid2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '我的 - $id - $uid - $uid2',
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil.getInstance().setSp(36.0),
            fontWeight: FontWeight.normal,
          ),
        ),
        leading: IconButton(
          icon: Image.asset(
            'assets/images/close.png',
            width: ScreenUtil.getInstance().setWidth(48.0),
            height: ScreenUtil.getInstance().setWidth(48.0),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: UserPageContent(),
    );
  }
}

class UserPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: ScreenUtil.getInstance().setWidth(10)),
      child: Column(
        children: <Widget>[
          // 第一行
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(88),
                height: ScreenUtil.getInstance().setWidth(88),
                margin: EdgeInsets.only(left: 16),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
              ),
              Container(
                height: ScreenUtil.getInstance().setWidth(120),
                margin: EdgeInsets.only(
                    left: ScreenUtil.getInstance().setSp(7),
                    right: ScreenUtil.getInstance().setSp(14)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/blank.jpg',
                      width: ScreenUtil.getInstance().setWidth(600),
                      height: ScreenUtil.getInstance().setWidth(100),
                    ),
                    Positioned(
                      left: ScreenUtil.getInstance().setWidth(25),
                      top: ScreenUtil.getInstance().setWidth(14),
                      child: Text(
                        '张老师布置了任务，请完成～',
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(28),
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          // 第二行
          Container(
            margin: const EdgeInsets.fromLTRB(6, 24, 6, 30),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Unit 1 lession 3 about animal',
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(40),
                      fontFamily: 'Round',
                      color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.getInstance().setWidth(0), bottom: 13),
                  width: ScreenUtil.getInstance().setWidth(400),
                  height: ScreenUtil.getInstance().setWidth(300),
                  child: Image.asset('assets/images/lite_06.jpg'),
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: <Widget>[
                    WorkTotalItem(
                      title: '课文跟读 1',
                    ),
                    WorkTotalItem(
                      title: '课文跟读 2',
                    ),
                    WorkTotalItem(
                      title: '课文跟读 3',
                    ),
                    WorkTotalItem(
                      title: '课文跟读 4',
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 178),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                          'http://img95.699pic.com/photo/50105/0194.jpg_wh860.jpg'),
                      Positioned(
                        left: ScreenUtil.getInstance().setWidth(4),
                        top: ScreenUtil.getInstance().setWidth(4),
                        child: Text(
                          '预习',
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(28),
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    '明天12:00截止',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(24),
                      color: const Color(0xff285566),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 第三行
          LineTips(
            title: Text(
              '给家长发个通知吧',
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(28),
                  color: const Color(0xff285566)),
            ),
          ),
          // 第四行
          Container(
            margin: const EdgeInsets.only(left: 32),
            height: ScreenUtil.getInstance().setWidth(60),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: ScreenUtil.getInstance().setWidth(60),
                    icon: new Image.asset("assets/images/wechat.png"),
                    onPressed: () {
                      print("share to wechat");
                    }),
                new Container(
                  margin: const EdgeInsets.only(left: 32.0),
                  child: new IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: ScreenUtil.getInstance().setWidth(60),
                      icon: new Image.asset(
                          "assets/images/wechatFriend.png"),
                      onPressed: () {
                        print("share to qq");
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LineTips extends StatelessWidget {
  static const defaultMargin = const EdgeInsets.only(left: 15, right: 15);
  final Widget title;
  final EdgeInsetsGeometry margin;

  LineTips({@required this.title, this.margin = defaultMargin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              color: const Color(0xff285566),
              height: 1,
            ),
          ),
          title,
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              color: const Color(0xff285566),
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class WorkTotalItem extends StatelessWidget {
  final String title;

  WorkTotalItem({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Text(
        '$title',
        style: TextStyle(
            color: Colors.white, fontSize: ScreenUtil.getInstance().setSp(36)),
      ),
    );
  }
}
