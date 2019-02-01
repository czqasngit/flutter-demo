import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
      Widget build(BuildContext context) {
          return Container(
              decoration: BoxDecoration(color: Colors.orange),
              padding: EdgeInsets.symmetric(vertical: 100),
              child: Column(
                  children: <Widget>[
                    Center(child: 
                        Text("高通再推荐",
                        textDirection: TextDirection.ltr, 
                                style: TextStyle(fontSize: 30, 
                                fontWeight: FontWeight.bold, 
                                color: Colors.white)
                        )
                    ),
                    Text(''' 
                        现在，高通带来了“年末换机指南——骁龙845篇”，推荐了8款搭载了骁龙845旗舰处理器的手机（本篇只包含上半年发布的手机）。
                        这些手机包括小米8、小米MIX 2S、OPPO Find X、vivo NEX旗舰版、一加手机6、黑鲨游戏手机、坚果R1、三星盖乐世S9/S9+。一起来看一下吧！
                    ''', 
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal, color: Colors.white),
                    ),
                    Row(children: <Widget>[
                        Text("五个星", textDirection: TextDirection.ltr),
                        Text("170 Reviews", textDirection: TextDirection.ltr)
                    ],
                        textDirection: TextDirection.ltr,
                        mainAxisAlignment: MainAxisAlignment.spaceAround),
                    Container(child: 
                        Row(textDirection: TextDirection.ltr,
                            children: <Widget>[
                                Column(children: <Widget>[
                                    Text("姓名", textDirection: TextDirection.ltr),
                                    Text("游小彬", textDirection: TextDirection.ltr)
                                ]),
                                Column(children: <Widget>[
                                    Text("姓名", textDirection: TextDirection.ltr),
                                    Text("游小彬", textDirection: TextDirection.ltr)
                                ]),
                                Column(children: <Widget>[
                                    Text("姓名", textDirection: TextDirection.ltr),
                                    Text("游小彬", textDirection: TextDirection.ltr)
                                ])
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                        ),
                        decoration: BoxDecoration(color: Colors.pink),
                    )
                  ],
              ),
          );
      }
}