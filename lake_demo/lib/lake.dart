import 'package:flutter/material.dart';


class StarLake extends StatefulWidget {

  var isStar = false;
  var starNum = 40;
  
  @override
  StarLakeState createState() => StarLakeState();
}
class StarLakeState extends State<StarLake> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(child: 
        Column(children: <Widget>[
          Center(child: Text("Oeschinen Lake Campground")),
          Center(child: Text("Kandersteg, Switzerland"))
        ]),
        flex: 2,
      ),
      Expanded(child: Row(children: <Widget>[
        IconButton(icon: Icon(Icons.star, color: widget.isStar ? Colors.red : Colors.black), onPressed: () => this.toggle()),
        Text("${widget.starNum}")
      ]), 
      flex: 1),
    ]);
  }
  void toggle() {
    setState(() {
      widget.isStar = !widget.isStar;
      if (widget.isStar) {
        widget.starNum = 41;
      } else {
        widget.starNum = 40;
      }
    });
  }
}
class ToolBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(child: 
      Row(children: <Widget>[
        Center(child: 
          Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.call, color: Colors.orange,), onPressed: () => print('打电话...')),
              Text('Contact Us.')
            ],
          )
        ),
        Center(child: 
          Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.location_city, color: Colors.orange,), onPressed: () => print('导航...')),
              Text('Route.')
            ],
          )
        ),
        Center(child: 
          Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.share, color: Colors.orange,), onPressed: () => print('分享...')),
              Text('Share.')
            ],
          )
        )
      ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
    );
  }
}
class Introduce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(''' 
    根据警方提供的信息，在执勤过程中，该车辆从东向西行驶，车辆外形比较怪异，比较像兰博基尼的外形，当时警方示意该车停车，司机并未立即停车，有冲岗嫌疑。
据了解，这辆仿冒的“兰博基尼”跑车尺寸比真车小很多，当民警盘查时，该男子拒交车钥匙。经查，这辆假冒“兰博基尼”悬挂电D66888车牌，驾驶员承认车是通过网上购物花3万多元托运来的，使用的牌照也不符合规范。通过身份查询，驾驶人持有C1驾照。

    '''), padding: EdgeInsets.all(15),);
  }
}
class Lake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(child: Image.asset('images/lake.jpg')),
      StarLake(),
      Divider(),
      ToolBar(),
      Divider(),
      Introduce()
    ]);
  }
}