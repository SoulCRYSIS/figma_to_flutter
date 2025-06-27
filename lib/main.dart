import 'package:figma_to_flutter/design_tokens/figma.dart';
import 'package:figma_to_flutter/screens/error_page_not_found_screen.dart';
import 'package:flutter/material.dart';
import 'package:figma_to_flutter/widgets/app_button.dart';
import 'package:figma_to_flutter/screens/button_showcase_screen.dart';
import 'package:figma_to_flutter/screens/badge_showcase_screen.dart';
import 'package:figma_to_flutter/screens/dropdown_showcase_screen.dart';

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
        '/badges': (_) => const BadgeShowcaseScreen(),
        '/dropdowns': (_) => const DropdownShowcaseScreen(),
        '/error': (_) => const ErrorPageNotFoundScreen(),
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
              variant: ButtonVariant.tertiaryGray,
              size: ButtonSize.md,
              label: 'Open Badge Showcase',
              onPressed: () => Navigator.pushNamed(context, '/badges'),
            ),
            const SizedBox(height: 16),
            AppButton(
              variant: ButtonVariant.tertiaryGray,
              size: ButtonSize.md,
              label: 'Open Dropdown Showcase',
              onPressed: () => Navigator.pushNamed(context, '/dropdowns'),
            ),
            const SizedBox(height: 16),
            AppButton(
              variant: ButtonVariant.tertiaryGray,
              size: ButtonSize.md,
              label: 'Open Error Screen',
              onPressed: () => Navigator.pushNamed(context, '/error'),
            ),
          ],
        ),
      ),
    );
  }
}
