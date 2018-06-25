//import 'dart:async';
//import 'dart:convert';
//
//import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//
//Future<List<Photo>> fetchPhotos(http.Client client) async {
//  final response =
//      await client.get('https://jsonplaceholder.typicode.com/photos');
//
//  // Use the compute function to run parsePhotos in a separate isolate
//  return compute(parsePhotos, response.body);
//}
//
//// A function that will convert a response body into a List<Photo>
//List<Photo> parsePhotos(String responseBody) {
//  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//
//  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
//}
//
//class Photo {
//  final int albumId;
//  final int id;
//  final String title;
//  final String url;
//  final String thumbnailUrl;
//
//  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});
//
//  factory Photo.fromJson(Map<String, dynamic> json) {
//    return Photo(
//      albumId: json['albumId'] as int,
//      id: json['id'] as int,
//      title: json['title'] as String,
//      url: json['url'] as String,
//      thumbnailUrl: json['thumbnailUrl'] as String,
//    );
//  }
//}
//
//class ParseJsonPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final appTitle = 'Isolate Demo';
//
//    return MaterialApp(
//      title: appTitle,
//      home: ParseJsonHomePage(title: appTitle),
//    );
//  }
//}
//
//class ParseJsonHomePage extends StatelessWidget {
//  final String title;
//
//  ParseJsonHomePage({Key key, this.title}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(title),
//      ),
//      body: FutureBuilder<List<Photo>>(
//        future: fetchPhotos(http.Client()),
//        builder: (context, snapshot) {
//          if (snapshot.hasError) print(snapshot.error);
//
//          return snapshot.hasData
//              ? PhotosList(photos: snapshot.data)
//              : Center(child: CircularProgressIndicator());
//        },
//      ),
//    );
//  }
//}
//
//class PhotosList extends StatelessWidget {
//  final List<Photo> photos;
//
//  PhotosList({Key key, this.photos}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return GridView.builder(
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 2,
//      ),
//      itemCount: photos.length,
//      itemBuilder: (context, index) {
//        return Image.network(photos[index].thumbnailUrl);
//      },
//    );
//  }
//}
//
//

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Comments>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/comments');

  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parsePhotos, response.body);
}

// A function that will convert a response body into a List<Photo>
List<Comments> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Comments>((json) => Comments.fromJson(json)).toList();
}

class Comments {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comments({this.postId, this.id, this.name, this.email, this.body});

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      postId: json['postId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );
  }
}

class ParseJsonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: ParseJsonHomePage(title: appTitle),
    );
  }
}

class ParseJsonHomePage extends StatelessWidget {
  final String title;

  ParseJsonHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Comments>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? CommentsList(comments: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CommentsList extends StatelessWidget {
  final List<Comments> comments;

  CommentsList({Key key, this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return new ListTile(
          leading: CircleAvatar(
            child: Text(
              comments[index].name[0].toUpperCase(),
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          title: Text(comments[index].name),
          subtitle: Text(comments[index].email),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (
                  context,
                ) =>
                    CommentDetailsPage(comment: comments[index]),
              ),
            );
          },
        );
      },
      itemCount: comments.length,
    );
  }
}

class CommentDetailsPage extends StatelessWidget {
  final Comments comment;

  CommentDetailsPage({this.comment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment ' + comment.id.toString()),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 64.0),
        children: <Widget>[
          Center(
            child: CircleAvatar(
              minRadius: 32.0,
              maxRadius: 64.0,
              child: Text(
                comment.name[0].toUpperCase(),
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                comment.name.toUpperCase(),
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
//          Divider(),
          Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'E-mail',
                    textScaleFactor: 1.2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    comment.email,
                    style: TextStyle(letterSpacing: 1.0),
                  ),
                ),
                Divider(),
                ListTile(
                  subtitle: Text(
                    comment.body,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0,
                      wordSpacing: 1.2,
                    ),
                  ),
                ),
                ButtonBar(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.thumb_down, color: Colors.grey),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.share, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
