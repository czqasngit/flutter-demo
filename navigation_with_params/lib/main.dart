import 'package:flutter/material.dart';
import 'TodoListController.dart';
import 'TodoDetailController.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => TodoListController(),
        '/detail': (context) => TodoDetailController()
      },
    );  
  }
}