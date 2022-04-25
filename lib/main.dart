import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'splash_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

Color _myColor = const Color.fromRGBO(254, 194, 2, 1);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'https://zajil-eg.com/',
              onPageFinished: (x) {
                setState(() {
                  _isLoading = false;
                });
              },
            ),
            if (_isLoading)
              Container(
                height: double.infinity,
                width: double.infinity,
                color: _myColor,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('images/logo.png'),
                      const CircularProgressIndicator(
                        color: Colors.white,
                        //backgroundColor: Colors.black38,
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      const Text(
                        'Loading',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
