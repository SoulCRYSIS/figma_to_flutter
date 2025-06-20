import 'package:flutter/material.dart';
import 'package:figma_to_flutter/design_tokens/figma.dart';

//———————————————————————————————————————————————————————————————
// Badge Widget
//———————————————————————————————————————————————————————————————
// Figma reference:
// https://www.figma.com/design/w6tEcAwj9Eaq0ej29C8F4M/%E2%9D%96-Untitled-UI-%E2%80%93-PRO-VARIABLES--v6.0----Testing-Token?node-id=24068-5035
//
// Purpose:
// A small, unobtrusive label used to display a status, category, or short piece
// of information.  Supports three sizes, optional leading/trailing widgets
// (icons, avatars …) and two shapes (rounded-pill vs regular rectangle).  The
// visual style falls back to design-tokens exported from Figma but allows full
// run-time override for background/border/text colours.
//
// Example usage:
//   const Badge(label: 'Beta');
//   const Badge(size: BadgeSize.lg, label: 'Done', backgroundColor: Colors.green);
//   const Badge(
//     label: 'New',
//     leading: Icon(Icons.star, size: 12),
//     shape: BadgeShape.badge,
//   );
//
// Parameters:
// • label            – main text, optional for icon-only badges
// • leading          – widget placed before the label (icon/avatar/image)
// • trailing         – widget placed after the label (icon/button)
// • size             – one of three sizes: sm, md, lg (defaults to md)
// • shape            – pill (fully-rounded) or badge (small radius) shape
// • backgroundColor  – overrides the default background colour
// • borderColor      – overrides the default 1 px border colour
// • textColor        – overrides the default text colour
//———————————————————————————————————————————————————————————————

/// Available badge sizes.
enum BadgeSize { sm, md, lg }

/// Visual shape of the badge.
enum BadgeShape { pill, badge }

class Badge extends StatelessWidget {
  const Badge({
    super.key,
    this.label,
    this.leading,
    this.trailing,
    this.size = BadgeSize.md,
    this.shape = BadgeShape.pill,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  });

  /// Optional main text shown inside the badge.  When `null` an icon-only badge
  /// is rendered (expects either [leading] or [trailing]).
  final String? label;

  /// Optional widget placed before the label.
  final Widget? leading;

  /// Optional widget placed after the label.
  final Widget? trailing;

  /// Size variant – affects paddings and typography.
  final BadgeSize size;

  /// Shape of the badge – pill (full radius) or badge (small radius).
  final BadgeShape shape;

  /// Optional custom background colour.
  final Color? backgroundColor;

  /// Optional custom border colour.
  final Color? borderColor;

  /// Optional custom text colour.
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final dims = _BadgeDimensions.forSize(size);

    // Defaults resolved from design-tokens.
    final Color bg = backgroundColor ?? Figma.colorModes.componentColorsUtilityGrayUtilityGray50;
    final Color br = borderColor ?? Figma.colorModes.componentColorsUtilityGrayUtilityGray200;
    final Color fg = textColor ?? Figma.colorModes.componentColorsUtilityGrayUtilityGray700;

    late final BorderRadius radius;
    switch (shape) {
      case BadgeShape.pill:
        radius = BorderRadius.circular(Figma.radius.radiusFull.value);
        break;
      case BadgeShape.badge:
        radius = BorderRadius.circular(Figma.radius.radiusMd.value);
        break;
    }

    // Prevent rendering an empty badge with no content.
    assert(label != null || leading != null || trailing != null,
        'Badge requires at least a label, leading, or trailing widget');

    return DecoratedBox(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: radius,
        border: Border.all(color: br, width: 1),
      ),
      child: Padding(
        padding: dims.padding,
        child: _buildContent(dims, fg),
      ),
    );
  }

  Widget _buildContent(_BadgeDimensions dims, Color fg) {
    // Icon-only badge: center a single widget.
    if (label == null || label!.isEmpty) {
      final icon = leading ?? trailing;
      return SizedBox.square(
        dimension: dims.iconSize + dims.padding.vertical,
        child: Center(
          child: IconTheme.merge(
            data: IconThemeData(size: dims.iconSize, color: fg),
            child: icon ?? const SizedBox(),
          ),
        ),
      );
    }

    final children = <Widget>[];

    if (leading != null) {
      children.add(Padding(
        padding: EdgeInsets.only(right: dims.gap),
        child: IconTheme.merge(
          data: IconThemeData(size: dims.iconSize, color: fg),
          child: leading!,
        ),
      ));
    }

    children.add(Text(
      label!,
      style: dims.textStyle.copyWith(color: fg),
    ));

    if (trailing != null) {
      children.add(Padding(
        padding: EdgeInsets.only(left: dims.gap),
        child: IconTheme.merge(
          data: IconThemeData(size: dims.iconSize, color: fg),
          child: trailing!,
        ),
      ));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}

//———— DIMENSIONS ————————————————————————————————————————————————
class _BadgeDimensions {
  const _BadgeDimensions({
    required this.padding,
    required this.textStyle,
    required this.iconSize,
    required this.gap,
  });

  final EdgeInsets padding;
  final TextStyle textStyle;
  final double iconSize;
  final double gap;

  double get height => padding.vertical * 2 + textStyle.fontSize!;

  static _BadgeDimensions forSize(BadgeSize size) {
    switch (size) {
      case BadgeSize.sm:
        return _BadgeDimensions(
          padding: EdgeInsets.symmetric(
            horizontal: Figma.spacing.spacingXs.value,
            vertical: Figma.spacing.spacingXxs.value,
          ),
          textStyle: TextStyle(
            fontSize: Figma.typography.fontSizeTextXs.value,
            fontWeight: FontWeight.w500,
            height: Figma.typography.lineHeightTextXs.value /
                Figma.typography.fontSizeTextXs.value,
          ),
          iconSize: 12,
          gap: Figma.spacing.spacingXxs.value,
        );
      case BadgeSize.md:
        return _BadgeDimensions(
          padding: EdgeInsets.symmetric(
            horizontal: Figma.spacing.spacingSm.value,
            vertical: Figma.spacing.spacingXxs.value,
          ),
          textStyle: TextStyle(
            fontSize: Figma.typography.fontSizeTextSm.value,
            fontWeight: FontWeight.w500,
            height: Figma.typography.lineHeightTextSm.value /
                Figma.typography.fontSizeTextSm.value,
          ),
          iconSize: 14,
          gap: Figma.spacing.spacingXxs.value,
        );
      case BadgeSize.lg:
        return _BadgeDimensions(
          padding: EdgeInsets.symmetric(
            horizontal: Figma.spacing.spacingMd.value,
            vertical: Figma.spacing.spacingXs.value,
          ),
          textStyle: TextStyle(
            fontSize: Figma.typography.fontSizeTextSm.value,
            fontWeight: FontWeight.w500,
            height: Figma.typography.lineHeightTextSm.value /
                Figma.typography.fontSizeTextSm.value,
          ),
          iconSize: 14,
          gap: Figma.spacing.spacingXs.value,
        );
    }
  }
} 