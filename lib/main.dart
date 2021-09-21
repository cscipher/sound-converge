import 'package:flutter/material.dart';
import 'package:soundconverge/screens/chat.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: ChatUI());
  }
}
