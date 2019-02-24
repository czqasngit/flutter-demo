import 'package:flutter/material.dart';
import 'TodoDetailController.dart';

class TodoCell extends StatelessWidget {
  String title;
  TodoCell(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0.5, 0, 0),
      decoration: BoxDecoration(color: Colors.orange),
      child: GestureDetector(
        onTap: () {
          print("点击了: ${this.title}");
          // Navigator.push(context, MaterialPageRoute(builder: (context) => TodoDetailController(content: this.title)));
          _navigationWaitingResult(context, this.title);
        }, 
        child: Container(
          height: 50,
          child: Column(
            children: <Widget>[
              Text("${this.title}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        ),
      )
    );
  }
  _navigationWaitingResult(BuildContext context, String title) async {
    // var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => TodoDetailController(content: title)));
    var result = await Navigator.pushNamed(context, '/detail');
    // future.then((value) => print(value));
    // print("Push完成:$future");
    Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text("$result")));
  }
}

class TodoListController extends StatelessWidget {
  var imageUrl = 'https://s2.showstart.com/img/2018/20181112/2f6c498ebabd47c3ba2f57e7c886d952_1280_900_1549294.0x0.jpg?imageMogr2/thumbnail/!312x220r/gravity/Center/crop/!312x220';
  @override
  Widget build(BuildContext context) {
    var todos = ['吃早饭', '上学', '上课', '吃中午', '放学', '回家', '睡觉','吃早饭', '上学', '上课', '吃中午', '放学', '回家', '睡觉'];
    var todoCells = todos.map((title) => TodoCell(title)).toList();
    return Scaffold(
      appBar: AppBar(title: Text("Todo")),
      body: Column(
        children: <Widget>[
          Hero(
            tag: 'image',
            child: GestureDetector(
              onTap: () => print("图片被点击"),
              child: Image.network(this.imageUrl),
            ),
          ),
          Expanded(child: ListView(children: todoCells))
        ],
      ),
    );
  }
}