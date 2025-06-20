import 'package:flutter/material.dart';
import 'package:figma_to_flutter/design_tokens/figma.dart';
import 'dot.dart';

/// Generic application button based on Untitled-UI design-tokens.
///
/// The widget is intentionally kept *stateless* so it can be used anywhere.
/// Interaction feedback (hover, focus, disabled …) is handled via the
/// underlying Material/ButtonStyle APIs which already know how to react to the
/// corresponding `MaterialState`s.
///
/// The visual treatment (colours, radius, typography …) is resolved **only**
/// from the design-tokens that were exported from Figma and exposed through the
/// [Figma] helper.  This guarantees a single-source-of-truth between the design
/// file and the implementation.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.variant,
    required this.size,
    this.label,
    this.leftIcon,
    this.rightIcon,
    this.showLeadingDot = false,
    required this.onPressed,
  });

  /// Visual variant according to the design system.
  final ButtonVariant variant;

  /// One of five supported sizes.
  final ButtonSize size;

  /// The main text label – pass `null` when you need an icon-only button.
  final String? label;

  /// Optional widget placed before the [label].  Most of the time this will be
  /// an [Icon].
  final Widget? leftIcon;

  /// Optional widget placed after the [label].
  final Widget? rightIcon;

  /// Some variants support a tiny 4×4 dot in front of the content (see Figma).
  final bool showLeadingDot;

  /// Callback executed on tap.  Set `null` to disable the button.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dims = _ButtonDimensions.forSize(size);
    final style = _ButtonStyleFactory.forVariant(variant, dims);

    return TextButton(
      style: style,
      onPressed: onPressed,
      child: _buildContent(dims),
    );
  }

  Widget _buildContent(_ButtonDimensions dims) {
    // If icon-only just return a centered icon (expects leftIcon).
    if (label == null || label!.isEmpty) {
      return SizedBox(
        height: dims.height,
        width: dims.height,
        child: Center(child: leftIcon ?? const SizedBox()),
      );
    }

    final children = <Widget>[];

    if (showLeadingDot) {
      children.add(Padding(
        padding: EdgeInsets.only(right: dims.gap),
        child: Dot(
          color: onPressed == null ? Figma.colorModes.colorsForegroundFgDisabledSubtle : Figma.colorModes.colorsForegroundFgSuccessSecondary,
          size: DotSize.md,
        ),
      ));
    }

    if (leftIcon != null) {
      children.add(Padding(
        padding: EdgeInsets.only(right: dims.gap),
        child: IconTheme.merge(
          data: IconThemeData(size: dims.iconSize),
          child: leftIcon!,
        ),
      ));
    }

    children.add(Text(
      label!,
      style: dims.textStyle,
    ));

    if (rightIcon != null) {
      children.add(Padding(
        padding: EdgeInsets.only(left: dims.gap),
        child: IconTheme.merge(
          data: IconThemeData(size: dims.iconSize),
          child: rightIcon!,
        ),
      ));
    }

    return Padding(
      padding: dims.padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}

/// Visual variants supported by [AppButton].
///
/// Naming follows the Figma frame: *secondary-gray* vs *secondary-color* etc.
enum ButtonVariant {
  primary,
  secondaryGray,
  secondaryColor,
  tertiaryGray,
  tertiaryColor,
  linkGray,
  linkColor,
}

/// Size options mapped 1-to-1 to the Figma columns (XS → XL).
enum ButtonSize { xs, sm, md, lg, xl }

//———— DIMENSIONS ————————————————————————————————————————————————
class _ButtonDimensions {
  const _ButtonDimensions({
    required this.height,
    required this.padding,
    required this.iconSize,
    required this.textStyle,
    required this.gap,
  });

  final double height;
  final EdgeInsets padding;
  final double iconSize;
  final TextStyle textStyle;
  final double gap;

  static _ButtonDimensions forSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return _ButtonDimensions(
          height: 24,
          padding: EdgeInsets.symmetric(horizontal: Figma.spacing.spacingXs.value),
          iconSize: 12,
          textStyle: TextStyle(
            fontSize: Figma.typography.fontSizeTextXs.value,
            fontWeight: FontWeight.w600,
            height: Figma.typography.lineHeightTextXs.value / Figma.typography.fontSizeTextXs.value,
          ),
          gap: Figma.spacing.spacingXs.value / 2,
        );
      case ButtonSize.sm:
        return _ButtonDimensions(
          height: 32,
          padding: EdgeInsets.symmetric(horizontal: Figma.spacing.spacingSm.value),
          iconSize: 14,
          textStyle: TextStyle(
            fontSize: Figma.typography.fontSizeTextSm.value,
            fontWeight: FontWeight.w600,
            height: Figma.typography.lineHeightTextSm.value / Figma.typography.fontSizeTextSm.value,
          ),
          gap: Figma.spacing.spacingXs.value,
        );
      case ButtonSize.md:
        return _ButtonDimensions(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: Figma.spacing.spacingMd.value),
          iconSize: 16,
          textStyle: TextStyle(
            fontSize: Figma.typography.fontSizeTextMd.value,
            fontWeight: FontWeight.w600,
            height: Figma.typography.lineHeightTextMd.value / Figma.typography.fontSizeTextMd.value,
          ),
          gap: Figma.spacing.spacingSm.value,
        );
      case ButtonSize.lg:
        return _ButtonDimensions(
          height: 48,
          padding: EdgeInsets.symmetric(horizontal: Figma.spacing.spacingLg.value),
          iconSize: 18,
          textStyle: TextStyle(
            fontSize: Figma.typography.fontSizeTextLg.value,
            fontWeight: FontWeight.w600,
            height: Figma.typography.lineHeightTextLg.value / Figma.typography.fontSizeTextLg.value,
          ),
          gap: Figma.spacing.spacingSm.value,
        );
      case ButtonSize.xl:
        return _ButtonDimensions(
          height: 56,
          padding: EdgeInsets.symmetric(horizontal: Figma.spacing.spacingXl.value),
          iconSize: 20,
          textStyle: TextStyle(
            fontSize: Figma.typography.fontSizeTextXl.value,
            fontWeight: FontWeight.w600,
            height: Figma.typography.lineHeightTextXl.value / Figma.typography.fontSizeTextXl.value,
          ),
          gap: Figma.spacing.spacingMd.value,
        );
    }
  }
}

