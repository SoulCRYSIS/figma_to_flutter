import 'package:flutter/material.dart';
import 'package:figma_to_flutter/design_tokens/figma.dart';
import 'package:figma_to_flutter/widgets/app_button.dart';
import 'package:figma_to_flutter/icons/svg_icons.dart';
import 'package:svg_icon_widget/svg_icon_widget.dart';

/// Figma Reference: https://www.figma.com/design/w6tEcAwj9Eaq0ej29C8F4M/%E2%9D%96-Untitled-UI-%E2%80%93-PRO-VARIABLES--v6.0----Testing-Token?node-id=1607-263346
/// Purpose: Static "404 – Page not found" screen.
class ErrorPageNotFoundScreen extends StatelessWidget {
  const ErrorPageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: Figma.containers.containerPaddingMobile.value,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 404 label
                Text(
                  '404 error',
                  style: TextStyle(
                    fontSize: Figma.typography.fontSizeTextMd.value,
                    fontWeight: FontWeight.w600,
                    height: Figma.typography.lineHeightTextMd.value / Figma.typography.fontSizeTextMd.value,
                    color: Figma.colorModes.colorsTextTextBrandSecondary700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Figma.spacing.spacingSm.value),

                // Heading
                Text(
                  "We can't find that page",
                  style: TextStyle(
                    fontSize: Figma.typography.fontSizeDisplayMd.value,
                    fontWeight: FontWeight.w600,
                    height: Figma.typography.lineHeightDisplayMd.value / Figma.typography.fontSizeDisplayMd.value,
                    letterSpacing: -0.72,
                    color: Figma.colorModes.colorsTextTextPrimary900,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Figma.spacing.spacingMd.value),

                // Supporting text
                Text(
                  "Sorry, the page you are looking for doesn't exist or has been moved.",
                  style: TextStyle(
                    fontSize: Figma.typography.fontSizeTextLg.value,
                    fontWeight: FontWeight.w400,
                    height: Figma.typography.lineHeightTextLg.value / Figma.typography.fontSizeTextLg.value,
                    color: Figma.colorModes.colorsTextTextTertiary600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Figma.spacing.spacing7xl.value),

                // Action buttons
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppButton(
                      variant: ButtonVariant.primary,
                      size: ButtonSize.lg,
                      label: 'Take me home',
                      onPressed: () => _goHome(context),
                    ),
                    SizedBox(height: Figma.spacing.spacingSm.value),
                    AppButton(
                      variant: ButtonVariant.secondaryGray,
                      size: ButtonSize.lg,
                      label: 'Go back',
                      leftIcon: SvgIcon(
                        SvgIcons.arrowLeft,
                        size: 18,
                        color: Figma.colorModes.colorsForegroundFgTertiary600,
                      ),
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _goHome(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
} 