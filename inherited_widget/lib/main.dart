import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {

  int count;
  ShareDataWidget({
    @required this.count,
    Widget child
  }): super(child: child);
  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class _Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterState();
}
class _CounterState extends State<_Counter> {
  @override
  Widget build(BuildContext context) {
    // return Text(context.inheritFromWidgetOfExactType(ShareDataWidget).count.toString());
    ShareDataWidget sdw = context.inheritFromWidgetOfExactType(ShareDataWidget);
    return Text("计数器: ${sdw.count.toString()}");
  }
  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();
  }
}

class MainController extends StatefulWidget {
  int _count = 0;
  @override
  State<StatefulWidget> createState() => _MainControllerState();
}
class _MainControllerState extends State<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("测试InheritedWidget"),
        ),
        body: ShareDataWidget(
          count: this.widget._count,
          child: Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Widget数量: ${this.widget._count}"),
                  _Counter(),
                  RaisedButton(
                    child: Text("增加"),
                    onPressed: () => setState(() => widget._count ++),
                  )
              ]
            ),
          ),
        )
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainController()
    );
  }
}
void main() => runApp(App());