//———— STYLE RESOLUTION ————————————————————————————————————————————————
class _ButtonStyleFactory {
  const _ButtonStyleFactory._();

  static ButtonStyle forVariant(ButtonVariant variant, _ButtonDimensions dims) {
    final radius = BorderRadius.circular(Figma.radius.radiusXs.value);

    Color bgNormal;
    Color bgHover;
    Color bgDisabled = Figma.colorModes.colorsBackgroundBgDisabledSubtle;

    Color fgNormal;
    Color fgHover;
    Color fgDisabled = Figma.colorModes.colorsForegroundFgDisabledSubtle;

    Color? borderNormal;
    Color? borderHover;

    switch (variant) {
      case ButtonVariant.primary:
        bgNormal = Figma.colorModes.componentColorsComponentsButtonsPrimaryButtonPrimaryBg;
        bgHover = Figma.colorModes.componentColorsComponentsButtonsPrimaryButtonPrimaryBgHover;
        fgNormal = Figma.colorModes.componentColorsComponentsButtonsPrimaryButtonPrimaryFg;
        fgHover = Figma.colorModes.componentColorsComponentsButtonsPrimaryButtonPrimaryFgHover;
        break;
      case ButtonVariant.secondaryGray:
        bgNormal = Figma.colorModes.componentColorsComponentsButtonsSecondaryButtonSecondaryBg;
        bgHover = Figma.colorModes.componentColorsComponentsButtonsSecondaryButtonSecondaryBgHover;
        fgNormal = Figma.colorModes.componentColorsComponentsButtonsSecondaryButtonSecondaryFg;
        fgHover = Figma.colorModes.componentColorsComponentsButtonsSecondaryButtonSecondaryFgHover;
        borderNormal = Figma.colorModes.componentColorsComponentsButtonsSecondaryButtonSecondaryBorder;
        borderHover = Figma.colorModes.componentColorsComponentsButtonsSecondaryButtonSecondaryBorderHover;
        break;
      case ButtonVariant.secondaryColor:
        bgNormal = Figma.colorModes.componentColorsComponentsButtonsSecondaryColorButtonSecondaryColorBg;
        bgHover = Figma.colorModes.componentColorsComponentsButtonsSecondaryColorButtonSecondaryColorBgHover;
        fgNormal = Figma.colorModes.componentColorsComponentsButtonsSecondaryColorButtonSecondaryColorFg;
        fgHover = Figma.colorModes.componentColorsComponentsButtonsSecondaryColorButtonSecondaryColorFgHover;
        borderNormal = Figma.colorModes.componentColorsComponentsButtonsSecondaryColorButtonSecondaryColorBorder;
        borderHover = Figma.colorModes.componentColorsComponentsButtonsSecondaryColorButtonSecondaryColorBorderHover;
        break;
      case ButtonVariant.tertiaryGray:
        bgNormal = Colors.transparent;
        bgHover = Figma.colorModes.componentColorsComponentsButtonsTertiaryButtonTertiaryBgHover;
        fgNormal = Figma.colorModes.componentColorsComponentsButtonsTertiaryButtonTertiaryFg;
        fgHover = Figma.colorModes.componentColorsComponentsButtonsTertiaryButtonTertiaryFgHover;
        break;
      case ButtonVariant.tertiaryColor:
        bgNormal = Colors.transparent;
        bgHover = Figma.colorModes.componentColorsComponentsButtonsTertiaryColorButtonTertiaryColorBgHover;
        fgNormal = Figma.colorModes.componentColorsComponentsButtonsTertiaryColorButtonTertiaryColorFg;
        fgHover = Figma.colorModes.componentColorsComponentsButtonsTertiaryColorButtonTertiaryColorFgHover;
        break;
      case ButtonVariant.linkGray:
        bgNormal = Colors.transparent;
        bgHover = Colors.transparent;
        fgNormal = Figma.colorModes.colorsForegroundFgTertiary600;
        fgHover = Figma.colorModes.colorsForegroundFgTertiaryHover;
        break;
      case ButtonVariant.linkColor:
        bgNormal = Colors.transparent;
        bgHover = Colors.transparent;
        fgNormal = Figma.colorModes.colorsForegroundFgBrandPrimary600;
        fgHover = Figma.colorModes.colorsForegroundFgBrandPrimaryAlt;
        break;
    }

    return ButtonStyle(
      minimumSize: WidgetStateProperty.all(Size(dims.height, dims.height)),
      padding: WidgetStateProperty.all(EdgeInsets.zero), // padding managed in content builder
      backgroundColor: _stateColor(bgNormal, bgHover, bgDisabled),
      foregroundColor: _stateColor(fgNormal, fgHover, fgDisabled),
      elevation: WidgetStateProperty.all(0),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: radius,
          side: borderNormal == null ? BorderSide.none : BorderSide(color: borderNormal, width: 1),
        ),
      ),
      side: _stateBorder(borderNormal, borderHover),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }

  static WidgetStateProperty<Color?> _stateColor(
      Color normal, Color hover, Color disabled) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) return disabled;
      if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
        return hover;
      }
      return normal;
    });
  }

  static WidgetStateProperty<BorderSide?> _stateBorder(
      Color? normal, Color? hover) {
    if (normal == null) return const WidgetStatePropertyAll(BorderSide.none);

    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
        return BorderSide(color: hover ?? normal);
      }
      return BorderSide(color: normal);
    });
  }
} 