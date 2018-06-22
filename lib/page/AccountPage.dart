import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('AccountPage'),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            child: Center(
              child: Hero(
                tag: 'Account___heroTag',
                child: CircleAvatar(
                  child: Icon(
                    Icons.android,
                    size: 64.0,
                  ),
                  backgroundColor: Colors.white,
                  maxRadius: 64.0,
                  minRadius: 32.0,
                ),
              ),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountAvatarPage()),
              );

            },
          ),
          new ListTile(
            title: new Text('Here is Account Page'),
          )
        ],
      ),
    );
  }

}

class AccountAvatarPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'Account___heroTag',
            child: CircleAvatar(
              child: Icon(
                Icons.android,
                size: 256.0,
              ),
              backgroundColor: Colors.white,
              maxRadius: 256.0,
              minRadius: 128.0,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

