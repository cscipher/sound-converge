import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundconverge/screens/chat.screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: ChatUI());
  }
}
