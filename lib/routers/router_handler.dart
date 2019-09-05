import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:startup_style/components/category.dart';
import '../widgets/404.dart';
// import 'package:startup_style/components/full_screen_code_dialog.dart';
import 'package:startup_style/views/web_page/web_view_page.dart';
import 'package:startup_style/views/home.dart';
// import 'package:startup_style/views/login_page/login_page.dart';
import 'package:startup_style/views/user_page/user_page.dart';

// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new AppPage();
  },
);

var categoryHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String name = params["ids"]?.first;
    print('name =>>> $name');
    return new CategoryHome(name);
  },
);

var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WidgetNotFound();
});
// var loginPageHandler = new Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return LoginPage();
// });

// var fullScreenCodeDialog = new Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   String path = params['filePath']?.first;
//   return new FullScreenCodeDialog(
//     filePath: path,
//   );
// });

var webViewPageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return new WebViewPage(url, title);
});

var userPageHand = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String id = params['id']?.first;
    String uid = params['uid']?.first;
    String uid2 = params['uid2']?.first;
    return new UserPage(id: id, uid: uid, uid2: uid2);
  }
);
