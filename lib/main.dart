import 'package:flutter/material.dart';
import 'package:practice_3/pages/home.dart';
import 'package:practice_3/pages/loading.dart';
import 'package:practice_3/pages/choose_location.dart';

main() => runApp(InMain());

class InMain extends StatefulWidget {
  @override
  _InMainState createState() => _InMainState();
}

class _InMainState extends State<InMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/choose_location': (context) => ChooseLocation(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
