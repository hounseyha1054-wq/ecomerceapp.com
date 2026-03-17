import 'package:ecommerce_app/AppPage/Homepage.dart';
import 'package:flutter/material.dart';

import 'AppPage/MainPageController.dart';

void main() {
  runApp(const Mainpage());
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Mainpagecontroller(),
    );
  }
}
