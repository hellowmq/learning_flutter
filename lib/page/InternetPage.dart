import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response = await http.get(
      'https://m.weibo.cn/api/container/getIndex?containerid=1076035772317385&page=3');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
//
//class Post {
//  final int ok;
//  final String userId;
//  final String screenName;
//  final String scheme;
//  final String text;
//  final String source;
//
//  Post({this.ok,this.userId,this.screenName,this.scheme,this.text,this.source});
//
//  factory Post.fromJson(Map<String, dynamic> json) {
//    return Post(
//      ok:json['ok'],
//      userId: json['data']['cards'](1)['mblog']['id'],
//      screenName:json['data']['cards'](1)['mblog']['user']['screen_name'],
//      scheme: json['data']['cards'](1)['scheme'],
//      text:json['data']['cards'](1)['mblog']['text'] ,
////    text: json['ok'],
//      source:json['data']['cards'](1)['mblog']['source'] ,
//
//
//    );
//  }
//}

class Post{
  final int ok;
  final String containerId;

  Post({this.ok,this.containerId});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      ok:json['ok'],
      containerId:json['data']['cardlistInfo']['containerId'],
    );
  }
}

class InternetPage extends StatefulWidget {
  @override
  _InternetPageState createState() => _InternetPageState();
}

class _InternetPageState extends State<InternetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Post>(
          future: fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.containerId.toString()+'++++++++++++++++++++++++');
            } else if (snapshot.hasError) {
              print('okKKKKKKKKKKKKKKKKKKKKKK');

              print('${snapshot.data.ok}');
              return Text("${snapshot.error}"+'------------------------------');
            }

            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
