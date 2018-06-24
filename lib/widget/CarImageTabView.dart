import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_flicke_app/page/CarPage.dart';

class CarImageTabView extends StatelessWidget {
  final Icon icon;
  final String name;

  CarImageTabView({
    Key key,
    this.icon,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (context, index) {
        return new Card(
          child: new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarPage(
                        index: index,
                      ),
                ),
              );
            },
            child: new Hero(
              tag: index,
              child: new CachedNetworkImage(
                fit: BoxFit.contain,
                placeholder: new CircularProgressIndicator(),
                imageUrl:
                    'https://images.freeimages.com/images/small-previews/2fa/renault-f1-car-1450956.jpg',
              ),
            ),
          ),
        );
      },
    );
  }

////备份
//  @override
//  Widget build(BuildContext context) {
//    return new OrientationBuilder(
//      builder: (context, orientation) {
//        return new GridView.count(
//          padding: const EdgeInsets.all(8.0),
//          crossAxisCount: orientation == Orientation.portrait ? 4 : 6,
//          children: new List<ListItem>.generate(100, (index) {
//            return index % 4 != 0
//                ? CarPageItem(
//              icon: icon,
//              name: name,
//              index: index,
//            )
//                : HelloItem(
//              index: index,
//            );
//          }),
//        );
//      },
//    );
//  }

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
    return new Container(
      child: Center(
        child: Stack(
          children: <Widget>[
            new Hero(
              tag: index,
              child: new CachedNetworkImage(
                fit: BoxFit.fill,
                placeholder: new CircularProgressIndicator(),
                imageUrl:
                    'https://images.freeimages.com/images/small-previews/2fa/renault-f1-car-1450956.jpg',
              ),
            ),
            new GestureDetector(
              onTap: () {
                print('______________ Tap on the picture $index');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CarPage(
                            index: index,
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HelloItem extends ListItem {
  final int index;

  HelloItem({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int temp = index + 1;
    return new FlatButton(
        onPressed: () {},
        child: new Text(
          '$temp',
          style: new TextStyle(
            fontFamily: 'Steiner',
            fontSize: 30.0,
          ),
        ));
  }
}
