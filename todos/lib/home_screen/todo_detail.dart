import 'package:flutter/material.dart';

class TodoDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoDetailState();
}
class TodoDetailState extends State<TodoDetail> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("待办事项详情")
    );
  }
}