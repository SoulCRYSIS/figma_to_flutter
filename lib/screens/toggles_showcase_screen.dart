import 'package:flutter/material.dart';
import 'package:figma_to_flutter/widgets/app_checkbox.dart';
import 'package:figma_to_flutter/widgets/app_radio.dart';

/// A playground screen demonstrating the various configurations and states of
/// `AppCheckbox` and `AppRadio` widgets. Navigate here from `main.dart` or any
/// navigation drawer to visually QA the controls.
class TogglesShowcaseScreen extends StatefulWidget {
  const TogglesShowcaseScreen({super.key});

  @override
  State<TogglesShowcaseScreen> createState() => _TogglesShowcaseScreenState();
}

class _TogglesShowcaseScreenState extends State<TogglesShowcaseScreen> {
  // Checkbox states
  bool _checkboxSm = false;
  bool _checkboxMd = true;
  bool? _checkboxTristate = null;

  // Radio group state
  String? _radioGroup = 'a';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox & Radio Showcase')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('AppCheckbox', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _buildCheckboxTile(
                label: 'Size: sm',
                child: AppCheckbox(
                  size: CheckboxSize.sm,
                  value: _checkboxSm,
                  onChanged: (v) => setState(() => _checkboxSm = v ?? false),
                ),
              ),
              _buildCheckboxTile(
                label: 'Size: md',
                child: AppCheckbox(
                  size: CheckboxSize.md,
                  value: _checkboxMd,
                  onChanged: (v) => setState(() => _checkboxMd = v ?? false),
                ),
              ),
              _buildCheckboxTile(
                label: 'Disabled',
                child: const AppCheckbox(
                  isEnabled: false,
                  value: true,
                  onChanged: null,
                ),
              ),
              _buildCheckboxTile(
                label: 'Tri-state',
                child: AppCheckbox(
                  isTristate: true,
                  value: _checkboxTristate,
                  onChanged: (v) => setState(() => _checkboxTristate = v),
                ),
              ),
            ],
          ),
          const Divider(height: 48),
          Text('AppRadio', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _buildRadioTile(
                label: 'Size: sm (Option A)',
                child: AppRadio<String>(
                  size: RadioSize.sm,
                  value: 'a',
                  groupValue: _radioGroup,
                  onChanged: (v) => setState(() => _radioGroup = v),
                ),
              ),
              _buildRadioTile(
                label: 'Size: sm (Option B)',
                child: AppRadio<String>(
                  size: RadioSize.sm,
                  value: 'b',
                  groupValue: _radioGroup,
                  onChanged: (v) => setState(() => _radioGroup = v),
                ),
              ),
              _buildRadioTile(
                label: 'Size: md (Option C)',
                child: AppRadio<String>(
                  size: RadioSize.md,
                  value: 'c',
                  groupValue: _radioGroup,
                  onChanged: (v) => setState(() => _radioGroup = v),
                ),
              ),
              _buildRadioTile(
                label: 'Disabled',
                child: AppRadio<String>(
                  isEnabled: false,
                  value: 'disabled',
                  groupValue: _radioGroup,
                  onChanged: null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxTile({required String label, required Widget child}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [child, const SizedBox(height: 8), Text(label)],
    );
  }

  Widget _buildRadioTile({required String label, required Widget child}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [child, const SizedBox(height: 8), Text(label)],
    );
  }
} 