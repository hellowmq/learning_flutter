import 'package:flutter/material.dart';

class NameRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(initialRoute: '/', routes: {
      '/': (context) => FirstNameRoutePage(),
      '/second': (context) => SecondNameRoutePage(),
      '/third': (context) => ThirdNameRoutePage(),
    });
  }
}

class FirstNameRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('First Page'),
      ),
      body: new Center(
        child: new ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: Text('Next Page'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/second',
                );
              },
            ),
          ],
        )
      ),
    );
  }
}

class SecondNameRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Second Page'),
      ),
      body: new Center(
          child: new ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                child: Text('Last Page'),
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
              ),
              new RaisedButton(
                child: Text('Next Page'),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/third',
                  );
                },
              ),
            ],
          )),
    );
  }
}


class ThirdNameRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Third Page'),
      ),
      body: new Center(
          child: new ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                child: Text('Last Page'),
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
              ),
            ],
          )),
    );
  }
}
