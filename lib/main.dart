import 'package:didyouknow/didyouknow/ui/home/home_screen.dart';
import 'package:didyouknow/shared/di.dart';
import 'package:didyouknow/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjector.inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Did You Know?',
      theme: KnowunityTheme.light(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
