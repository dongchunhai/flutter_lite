import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          new Image.asset(
            'assets/images/carnival_03.jpg',
            width: 137.0,
            height: 220.5,
            fit: BoxFit.cover,
          ),
          new Image.asset(
            'assets/images/carnival_04.jpg',
            width: 101.5,
            height: 220.5,
            fit: BoxFit.cover,
          ),
          new Image.asset(
            'assets/images/carnival_05.jpg',
            width: 136.5,
            height: 220.5,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo xxx',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('卡路里狂欢节')),
        body: ListView(
          children: [
            new Image.asset(
              'assets/images/carnival_01.jpg',
              width: 375.0,
              height: 330.5,
              fit: BoxFit.cover,
            ),
            new Image.asset(
              'assets/images/carnival_02.jpg',
              width: 375.0,
              height: 158.5,
              fit: BoxFit.cover,
            ),
            prodSection,
            new Image.asset(
              'assets/images/carnival_06.jpg',
              width: 375.0,
              height: 260.0,
              fit: BoxFit.cover,
            ),
            new Image.asset(
              'assets/images/carnival_07.jpg',
              width: 375.0,
              height: 213.0,
              fit: BoxFit.cover,
            ),
            new Image.asset(
              'assets/images/carnival_08.jpg',
              width: 375.0,
              height: 171.0,
              fit: BoxFit.cover,
            ),
            new Image.asset(
              'assets/images/carnival_09.jpg',
              width: 375.0,
              height: 191.5,
              fit: BoxFit.cover,
            ),
            new Image.asset(
              'assets/images/carnival_10.jpg',
              width: 375.0,
              height: 1550.0,
              fit: BoxFit.cover,
            ),
            new Image.asset(
              'assets/images/carnival_11.jpg',
              width: 375.0,
              height: 711.5,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}
