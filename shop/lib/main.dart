import 'package:flutter/material.dart';
import 'dart:math';

class Product {
    String name;
    String price;
    Product({this.name, this.price});
}
class ShopCell extends StatelessWidget {
    String name;
    ShopCell(this.name);
    @override
      Widget build(BuildContext context) {
          return Container(height: 65,
            child: Text(this.name, style: TextStyle(fontSize: 30, color: Colors.orange))
          );

      }
}
class ShopList extends StatefulWidget {
    
    List<Product> products;
    ShopList({Key key, this.products}): super(key: key);

    @override
    _ShopListState createState() =>  _ShopListState();

}

class _ShopListState extends State<ShopList> {
    @override
      void initState() {
          print("init state");
          super.initState(); 
      }
    @override
      Widget build(BuildContext context) {
          return Scaffold(appBar: AppBar(title: Text("商店")),
            body: GestureDetector(child: ListView(children: widget.products.map((item) => ShopCell(item.name)).toList()),
            onTap: () {
                setState(() {
                    widget.products.add(Product(name: Random().nextInt(1000).toString()));                  
                });
            })
          );
        //   return 
      }
}
class App extends StatelessWidget {
    @override
      Widget build(BuildContext context) {
          return MaterialApp(title: "油条商店",
            
            home: ShopList(products: 
                [Product(name: "豆浆"),
                Product(name: "油条"),
                Product(name: "饺子"),
                Product(name: "包子")
            ])
          );
      }
}

void main() => runApp(App()); 


