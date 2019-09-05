import 'dart:async' show Future;

import 'package:fluro/fluro.dart';
/// import 'package:startup_style/model/responseData.dart';
import './net_utils.dart';
import 'package:startup_style/api/api.dart';
import 'package:startup_style/routers/application.dart';
import 'package:startup_style/routers/routers.dart';

class DataUtils {

  //设置主题颜色
  static Future<bool> setThemeColor(int color, context) async {
    var response =
        await NetUtils.post(Api.SET_THEMECOLOR, {'color': color.toString()});
    if (response['status'] == 401 && response['message'] == '请先登录') {
      Application.router.navigateTo(context, '${Routes.loginPage}',
          transition: TransitionType.nativeModal);
    }
    return response['success'];
  }

  //获取主题颜色
  static Future<String> getThemeColor() async {
    var response = await NetUtils.get(Api.GET_THEMECOLOR);
    return response['success'];
  }

  /// 获取widget列表处的树型数据
  static Future<List> getWidgetTreeList() async {
    try {
      var response = await NetUtils.get(Api.GET_WIDGET_TREE);
      
      print('组件树dddd：$response');
      // print('组件树data：${response.data}');
      if (response != null && response['success']) {
        // return response['data'];
        List temp = new List();
        temp..add(response['data'][0]);
        return response['data'];
      } else {
        return [];
      }
    } catch (error) {
      print('获取组件树 error $error');
      return [];
    }
  }

}
