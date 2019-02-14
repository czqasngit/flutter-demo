import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("添加Todo")),
        body: Column(
          children: <Widget>[
            // TextFormField(onSaved: (text) => print("输入的文本"))
            Text("............")
          ]
        )
    );
  }
}