import 'package:flutter/material.dart';

class DismissingPage extends StatelessWidget {
  DismissingPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = new List<String>.generate(100, (i) => "Item ${i + 1}");
    final boolItems = new List<bool>.generate(100, (i) => false);
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: new Text('Dismissing Items'),
      ),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return new Dismissible(
            key: new Key(item),
            direction: DismissDirection.endToStart,

            onDismissed: (direction) {
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(
                    new SnackBar(
                      content: new Text("$item dismissed"),
                    ),
                  );
            },
            // Show a red background as the item is swiped away
            background: new Container(color: Colors.red),
            child: new ListTile(
              leading: new Checkbox(
                value: boolItems[index],
                onChanged: (bool newValue) {},
              ),
              title: new Text('$item'),
              trailing: new FlutterLogo(),
            ),
          );
        },
      ),
    );
  }
}
