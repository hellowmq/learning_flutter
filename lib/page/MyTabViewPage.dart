import 'package:flutter/material.dart';
import 'package:my_flicke_app/widget/OrientationTabView.dart';
import 'package:my_flicke_app/widget/CarImageTabView.dart';

class MyTabViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TabBarView(
      children: [
        new CarImageTabView(
          icon: new Icon(
            Icons.directions_car,
          ),
          name: 'car',
        ),
        new OrientationTabView(
          icon: new Icon(
            Icons.directions_transit,
          ),
          name: 'transit',
        ),
        new OrientationTabView(
          icon: new Icon(
            Icons.directions_bike,
          ),
          name: 'bike',
        ),
      ],
    );
  }
}
