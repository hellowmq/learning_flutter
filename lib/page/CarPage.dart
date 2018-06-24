import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CarPage extends StatelessWidget {
  final int index;

  CarPage({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Image $index'),
      ),
      body: Center(
        child: Hero(
          tag: index,
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            placeholder: CircularProgressIndicator(),
            imageUrl:
                'https://images.freeimages.com/images/small-previews/2fa/renault-f1-car-1450956.jpg',
          ),
        ),
      ),
    );
  }
}
