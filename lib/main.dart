import 'package:esport_tutorial_league/screens/league_screen.dart';
import 'package:esport_tutorial_league/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "League ESport",
      theme: mainTheme,
      home: LeagueScreen(),
    );
  }
}
