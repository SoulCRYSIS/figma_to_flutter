import 'package:figma_to_flutter/design_tokens/figma.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FigmaTheme(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello World!',
          ),
        ),
      ),
    );
  }
}
