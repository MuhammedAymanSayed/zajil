import 'dart:async';

import 'package:flutter/material.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 3),
            transitionsBuilder: (ctx, animation, setanimation, child) {
              animation = CurvedAnimation(
                curve: Curves.elasticInOut,
                parent: animation,
              );
              return ScaleTransition(
                scale: animation,
                alignment: Alignment.center,
                child: child,
              );
            },
            pageBuilder: (ctx, animation, setanimation) {
              return const MyApp();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Color _myColor = const Color.fromRGBO(254, 194, 2, 1);
    return Container(
      padding: const EdgeInsets.all(40),
      color: _myColor,
      child: Center(
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}
