// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// A design-system compliant radio button supporting two sizes (`sm`, `md`).
///
/// The widget intentionally re-implements visuals instead of using
/// `Radio<T>` so that we can match Figma specs pixel-perfectly and make the
/// component hover-aware.
///
/// Example:
/// ```dart
/// AppRadio<String>(
///   value: 'option1',
///   groupValue: selected,
///   onChanged: (v) => setState(() => selected = v),
/// )
/// ```
class AppRadio<T> extends StatefulWidget {
  const AppRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.isEnabled = true,
    this.size = RadioSize.md,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final bool isEnabled;
  final RadioSize size;

  bool get _selected => value == groupValue;

  @override
  State<AppRadio<T>> createState() => _AppRadioState<T>();
}

class _AppRadioState<T> extends State<AppRadio<T>> {
  bool _hovered = false;
  bool _focused = false;

  void _onHover(bool h) => setState(() => _hovered = h);
  void _onFocus(bool f) => setState(() => _focused = f);

  @override
  Widget build(BuildContext context) {
    final double outer = switch (widget.size) {
      RadioSize.sm => 16.0,
      RadioSize.md => 20.0,
    };
    final double inner = outer * 0.5;

    final cs = Theme.of(context).colorScheme;
    final disabled = !widget.isEnabled || widget.onChanged == null;

    Color borderColor;
    Color fillColor;
    if (disabled) {
      borderColor = cs.onSurface.withOpacity(0.38);
      fillColor = Colors.transparent;
    } else if (_focused) {
      borderColor = cs.primary;
      fillColor = Colors.transparent;
    } else if (_hovered) {
      borderColor = cs.primary;
      fillColor = cs.primary.withOpacity(0.08);
    } else {
      borderColor = cs.outline;
      fillColor = Colors.transparent;
    }

    final selectedDotColor = disabled ? cs.onSurface.withOpacity(0.38) : cs.primary;

    return FocusableActionDetector(
      enabled: !disabled,
      onShowHoverHighlight: _onHover,
      onShowFocusHighlight: _onFocus,
      mouseCursor: disabled ? SystemMouseCursors.basic : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: disabled ? null : () => widget.onChanged?.call(widget.value),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: outer,
          width: outer,
          decoration: BoxDecoration(
            color: fillColor,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 1.5),
          ),
          alignment: Alignment.center,
          child: AnimatedOpacity(
            opacity: widget._selected ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 150),
            child: Container(
              height: inner,
              width: inner,
              decoration: BoxDecoration(
                color: selectedDotColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Independent size enum for [AppRadio].
enum RadioSize { sm, md } 