import 'package:flutter/material.dart';
import 'package:figma_to_flutter/widgets/badge.dart' as ui;

/// Interactive playground showing the various configurations and
/// combinations of the `Badge` widget.
class BadgeShowcaseScreen extends StatelessWidget {
  const BadgeShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Badge Showcase')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          for (final shape in ui.BadgeShape.values) ...[
            Text(
              'Shape: ${shape.name}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                for (final size in ui.BadgeSize.values) ...[
                  // 1. Label only
                  ui.Badge(
                    size: size,
                    shape: shape,
                    label: size.name.toUpperCase(),
                  ),
                  // 2. Leading icon
                  ui.Badge(
                    size: size,
                    shape: shape,
                    label: size.name.toUpperCase(),
                    leading: const Icon(Icons.star_outline),
                  ),
                  // 3. Trailing icon
                  ui.Badge(
                    size: size,
                    shape: shape,
                    label: size.name.toUpperCase(),
                    trailing: const Icon(Icons.close),
                  ),
                  // 4. Icon only (no label)
                  ui.Badge(
                    size: size,
                    shape: shape,
                    leading: const Icon(Icons.favorite_border),
                  ),
                  // 5. Custom colours
                  ui.Badge(
                    size: size,
                    shape: shape,
                    label: 'CUSTOM',
                    backgroundColor: Colors.green.shade100,
                    borderColor: Colors.green.shade400,
                    textColor: Colors.green.shade900,
                    leading: const Icon(Icons.check, size: 12),
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