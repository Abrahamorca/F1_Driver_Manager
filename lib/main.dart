import 'package:flutter/material.dart';

import 'package:AMR/src/pages/home_page.dart';
import 'package:AMR/src/pages/new_driver_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => const HomePage(),
        'new_driver': (BuildContext context) => const NewDriver(),
      },
    );
  }
}
