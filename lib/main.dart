import 'package:figma_to_flutter/design_tokens/figma.dart';
import 'package:figma_to_flutter/icons/png_icons.dart';
import 'package:figma_to_flutter/icons/svg_icons.dart';
import 'package:figma_to_flutter/screens/toggles_showcase_screen.dart';
import 'package:flutter/material.dart';
import 'package:figma_to_flutter/widgets/app_button.dart';
import 'package:figma_to_flutter/screens/button_showcase_screen.dart';
import 'package:svg_icon_widget/svg_icon_widget.dart';

void main() {
  runApp(const _Root());
}

/// Wraps the whole app with [FigmaTheme] so design-tokens react to mode changes.
class _Root extends StatelessWidget {
  const _Root();

  @override
  Widget build(BuildContext context) {
    return FigmaTheme(child: const MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/buttons': (_) => const ButtonShowcaseScreen(),
        '/toggles': (_) => const TogglesShowcaseScreen(),
      },
      home: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Figma-to-Flutter Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              variant: ButtonVariant.primary,
              size: ButtonSize.md,
              label: 'Open Button Showcase',
              onPressed: () => Navigator.pushNamed(context, '/buttons'),
            ),
            const SizedBox(height: 16),
            AppButton(
              variant: ButtonVariant.secondaryColor,
              size: ButtonSize.md,
              label: 'Open Toggle Showcase',
              onPressed: () => Navigator.pushNamed(context, '/toggles'),
            ),
          ],
        ),
      ),
    );
  }
}
