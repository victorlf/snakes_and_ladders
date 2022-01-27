import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakes_and_ladders/screens/home_screen.dart';
import 'package:snakes_and_ladders/widgets/dice_roll.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake and Ladders',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey.shade400,
      ),
      home: const HomeScreen(title: 'Cobras e Escadas'),
    );
  }
}
