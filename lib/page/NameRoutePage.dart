import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class NameRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home :MainNameRoutePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => MainNameRoutePage(),
        '/first': (context) => FirstNameRoutePage(),
        '/second': (context) => SecondNameRoutePage(),
        '/third': (context) => ThirdNameRoutePage(),
      },
    );
  }
}

class MainNameRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Main Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18.0, 12.0, 18.0, 24.0),
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Hero(
                      tag: 'first__heroTag',
                      child: CachedNetworkImage(
                        placeholder: CircularProgressIndicator(),
                        imageUrl:
                            'http://overwatch.nos.netease.com/2/media/Wallpapers/lineup-standard.3DDlu.jpg',
                      ),
                    ),
                  ],
                  fit: StackFit.loose,
                ),
                new ListTile(
                  title: new Text(
                    'overwatch',
                    style: TextStyle(fontFamily: 'Steiner'),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('save'),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/first');

                      },
                      child: Text('Zoom In'),
                    ),
                  ],
                )
              ],
            ),
          ),
          new Card(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Hero(
                      tag: 'second__heroTag',
                      child: CachedNetworkImage(
                        placeholder: CircularProgressIndicator(),
                        imageUrl:
                        'http://diablo3.nos.netease.com/2/artwork/artwork1986.jpg',
                      ),
                    ),
                  ],
                ),
                ListTile(
                  title: Text(
                    'Diablo 3',
                    style: TextStyle(fontFamily: 'Steiner'),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: Text('save'),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/second');
                      },
                      child: Text('Zoom In'),
                    ),
                  ],
                )
              ],
            ),
          ),
          new Card(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Hero(
                      tag: 'third__heroTag',
                      child: CachedNetworkImage(
                        placeholder: CircularProgressIndicator(),
                        imageUrl:
                        'http://img1.cache.netease.com/game/sc2/media/artwork/artwork-starcraft04-large.jpg',
                      ),
                    ),
                  ],
                ),
                ListTile(
                  title: Text(
                    'Star Craft 2',
                    style: TextStyle(fontFamily: 'Steiner'),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: Text('save'),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/third');
                      },
                      child: Text('Zoom In'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FirstNameRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Overwatch'),
      ),
      body: Hero(
        tag: 'first',
        child: CachedNetworkImage(
          placeholder: CircularProgressIndicator(),
          imageUrl:
          'http://overwatch.nos.netease.com/2/media/Wallpapers/lineup-standard.3DDlu.jpg',
        ),
      ),
    );
  }
}

class SecondNameRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Diablo 3'),
      ),
      body: Hero(
        tag: 'second',
        child: Image.network(
            'http://diablo3.nos.netease.com/2/artwork/artwork1986.jpg'),
      ),
    );
  }
}

class ThirdNameRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Star Craft 2'),
      ),
      body: Hero(
        tag: 'third',
        child: Image.network(
            'http://img1.cache.netease.com/game/sc2/media/artwork/artwork-starcraft04-large.jpg'),
      ),
    );
  }
}
