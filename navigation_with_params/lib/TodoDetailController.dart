import 'package:flutter/material.dart';

class TodoDetailController extends StatelessWidget {
  String content;
  var imageUrl = 'https://s2.showstart.com/img/2019/20190201/0fbff825016d42a59d08daa5e8a7d2fb_600_800_142810.0x0.jpg?imageMogr2/thumbnail/!275x368r/gravity/Center/crop/!275x368';
  TodoDetailController({this.content});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo ${this.content}")),
      body: Center(
        child: GestureDetector(
          child: SizedBox(
            height: 400,
            child: Column(
              children: <Widget>[
                Text("点击返回,并带有一个参数!"),
                Hero(
                  tag: 'image',
                  child: Image.network(this.imageUrl),
                )
              ],
            ),
          ), 
          onTap: () {
            Navigator.pop(context, "详情参数");
          }
        )
      )
    );
  }
}