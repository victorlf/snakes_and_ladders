import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakes_and_ladders/app_widget.dart';
import 'package:snakes_and_ladders/providers/user_provider.dart';

import 'providers/dice_provider.dart';
import 'utils/constants.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DiceProvider(0, 2)),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const AppWidget(),
    ),
  );
}
