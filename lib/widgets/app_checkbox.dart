// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:figma_to_flutter/design_tokens/figma.dart';

/// A design-system compliant checkbox.
///
/// Figma reference: https://www.figma.com/design/w6tEcAwj9Eaq0ej29C8F4M/%E2%9D%96-Untitled-UI-%E2%80%93-PRO-VARIABLES--v6.0----Testing-Token?node-id=1097-63886
///
/// The widget supports two visual sizes (`sm`, `md`) and the usual Material
/// states (default, hover, focus, disabled). In addition it can operate in
/// tri-state mode (`value == null`) to present an indeterminate state.
///
/// Example:
/// ```dart
/// AppCheckbox(
///   value: isSelected,
///   onChanged: (v) => setState(() => isSelected = v),
/// )
/// ```
class AppCheckbox extends StatefulWidget {
  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.isTristate = false,
    this.isEnabled = true,
    this.size = CheckboxSize.md,
  });

  /// Whether this checkbox is checked, unchecked or – when tristate is true –
  /// indeterminate (`null`).
  final bool? value;

  /// Callback when the user toggles the checkbox. Not called when the widget
  /// is disabled.
  final ValueChanged<bool?>? onChanged;

  /// Enables tri-state behavior (null value shows indeterminate dash).
  final bool isTristate;

  /// Whether the control is interactive. When false the checkbox renders in a
  /// disabled state.
  final bool isEnabled;

  /// Visual size of the control.
  final CheckboxSize size;

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  bool _isHovered = false;
  bool _isFocused = false;

  void _onFocusChange(bool hasFocus) {
    setState(() => _isFocused = hasFocus);
  }

  void _onHover(bool hover) {
    setState(() => _isHovered = hover);
  }

  @override
  Widget build(BuildContext context) {
    final double dimension = switch (widget.size) {
      CheckboxSize.sm => 16.0,
      CheckboxSize.md => 20.0,
    };

    final borderRadius = BorderRadius.circular(Figma.radius.radiusSm.value);

    final bool? value = widget.value;
    final bool isDisabled = !widget.isEnabled || widget.onChanged == null;

    final colorScheme = Theme.of(context).colorScheme;
    Color borderColor;
    Color fillColor;
    if (isDisabled) {
      borderColor = colorScheme.onSurface.withOpacity(0.38);
      fillColor = colorScheme.onSurface.withOpacity(0.12);
    } else if (_isFocused) {
      borderColor = colorScheme.primary;
      fillColor = value == true || value == null ? colorScheme.primary : Colors.transparent;
    } else if (_isHovered) {
      borderColor = colorScheme.primary;
      fillColor = value == true || value == null ? colorScheme.primary.withOpacity(0.08) : Colors.transparent;
    } else {
      borderColor = colorScheme.outline;
      fillColor = value == true || value == null ? colorScheme.primary : Colors.transparent;
    }

    final iconColor = colorScheme.onPrimary;

    Widget? icon;
    if (value == true) {
      icon = Icon(Icons.check,
          size: dimension * 0.6, color: iconColor, weight: 2.0);
    } else if (value == null && widget.isTristate) {
      icon = Icon(Icons.remove,
          size: dimension * 0.6, color: iconColor, weight: 2.0);
    }

    return FocusableActionDetector(
      enabled: !isDisabled,
      onShowHoverHighlight: _onHover,
      onShowFocusHighlight: _onFocusChange,
      mouseCursor: isDisabled ? SystemMouseCursors.basic : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: isDisabled
            ? null
            : () {
                final nextValue = widget.isTristate
                    ? (value == null
                        ? true
                        : (value == true ? false : null))
                    : !(value ?? false);
                widget.onChanged?.call(nextValue);
              },
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: dimension,
          width: dimension,
          decoration: BoxDecoration(
            color: fillColor,
            border: Border.all(
              color: borderColor,
              width: 1.5,
            ),
            borderRadius: borderRadius,
          ),
          alignment: Alignment.center,
          child: icon,
        ),
      ),
    );
  }
}

/// Sizes available for [AppCheckbox]. Each widget owns its own size enum to
/// avoid cross-component coupling.
enum CheckboxSize { sm, md } 