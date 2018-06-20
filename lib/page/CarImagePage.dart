import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CarPage extends StatelessWidget {
  final Icon icon;
  final String name;

  CarPage({
    Key key,
    this.icon,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new OrientationBuilder(
      builder: (context, orientation) {
        return new GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: new List<ListItem>.generate(100, (index) {
            return index % 4 != 0
                ? CarPageItem(
                    icon: icon,
                    name: name,
                    index: index,
                  )
                : HelloItem(
                    index: index,
                  );
          }),
        );
      },
    );
  }
}

abstract class ListItem extends StatelessWidget {
  ListItem({Key key}) : super(key: key);
}

class CarPageItem extends ListItem {
  final Icon icon;
  final String name;
  final int index;

  CarPageItem({Key key, this.icon, this.name, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Stack(
        children: <Widget>[
          Center(child: CircularProgressIndicator()),
          Center(
            child: CachedNetworkImage(
              placeholder: new CircularProgressIndicator(),
              imageUrl:
                  'http://pic.qiantucdn.com/58pic/28/67/24/66e58PIC9Na8cCfGexfve_PIC2018.jpg',
            ),
          ),
          new GestureDetector(
            onTap: () {
              print('______________ Tap on the picture $index');
            },
          ),
        ],
      ),
    );
  }
}

class HelloItem extends ListItem {
  final int index;

  HelloItem({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int temp = index+1;
    return new Container(
      child: new FlatButton(
          onPressed: () {},
          child: new Text(
            '$temp',
            style: new TextStyle(
              fontFamily: 'Steiner',
              fontSize: 30.0,
            ),
          )),
    );
  }
}
