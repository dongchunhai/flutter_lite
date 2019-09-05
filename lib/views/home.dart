import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:startup_style/views/menu_page/menu_page.dart';
import 'package:startup_style/views/about_illustra/about_illustra.dart';

const int ThemeColor = 0xff285566;

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<AppPage>
    with SingleTickerProviderStateMixin {
  String appBarTitle = tabData[0]['text'];
  List<Widget> list = List();
  int _currentIndex = 0;
  static List tabData = [
    {'text': 'MENUS', 'icon': Icon(Icons.language)},
    // {'text': '我的', 'icon': Icon(Icons.extension)},
    // {'text': '组件收藏', 'icon': Icon(Icons.favorite)},
    {'text': '关于', 'icon': Icon(Icons.import_contacts)},
  ];

  List<BottomNavigationBarItem> myTabs = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < tabData.length; i++) {
      myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }
    list
      ..add(MenuPage())
      // ..add(UserPage())
      ..add(AboutIllustra());
  }

  @override
  void dispose() {
    super.dispose();
  }

  // initSearchHistory() async {}

  // void onWidgetTap(WidgetPoint widgetPoint, BuildContext context) {
  //   List widgetDemosList = new WidgetDemoList().getDemos();
  //   String targetName = widgetPoint.name;
  //   String targetRouter = '/category/error/404';
  //   widgetDemosList.forEach((item) {
  //     if (item.name == targetName) {
  //       targetRouter = item.routerName;
  //     }
  //   });
  //   Application.router.navigateTo(context, "$targetRouter");
  // }

  Widget buildSearchInput(BuildContext context) {}

  renderAppBar(BuildContext context, Widget widget, int index) {
    print('renderAppBar ======> ${index}');
    if (index == 0) {
      return null;
    }
    return AppBar(title: Text(appBarTitle));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: renderAppBar(context, widget, _currentIndex),
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: myTabs,
        // 点击高亮
        currentIndex: _currentIndex,
        // 修改页面
        onTap: _ItemTapped,
        // fixed 固定，shiffting 点击移动
        type: BottomNavigationBarType.fixed,
        fixedColor: Color(ThemeColor),
      ),
    );
  }

  void _ItemTapped(int index) {
    print('onTap ======> ${index}');
    setState(() {
      _currentIndex = index;
      appBarTitle = tabData[index]['text'];
    });
    // showDialog(
    //     context: context,
    //     builder: (_) => new AlertDialog(
    //             title: new Text("Dialog Title"),
    //             content: new Text("This is my content"),
    //             actions: <Widget>[
    //               new FlatButton(
    //                 child: new Text("CANCEL"),
    //                 onPressed: () {
    //                   Navigator.of(context).pop();
    //                 },
    //               ),
    //               new FlatButton(
    //                 child: new Text("OK"),
    //                 onPressed: () {
    //                   Navigator.of(context).pop();
    //                 },
    //               )
    //             ]));
  }
}
