import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

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
  
  Animation<double> animation ;
  Animation<double> opacityAnimation;
  AnimationController controller;
  Animation<double> curvedAnimation;
  
  void initState() {
    super.initState();
    /// 动画控制器
    this.controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    this.animation = Tween<double>(begin: 0, end: 300.0).animate(this.controller);
    this.opacityAnimation = Tween<double>(begin: 0, end: 1.0).animate(this.controller);
    /// 动画计算策略
    this.curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: this.controller);
    this.curvedAnimation.addListener(() => print(this.curvedAnimation.value));
    // ..addListener((){
    //   print(this.animation.value);
    //   setState((){});
    // });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画1"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.nature), onPressed: () {
            this.controller.reset();
            this.controller.forward() ;
          })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(width: 200, height: 200,
            child: Image.network("https://s2.showstart.com/img/2019/20190211/5559166652e7473bb60994cfa075fee8_600_800_114331.0x0.jpg", fit: BoxFit.fill,),
          ),
          // AnimatedLogoByBuilder(this.animation, this.opacityAnimation)
          AnimatedLogoByBuilderUseEvaluate(this.curvedAnimation)
        ]
      )
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  final Animation<double> animation;
  AnimatedLogo(this.animation): super(listenable: animation);
  @override
  Widget build(BuildContext context) {
    print("绘制AnimatedLogo");
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Text("使用AnimatedBuilder实现动画重渲染"),
            FlutterLogo()
          ]),
          decoration: BoxDecoration(color: Colors.orange),
          height: this.animation.value, 
          width: this.animation.value,
      ),
    );
  }
}

class AnimatedLogoByBuilder extends StatelessWidget {
  final Animation<double> animation;
  final Animation<double> opacity;
  AnimatedLogoByBuilder(this.animation, this.opacity);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: this.animation,
      builder: (context, child) {
        return Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Opacity(child: Text("使用AnimatedBuilder实现动画重渲染"), opacity: this.opacity.value),
                FlutterLogo()//Expanded(child: , flex: 1)
              ]),
              decoration: BoxDecoration(color: Colors.orange),
              height: this.animation.value + 50, 
              // width: this.animation.value,
          ),
        );
      },
    );
  }
}

class AnimatedLogoByBuilderUseEvaluate extends AnimatedWidget {
  final _opacity =  Tween<double>(end: 1.0, begin: 0.0);
  final _sizeTween = Tween<double>(begin: 0, end: 200.0);
  AnimatedLogoByBuilderUseEvaluate(Animation<double> animation): super(listenable: animation);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.pink),
      child: Opacity(child: FlutterLogo(), opacity: _opacity.evaluate(this.listenable)),
      width: _sizeTween.evaluate(this.listenable),
      height: _sizeTween.evaluate(this.listenable),
    );
  }
}