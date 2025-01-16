import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:solid_test_task_borys_matveichuk/utils/random_ext.dart';

void main() {
  runApp(const MyApp());
}

/// Application initialization
class MyApp extends StatelessWidget {
  /// Initializes [key] for subclasses.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Change Color',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MyHomePage(),
    );
  }
}

/// Home page
class MyHomePage extends StatefulWidget {
  /// Initializes [key] for subclasses.
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int backgroundColor = 0xFFFFFFFF; // default white color

  void _changeBackgroundColor() {
    setState(() {
      backgroundColor = Random().nextRGBColor();
    });
  }

  /// For easy of reading
  Color _textColor(Color backgroundColor) {
    if (ThemeData.estimateBrightnessForColor(backgroundColor) ==
        Brightness.dark) {
      return Colors.white;
    }

    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_non_null_assertion
    final i10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(i10n.appTitle),
      ),
      body: GestureDetector(
        onTap: _changeBackgroundColor,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: Color(backgroundColor),
          child: Center(
            child: Text(
              i10n.greetings,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: _textColor(
                      Color(backgroundColor),
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
