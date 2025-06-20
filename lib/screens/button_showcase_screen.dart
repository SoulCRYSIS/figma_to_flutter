import 'package:flutter/material.dart';
import 'package:figma_to_flutter/widgets/app_button.dart';

class ButtonShowcaseScreen extends StatelessWidget {
  const ButtonShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppButton Showcase')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          for (final variant in ButtonVariant.values) ...[
            Text(
              variant.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                for (final size in ButtonSize.values) ...[
                  // 1. Label only
                  AppButton(
                    variant: variant,
                    size: size,
                    label: size.name.toUpperCase(),
                    onPressed: () {},
                  ),
                  // 2. Leading icon
                  AppButton(
                    variant: variant,
                    size: size,
                    label: size.name.toUpperCase(),
                    leftIcon: const Icon(Icons.star_outline),
                    onPressed: () {},
                  ),
                  // 3. Trailing icon
                  AppButton(
                    variant: variant,
                    size: size,
                    label: size.name.toUpperCase(),
                    rightIcon: const Icon(Icons.chevron_right),
                    onPressed: () {},
                  ),
                  // 4. Leading dot
                  AppButton(
                    variant: variant,
                    size: size,
                    label: size.name.toUpperCase(),
                    showLeadingDot: true,
                    onPressed: () {},
                  ),
                  // 5. Icon-only (no label)
                  AppButton(
                    variant: variant,
                    size: size,
                    leftIcon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  // 6. Disabled state
                  AppButton(
                    variant: variant,
                    size: size,
                    label: 'DISABLED',
                    onPressed: null,
                    leftIcon: const Icon(Icons.block),
                  ),
                ],
              ],
            ),
            const Divider(height: 32),
          ],
        ],
      ),
    );
  }
} 