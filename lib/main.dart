import 'package:flutter/material.dart';
import 'package:my_flicke_app/widget/MyDrawer.dart';
import 'package:my_flicke_app/page/MyTabViewPage.dart';

void main() {
  runApp(new TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 3,
        child: new MyScaffold(),
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        bottom: new TabBar(
          tabs: [
            new Tab(icon: new Icon(Icons.directions_car)),
            new Tab(icon: new Icon(Icons.directions_transit)),
            new Tab(icon: new Icon(Icons.directions_bike)),
          ],
        ),
        title: new Text('Tabs Demo'),
      ),
      body: new MyTabViewPage(),
      drawer: new MyDrawer() ,
    );
  }
}
