import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // Widget titleSection = new Container(
  //   padding: const EdgeInsets.all(32.0),
  //   child: new Row(
  //     children: [
  //       new Expanded(
  //         child: new Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             new Container(
  //               padding: const EdgeInsets.only(bottom: 8.0),
  //               child: new Text(
  //                 'Oeschinen Lake Campground',
  //                 style: new TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //             new Text(
  //               'Kandersteg, Switzerland',
  //               style: new TextStyle(
  //                 color: Colors.grey[500],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       new Icon(
  //         Icons.star,
  //         color: Colors.red[500],
  //       ),
  //       new Text('41'),
  //     ],
  //   ),
  // );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        final tiles = _saved.map((pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        });
        final divided = ListTile.divideTiles(
          context: context,
          tiles: tiles,
        ).toList();

        return Scaffold(
          appBar: AppBar(
            title: Text('Saved Suggestions'),
          ),
          body: ListView(
            children: divided,
          ),
        );
      },
    ));
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
