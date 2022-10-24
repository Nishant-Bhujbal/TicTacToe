import 'package:flutter/material.dart';
import 'package:tictactoe/screens/game.dart';
import 'package:tictactoe/screens/game3pl.dart';
import 'package:tictactoe/screens/mainscreen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => mainPage(),
      '/2Player': (context) => GameScreen(),
      '/3Player': (context) => Game3Screen(),
    },
  ));
}
