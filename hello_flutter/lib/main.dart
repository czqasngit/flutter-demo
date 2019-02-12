import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() => runApp(MaterialApp(title: "开始",
    home: Application(),    
));

class NavigationBar extends StatelessWidget {

          var leftButton =  IconButton(icon: Icon(Icons.menu),
                        tooltip: 'Navigation menu',
                        onPressed: null,
                    );
    @override
      Widget build(BuildContext context) {

          
         
          return Container(padding: EdgeInsets.only(top: 0),
                decoration: BoxDecoration(color: Colors.blue[500]),
                height: 88,
                child: Row(children: <Widget>[
                    leftButton,
                    // Expanded expands its child to fill the available space.
                    Expanded(
                        child: Text("李老师", textAlign: TextAlign.center),
                    ),
                    IconButton(
                        icon: Icon(Icons.search),
                        tooltip: 'Search',
                        onPressed: null,
                    ),
                ]),
          );
      }
}

class CounterIncreamentButton extends StatelessWidget {
    final VoidCallback onPress;
    CounterIncreamentButton({this.onPress});
    @override
      Widget build(BuildContext context) {
          print(this.toString());
          return GestureDetector(child: Text("点击打怪升级"), onTap: this.onPress);
      }
}
class CounterDisplay extends StatelessWidget {

    CounterDisplay({this.count});
    int count = 0;
    @override
      Widget build(BuildContext context) {
          return Center(child: Text("等级: $count"));
      }
}
class Counter extends StatefulWidget {
    @override
    _Counter createState() => _Counter();
}
class _Counter extends State<Counter> {
    var _count = 0;
    @override
      Widget build(BuildContext context) {
          return Row(children: <Widget>[
              CounterDisplay(count: _count),
              CounterIncreamentButton(onPress: () => this.increament())
          ]);
      }
    void increament() {
        print("自增...");
        setState(() {
            _count ++;          
        });
    }    
}
class Application extends StatelessWidget {
    @override
      Widget build(BuildContext context) {

          return Material(child: 
                Column(children: <Widget>[
                    NavigationBar(),
                    Expanded(child: Container(
                        decoration: BoxDecoration(color: Colors.orange),
                        child: Center(child: Text("扩展在中间")),
                    )),
                    GestureDetector(child: Container(child: Center(child: Text("我是Flutter应用程序", textDirection: TextDirection.ltr)),height: 100,
                        decoration: BoxDecoration(color: Colors.purple),
                    ),
                    onTap: () {
                        print("点击事件");
                    }, onLongPress: () => print("长按事件")),
                    Text("我是Flutter应用程序", textDirection: TextDirection.ltr),
                    Container(child: Center(child: Counter()), height: 100)

                ])
          );

        //   return Text("我是Flutter应用程序", textDirection: TextDirection.ltr);
      }
}