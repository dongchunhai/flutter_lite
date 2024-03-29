import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routers/routers.dart';
import 'routers/application.dart';
import 'package:startup_style/utils/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_style/utils/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:startup_style/utils/data_utils.dart';
import 'package:startup_style/model/widget.dart';
import 'package:startup_style/views/home.dart';

const int ThemeColor = 0xff285566;
SpUtil sp;
var db;

void main() async {
  final provider = new Provider();
  await provider.init(true);
  sp = await SpUtil.getInstance();

  await DataUtils.getWidgetTreeList().then((List json) {
    List data = WidgetTree.insertDevPagesToList(json, [
      {},
      { "id": "5d7178d0_42ae_4241_9c8a_5c9e1f92b096", "name": "local", "email": "hanxu@qq.com", "author": "hnaxu"}
,
      { "id": "84f38e00_42ae_4241_9c8a_5c9e1f92b096", "name": "test", "email": "adsf.com", "author": "abc"}
,
      { "id": "ee4feb8e_32ae_4241_9c8a_5c9e1f92b096", "name": "standard", "email": "hanxu317@qq.com", "author": "sanfan"}
,
      { "id": "8ab2b5c2_42ae_4241_9c8a_5c9e1f92b096", "name": "standard_for_slider", "email": "hanxu@qq.com", "author": "sanfan"}
    ]);
    Application.widgetTree = WidgetTree.buildWidgetTree(data);
    print("Application.widgetTree>>>> ${Application.widgetTree}");
  });
  db = Provider.db;
  runApp(new MyApp());
} 

class MyApp extends StatefulWidget {
  MyApp() {
    final router = new Router();

    Routes.configureRoutes(router);

    Application.router = router;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasLogin = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _hasLogin = true;
    _isLoading = false;
  }

  showWelcomePage() {
    if (_isLoading) {
      return Container(
        color: const Color(ThemeColor),
        child: Center(
          child: SpinKitPouringHourglass(color: Colors.white),
        ),
      );
    } else {
      // 判断是否已经登录
      if (_hasLogin) {
        return AppPage();
      } else {
        // return LoginPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'title',
      theme: new ThemeData(
        primaryColor: Color(ThemeColor),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
        iconTheme: IconThemeData(
          color: Color(ThemeColor),
          size: 35.0,
        ),
      ),
      home: new Scaffold(body: showWelcomePage()),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      // navigatorObservers: <NavigatorObserver>[Analytics.observer],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    /// Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    /// .. 级联操作符，方法调用者接收者重复时，方法的级联操作符就是为这种情况提供的语法糖。
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);

    Image buildLocalImage(String localUrl, double width, double height) {
      return Image.asset(
        localUrl,
        width: ScreenUtil.getInstance().setWidth(width),
        height: ScreenUtil.getInstance().setWidth(height),
        fit: BoxFit.cover,
      );
    }

    Image buildHttpImage(String httpUrl, double width, double height) {
      return Image.network(
        httpUrl,
        width: ScreenUtil.getInstance().setWidth(width),
        height: ScreenUtil.getInstance().setWidth(height),
        fit: BoxFit.cover, 
      );
    }

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
        Welcome to the keep OA!
        ''',
        softWrap: true,
      ),
    );

    Widget prodSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildLocalImage('assets/images/lite_03.jpg', 274, 441),
          buildLocalImage('assets/images/lite_04.jpeg', 203, 441),
          buildLocalImage('assets/images/lite_05.jpg', 273, 441),
        ],
      ),
    );

    void printScreenSize() {
      print('设备宽度:${ScreenUtil.screenWidth}'); //Device width
      print('设备高度:${ScreenUtil.screenHeight}'); //Device height
      print('设备的像素密度:${ScreenUtil.pixelRatio}'); //Device pixel density
      print(
          '底部安全区距离:${ScreenUtil.bottomBarHeight}dp'); //Bottom safe zone distance，suitable for buttons with full screen
      print(
          '状态栏高度:${ScreenUtil.statusBarHeight}dp'); //Status bar height , Notch will be higher Unit px

      print('实际宽度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleWidth}');
      print('实际高度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleHeight}');

      print(
          '宽度和字体相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleWidth * ScreenUtil.pixelRatio}');
      print(
          '高度相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleHeight * ScreenUtil.pixelRatio}');
      print('系统的字体缩放比例:${ScreenUtil.textScaleFactory}');

      print('750 = setWidth => ${ScreenUtil.getInstance().setWidth(750.0)}');
    }

    printScreenSize();

    return new Scaffold(
      appBar: AppBar(title: Text('轻食派对')),
      body: ListView(
        children: [
          buildHttpImage('http://img95.699pic.com/photo/50105/0194.jpg_wh860.jpg', 750.0, 400),
          buildHttpImage('https://cp1.douguo.com/upload/caiku/a/d/1/yuan_ad5b7c89ccd12aa547f601b8ca36e931.jpg', 750.0, 400),
          buildLocalImage('assets/images/lite_01.jpg', 750.0, 660.5),
          buildLocalImage('assets/images/lite_02.jpeg', 750.0, 319),
          prodSection,
          buildLocalImage('assets/images/lite_06.jpg', 750.0, 319),
          buildLocalImage('assets/images/lite_07.jpg', 750.0, 319),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }
}
