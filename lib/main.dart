import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac/controls/controllerr.dart';

import 'home.dart';

void main() {
  runApp(ChangeNotifierProvider<contr>(
    create: (_) => contr(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline2: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
          headline4: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          headline5: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
          headline6: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
