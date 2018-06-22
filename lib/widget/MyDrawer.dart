import 'package:flutter/material.dart';
import 'package:my_flicke_app/page/DismissingPage.dart';
import 'package:my_flicke_app/page/TodoPage.dart';
import 'package:my_flicke_app/page/NameRoutePage.dart';

class MyDrawer extends StatelessWidget {
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
            leading: new Icon(Icons.list),
            trailing: new Icon(Icons.chevron_right),
            title: new Text(
              'List',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              print('__________1__________');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DismissingItemList()),
              );
            },
          ),
          new ListTile(
            leading: new Icon(Icons.assignment),
            trailing: new Icon(Icons.chevron_right),
            title: new Text(
              'Todos',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              print('__________2__________');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoScreen(
                        todos: List.generate(
                          0,
                          (i) => Todo(
                                'Todo $i',
                                'A description of what needs to be done for Todo $i',
                              ),
                        ),
                      ),
                ),
              );
            },
          ),
          new ListTile(
            leading: new Icon(Icons.search),
            trailing: new Icon(Icons.chevron_right),
            title: new Text(
              'Search',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NameRoutePage(),
                ),
              );
            },
          ),
          new ListTile(
            leading: new Icon(Icons.settings),
            trailing: new Icon(Icons.chevron_right),
            title: new Text(
              'Settings',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              print('__________3__________');
              Navigator.pop(context);
            },
          ),
          new Divider(
            height: 4.0,
          ),
          new ListTile(
            leading: new Icon(Icons.info),
            trailing: new Icon(Icons.chevron_right),
            title: new Text(
              'About',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              print('__________about__________');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
