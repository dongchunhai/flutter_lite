import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo xxx',
      theme: ThemeData(
        primaryColor: Color(0xff584f60),
      ),
      color: Color(0xff000000),
      home: new MyHomePage(title: 'FlutterScreenUtil Demo'),
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

    Image buildImage(String imageUrl, double width, double height) {
      return Image.asset(
        imageUrl,
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
          buildImage('assets/images/carnival_03.jpg', 274, 441),
          buildImage('assets/images/carnival_04.jpg', 203, 441),
          buildImage('assets/images/carnival_05.jpg', 273, 441),
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
      appBar: AppBar(title: Text('卡路里狂欢节')),
      body: ListView(
        children: [
          buildImage('assets/images/carnival_01.jpg', 750.0, 660.5),
          buildImage('assets/images/carnival_02.jpg', 750.0, 319),
          prodSection,
          buildImage('assets/images/carnival_06.jpg', 750.0, 519),
          buildImage('assets/images/carnival_07.jpg', 750.0, 426),
          buildImage('assets/images/carnival_08.jpg', 750.0, 342),
          buildImage('assets/images/carnival_09.jpg', 750.0, 383),
          buildImage('assets/images/carnival_10.jpg', 750.0, 3102),
          buildImage('assets/images/carnival_11.jpg', 750.0, 1423),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }
}
