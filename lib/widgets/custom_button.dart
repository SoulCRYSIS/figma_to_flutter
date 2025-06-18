import 'package:flutter/material.dart';
import '../design_tokens/figma.dart';

enum ButtonSize { sm, md, lg, xl, xxl }

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final EdgeInsets padding;
  final ButtonSize size;

  const CustomButton({
    super.key,
    required this.text,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.padding,
    this.size = ButtonSize.md,
  });

  @override
  Widget build(BuildContext context) {
    final double iconSize = switch (size) {
      ButtonSize.sm || ButtonSize.md || ButtonSize.lg || ButtonSize.xl => 20,
      ButtonSize.xxl => 24,
    };
    final double fontSize =
        switch (size) {
          ButtonSize.sm => Figma.typography.fontSizeTextSm,
          ButtonSize.md || ButtonSize.lg => Figma.typography.fontSizeTextMd,
          ButtonSize.xl || ButtonSize.xxl => Figma.typography.fontSizeTextLg,
        }.value;

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            switch (size) {
              ButtonSize.sm ||
              ButtonSize.md ||
              ButtonSize.lg ||
              ButtonSize.xl => Figma.radius.radiusMd,
              ButtonSize.xxl => Figma.radius.radiusLg,
            }.value,
          ),
        ),
        shadowColor: Color(0x0C0A0C12),
        elevation: 2,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: switch (size) {
          ButtonSize.sm || ButtonSize.md => Figma.spacing.spacingXs.value,
          ButtonSize.lg || ButtonSize.xl => Figma.spacing.spacingSm.value,
          ButtonSize.xxl => Figma.spacing.spacingMd.value,
        },
        children: [
          if (leftIcon != null)
            Icon(leftIcon, color: foregroundColor, size: iconSize),
          Text(
            text,
            style: TextStyle(
              color: foregroundColor,
              fontSize: fontSize,
              height:
                  switch (size) {
                    ButtonSize.sm => Figma.typography.lineHeightTextSm,
                    ButtonSize.md ||
                    ButtonSize.lg => Figma.typography.lineHeightTextMd,
                    ButtonSize.xl ||
                    ButtonSize.xxl => Figma.typography.lineHeightTextLg,
                  }.value /
                  fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (rightIcon != null)
            Icon(rightIcon, color: foregroundColor, size: iconSize),
        ],
      ),
    );
  }

  static EdgeInsets normalPadding(ButtonSize size) => EdgeInsets.symmetric(
    horizontal: switch (size) {
      ButtonSize.sm => Figma.spacing.spacingLg.value,
      ButtonSize.md => 14,
      ButtonSize.lg => Figma.spacing.spacingXl.value,
      ButtonSize.xl => 18,
      ButtonSize.xxl => 22,
    },
    vertical: switch (size) {
      ButtonSize.sm => Figma.spacing.spacingMd.value,
      ButtonSize.md => 10,
      ButtonSize.lg => 10,
      ButtonSize.xl => Figma.spacing.spacingLg.value,
      ButtonSize.xxl => Figma.spacing.spacingXl.value,
    },
  );

  static CustomButton primary({
    required String text,
    VoidCallback? onPressed,
    IconData? leftIcon,
    IconData? rightIcon,
    ButtonSize size = ButtonSize.md,
  }) => CustomButton(
    text: text,
    onPressed: onPressed,
    leftIcon: leftIcon,
    rightIcon: rightIcon,
    backgroundColor:
        Figma.colorModes.componentColorsComponentsButtonsPrimaryButtonPrimaryBg,
    foregroundColor:
        Figma.colorModes.componentColorsComponentsButtonsPrimaryButtonPrimaryFg,
    padding: normalPadding(size),
    size: size,
  );

  static CustomButton secondary({
    required String text,
    VoidCallback? onPressed,
    IconData? leftIcon,
    IconData? rightIcon,
    ButtonSize size = ButtonSize.md,
  }) => CustomButton(
    text: text,
    onPressed: onPressed,
    leftIcon: leftIcon,
    rightIcon: rightIcon,
    backgroundColor:
        Figma
            .colorModes
            .componentColorsComponentsButtonsSecondaryButtonSecondaryBg,
    foregroundColor:
        Figma
            .colorModes
            .componentColorsComponentsButtonsSecondaryButtonSecondaryFg,
    padding: normalPadding(size),
    size: size,
  );

  static CustomButton primaryError({
    required String text,
    VoidCallback? onPressed,
    IconData? leftIcon,
    IconData? rightIcon,
    ButtonSize size = ButtonSize.md,
  }) => CustomButton(
    text: text,
    onPressed: onPressed,
    leftIcon: leftIcon,
    rightIcon: rightIcon,
    backgroundColor:
        Figma
            .colorModes
            .componentColorsComponentsButtonsPrimaryErrorButtonPrimaryErrorBg,
    foregroundColor:
        Figma
            .colorModes
            .componentColorsComponentsButtonsPrimaryErrorButtonPrimaryErrorFg,
    padding: normalPadding(size),
    size: size,
  );
}
