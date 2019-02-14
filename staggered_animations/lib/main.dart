import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> _radius;
  Animation<double> _width;
  Animation<double> _height;
  _MyHomePageState() {
    this.animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);
    this._radius = Tween<double>(begin: 0, end: 100).animate(CurvedAnimation(parent: this.animationController, curve: Interval(0.5, 1.0, curve: Curves.easeOut)));
    this._width = Tween<double>(begin: 50, end: 200).animate(CurvedAnimation(parent: this.animationController, curve: Interval(0.0, 0.25, curve: Curves.easeOut)));
    this._height = Tween<double>(begin: 50, end: 200).animate(CurvedAnimation(parent: this.animationController, curve: Interval(0.25, 0.5, curve: Curves.easeOut)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          GestureDetector(child: Text("动画开始"), onTap: () => this._playAnimation())
        ],
      ),
      body: AnimatedBuilder(animation: this.animationController, builder: _build)
    );
  }

  void _playAnimation() async {
    await this.animationController.forward();
    await this.animationController.reverse();
    this.animationController.reset();
  }
  Widget _build(BuildContext context, Widget child) {
    return Center(
            child: Center(
              child: Container(
                width: _width.value,
                height: _height.value,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.5),
                  border: Border.all(color: Colors.pink, width: 2.0),
                  borderRadius: BorderRadius.circular(this._radius.value),
                ),
              ),
            )
          );
  }
}

