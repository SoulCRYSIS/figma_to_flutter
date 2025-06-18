import 'package:figma_to_flutter/design_tokens/figma.dart';
import 'package:figma_to_flutter/widgets/custom_button.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: Figma.spacing.spacingXl.value,
            children: [
              Row(
                spacing: Figma.spacing.spacingXl.value,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    ButtonSize.values
                        .map(
                          (e) => CustomButton.primary(
                            text: 'Button CTA',
                            leftIcon: Icons.add,
                            rightIcon: Icons.apple,
                            onPressed: () {},
                            size: e,
                          ),
                        )
                        .toList(),
              ),
              Row(
                spacing: Figma.spacing.spacingXl.value,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    ButtonSize.values
                        .map(
                          (e) => CustomButton.secondary(
                            text: 'Button CTA',
                            leftIcon: Icons.add,
                            rightIcon: Icons.apple,
                            onPressed: () {},
                            size: e,
                          ),
                        )
                        .toList(),
              ),
              Row(
                spacing: Figma.spacing.spacingXl.value,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    ButtonSize.values
                        .map(
                          (e) => CustomButton.primaryError(
                            text: 'Button CTA',
                            leftIcon: Icons.add,
                            rightIcon: Icons.apple,
                            onPressed: () {},
                            size: e,
                          ),
                        )
                        .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
