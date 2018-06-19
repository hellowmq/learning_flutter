import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the Drawer if there isn't enough vertical
      // space to fit everything.
      child: new ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          new DrawerHeader(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new CircleAvatar(
                  child: new Icon(
                    Icons.android,
                    size: 36.0,
                  ),
                  backgroundColor: Colors.white,
                  maxRadius: 32.0,
                  minRadius: 16.0,
                ),
                new ListTile(
                  title: new Text(
                    'User Names',
                    style: new TextStyle(fontFamily: 'Steiner'),
                  ),
                  subtitle: new Text('wenmq47@gmail.com'),
                ),
              ],
            ),
            decoration: new BoxDecoration(
              color: Colors.blue,
            ),
          ),
          new ListTile(
            trailing: new Icon(Icons.chevron_right),
            title: new Text(
              'Item 1',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer

              print('__________1__________');
              Navigator.pop(context);
            },
          ),
          new ListTile(
            trailing: new Icon(Icons.chevron_right),
            title: new Text(
              'Item 2',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              print('__________2__________');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

}