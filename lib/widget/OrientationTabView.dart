import 'package:flutter/material.dart';

class OrientationTabView extends StatelessWidget {
  final Icon icon;
  final String name;

  OrientationTabView({
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
// Generate 100 Widgets that display their index in the List
          children: new List.generate(100, (index) {
            return new Center(
              child: DirectionItem(
                icon: icon,
                name: name,
                index: index,
              ),
            );
          }),
        );
      },
    );
  }
}

class DirectionItem extends StatelessWidget {
  final Icon icon;
  final String name;
  final int index;

  DirectionItem({Key key, this.icon, this.name, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        height: 50.0,
        child: new RaisedButton.icon(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
          ),
          color: Colors.white70,
          label: new Text(
            '$name $index',
            style: new TextStyle(
              fontSize: 22.0,
              fontFamily: 'Steiner',
              letterSpacing: 2.0,
            ),
          ),
          onPressed: () {
            final mySnackBar = new SnackBar(
              content: new Text('Snackbar called by $name $index'),
              action: new SnackBarAction(
                label: 'undo',
                onPressed: () {},
              ),
            );
            Scaffold.of(context).showSnackBar(mySnackBar);
          },
          icon: icon,
        ),
      ),
    );
  }
}
