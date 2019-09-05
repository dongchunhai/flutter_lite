import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:startup_style/routers/application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutIllustra extends StatefulWidget {
  @override 
  AboutIllustraState createState() => new AboutIllustraState();
}

class AboutIllustraState extends State<AboutIllustra> {
  Image buildLocalImage(String localUrl, double width, double height) {
    return Image.asset(
      localUrl,
      width: ScreenUtil.getInstance().setWidth(width),
      height: ScreenUtil.getInstance().setWidth(height),
      fit: BoxFit.cover,
    );
  }

  void goUserPage(BuildContext context) {
    String id = '123';
    String uid = '234';
    String targetRouter = '/user-page/$id/$uid?uid2=333';
    print('goUserPage -> targetRouter ==> $targetRouter');
    Application.router.navigateTo(context, targetRouter, transition: TransitionType.inFromRight);
  }

  @override 
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildLocalImage('assets/images/lite_06.jpg', 750.0, 319),
        buildLocalImage('assets/images/lite_07.jpg', 750.0, 319),
        IconButton(
          padding: EdgeInsets.zero,
          iconSize: 60.0,
          icon: new Image.asset(
            "assets/images/arrow_right_dark.png",
            width: ScreenUtil.getInstance().setWidth(66),
            height: ScreenUtil.getInstance().setWidth(66),
          ),
          onPressed: () {
            this.goUserPage(context);
          }
        ),
      ],
    );
  }
}
