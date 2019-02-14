
import 'package:flutter/material.dart';
import '../data/data_management.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoListState();
}
class TodoListState extends State<TodoList> {

  TodoManagment todoManagment = TodoManagment.loading();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemBuilder: _todoItemCreate,
        itemCount: todoManagment.getTodosCount(),
      ),
    );
  }

  Widget _todoItemCreate(BuildContext context, int index) {
    TodoModel model = this.todoManagment.getTodoWith(index: index);
    return ListTile(
      title: Text(model.title),
      leading: Checkbox(
        value: model.isDone,
        onChanged: (value) {
          setState(() {
            model.isDone = !(model.isDone);
          });
        },
      ),
      subtitle: Text(model.subTitle),
    );
  } 
}
