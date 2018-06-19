import 'package:flutter/material.dart';
import 'package:my_flicke_app/widget/OrientationList.dart';

class MyTabViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TabBarView(
      children: [
        new OrientationList(
          icon: new Icon(
            Icons.directions_car,
          ),
          name: 'car',
        ),
        new OrientationList(
          icon: new Icon(
            Icons.directions_transit,
          ),
          name: 'transit',
        ),
        new OrientationList(
          icon: new Icon(
            Icons.directions_bike,
          ),
          name: 'bike',
        ),
      ],
    );
  }
}
