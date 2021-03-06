import 'package:flutter/material.dart';
import 'package:my_flicke_app/page/DismissingPage.dart';
import 'package:my_flicke_app/page/TodoPage.dart';
import 'package:my_flicke_app/page/NameRoutePage.dart';
import 'package:my_flicke_app/page/AccountPage.dart';
import 'package:my_flicke_app/page/InternetPage.dart';
import 'package:my_flicke_app/page/SocketPage.dart';
import 'package:my_flicke_app/page/ParseJsonPage.dart';

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
                GestureDetector(
                  child: Hero(
                    tag: 'Account___heroTag',
                    child: CircleAvatar(
                      child: Icon(
                        Icons.android,
                        size: 36.0,
                      ),
                      backgroundColor: Colors.white,
                      maxRadius: 32.0,
                      minRadius: 16.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountPage()),
                    );
                  },
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
                MaterialPageRoute(builder: (context) => DismissingPage()),
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
                  builder: (context) => TodoPage(
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
            leading: new Icon(Icons.videogame_asset),
            trailing: new Icon(Icons.chevron_right),
            title: new Text(
              'Blizzard',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
//                  builder: (context) => NameRoutePage(),

                  builder: (context) => MyPage(),
                ),
              );
            },
          ),
          new ListTile(
            leading: new Icon(Icons.open_in_browser),
            trailing: new Icon(Icons.chevron_right),
            title: new Text(
              'Internet',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InternetPage(),
                ),
              );
            },
          ),
          new ListTile(
            leading: new Icon(Icons.room_service),
            trailing: new Icon(Icons.chevron_right),
            title: new Text(
              'Socket',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SocketPage(),
                ),
              );
            },
          ),
          new ListTile(
            leading: new Icon(Icons.system_update_alt),
            trailing: new Icon(Icons.chevron_right),
            title: new Text(
              'Json',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ParseJsonPage(),
                ),
              );
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
