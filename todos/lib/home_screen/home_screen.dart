
import 'package:flutter/material.dart';
import 'todo_list.dart';
import 'todo_detail.dart';
import 'add_todo.dart';

class HomePage extends StatefulWidget {
  int currentTabIndex = 0;
  @override
  State<StatefulWidget> createState()  => HomePageState();
  void _updateTabIndex(int index) => this.currentTabIndex = index;
}
class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        actions: _getNavigationRightActions(),
        centerTitle: true,
      ),
      body: _getCurrentController(),
      bottomNavigationBar: BottomNavigationBar(
        items: _getNavigationBarItems(),
        currentIndex: this.widget.currentTabIndex,
        onTap: (index) {
          setState(() {
            this.widget._updateTabIndex(index);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => AddTodo())
        ),
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _getCurrentController() {
    if (this.widget.currentTabIndex == 0) {
      return TodoList();
    }
    return TodoDetail();
  }
  List<BottomNavigationBarItem> _getNavigationBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.view_list), title: Text("待办事项")),
      BottomNavigationBarItem(icon: Icon(Icons.satellite), title: Text("事项统计"))
    ];
  }
  List<Widget> _getNavigationRightActions() {
    return [
      PopupMenuButton(
        icon: Icon(Icons.filter),
        itemBuilder: (BuildContext context) => [
          PopupMenuItem<int>(
            value: 0,
            child: Text("过滤器0"),
          ),
          PopupMenuItem<int>(
            value: 1,
            child: Text("过滤器1"),
          ),
          PopupMenuItem<int>(
            value: 2,
            child: Text("过滤器2"),
          )
        ],
        onSelected: (var value) => print("---" + "$value"),
      ),
      PopupMenuButton(
        icon: Icon(Icons.backup),
        itemBuilder: (BuildContext context) => [
          PopupMenuItem<int>(
            value: 0,
            child: Text("---过滤器0"),
          ),
          PopupMenuItem<int>(
            value: 1,
            child: Text("---过滤器1"),
          ),
          PopupMenuItem<int>(
            value: 2,
            child: Text("---过滤器2"),
          )
        ],
        onSelected: (var value) => print("---" + "$value"),
      )
    ];
  }
}


