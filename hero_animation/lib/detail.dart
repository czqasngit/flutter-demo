import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情页")),
      //
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("详情页哦...."),
          Hero(child: Text("详情页"), tag: "text"),
          Center(child: Hero(child: SizedBox(width: 200, height: 200, child: Image.asset("images/timg.jpeg", fit: BoxFit.fill)), tag: "image")),
        ]
      ),
    );
  }
}