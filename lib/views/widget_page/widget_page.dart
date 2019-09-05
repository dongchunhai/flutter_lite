import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:startup_style/routers/application.dart';
import 'package:startup_style/components/cate_card.dart';
import 'package:startup_style/model/cat.dart';

class WidgetPage extends StatefulWidget {
  final db;
  final CatControlModel catModel;
  WidgetPage(this.db) 
      : catModel = new CatControlModel(),
        super();

  @override 
  SecondPageState createState() => new SecondPageState(catModel);
}

class SecondPageState extends State<WidgetPage> with AutomaticKeepAliveClientMixin {
  CatControlModel catModel;
  SecondPageState(this.catModel) : super();

  TextEditingController controller;
  String active = 'test';
  String data = '无';

  List<Cat> categories = [];

  @override 
  bool get wantKeepAlive => true;

  @override 
  void initState() {
    super.initState();
    renderCats();
  }

  void renderCats() {
    catModel.getList().then((List data) {
      if (data.isNotEmpty) {
        data.removeLast();
        data.removeAt(0);
        setState(() {
          categories = data;
        });
        print('categories ===> $categories');
      }
    });
  }

  Widget buildGrid() {
    List<Widget> tiles = [];
    Application.widgetTree.children.forEach((dynamic item) {
      tiles.add(new CateCard(category: item));
    });
    return new ListView(
      children: tiles,
    );
    // for (Cat item in categories) {
    //   tiles.add(new CateCard(category: item));
    // }
    // return new ListView(
    //   children: tiles,
    // );
  }

  @override 
  Widget build(BuildContext context) {
    super.build(context);
    if (categories.length == 0) {
      return ListView(children: <Widget>[new Container()],);
    }
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.buildGrid(),
    );
  }
 
}
