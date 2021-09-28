import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soundconverge/screens/chat.screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1700), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => ChatUI()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Colors.white,
      child: Center(child: Image.asset('assets/images/logo.png')),
    );
  }
}
