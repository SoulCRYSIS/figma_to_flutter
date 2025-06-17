// ignore_for_file: non_constant_identifier_names, deprecated_member_use
part of '../figma.dart';
class Style extends TextStyle {

    const Style._({
       super.inherit = true,
       super.color,
       super.backgroundColor,
       super.fontSize,
       super.fontWeight,
       super.fontStyle,
       super.letterSpacing,
       super.wordSpacing,
       super.textBaseline,
       super.height,
       super.leadingDistribution,
       super.locale,
       super.foreground,
       super.background,
       super.shadows,
       super.fontFeatures,
       super.fontVariations,
       super.decoration,
       super.decorationColor,
       super.decorationStyle,
       super.decorationThickness,
       super.debugLabel,
       super.fontFamilyFallback,
       super.overflow,
       super.fontFamily,
     });
     
     

   Style tint(IColor? color) =>
       Style._style(copyWith(color: color));

    static FontWeight _parseVariableWeight(double parse) {
      if (parse <= 100) {
        return FontWeight.w100;
      } else if (parse <= 200) {
        return FontWeight.w200;
      } else if (parse <= 300) {
        return FontWeight.w300;
      } else if (parse <= 400) {
        return FontWeight.w400;
      } else if (parse <= 500) {
        return FontWeight.w500;
      } else if (parse <= 600) {
        return FontWeight.w600;
      } else if (parse <= 700) {
        return FontWeight.w700;
      } else if (parse <= 800) {
        return FontWeight.w800;
      } else {
        return FontWeight.w900;
      }
    }

    static FontStyle _parseStringStyle(String parse) {
      return parse.contains("italic") ? FontStyle.italic : FontStyle.normal;
    }

   
   factory Style._style(TextStyle textStyle) {
     return Style._(
       inherit: textStyle.inherit,
       color: textStyle.color,
       backgroundColor: textStyle.backgroundColor,
       fontSize: textStyle.fontSize,
       fontWeight: textStyle.fontWeight,
       fontStyle: textStyle.fontStyle,
       letterSpacing: textStyle.letterSpacing,
       wordSpacing: textStyle.wordSpacing,
       textBaseline: textStyle.textBaseline,
       height: textStyle.height,
       leadingDistribution: textStyle.leadingDistribution,
       locale: textStyle.locale,
       foreground: textStyle.foreground,
       background: textStyle.background,
       shadows: textStyle.shadows,
       fontFeatures: textStyle.fontFeatures,
       fontVariations: textStyle.fontVariations,
       decoration: textStyle.decoration,
       decorationColor: textStyle.decorationColor,
       decorationStyle: textStyle.decorationStyle,
       decorationThickness: textStyle.decorationThickness,
       debugLabel: textStyle.debugLabel,
       fontFamily: textStyle.fontFamily,
       fontFamilyFallback: textStyle.fontFamilyFallback,
       overflow: textStyle.overflow,
     );
   }
  }
 
class Styles {
  const Styles._();

   static const _parent = TextStyle(
     debugLabel: '',
     leadingDistribution: TextLeadingDistribution.even,
   );

      static final  display2xlRegular = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplay2xl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightDisplay2xl.value/Typography.fontSizeDisplay2xl.value,
                letterSpacing: -1.44,
              ),
            );

      static final  display2xlMedium = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplay2xl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMedium.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightDisplay2xl.value/Typography.fontSizeDisplay2xl.value,
                letterSpacing: -1.44,
              ),
            );

      static final  display2xlSemibold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplay2xl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemibold.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightDisplay2xl.value/Typography.fontSizeDisplay2xl.value,
                letterSpacing: -1.44,
              ),
            );

      static final  display2xlBold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplay2xl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightBold.value),
                fontWeight:FontWeight.w700,
                height: Typography.lineHeightDisplay2xl.value/Typography.fontSizeDisplay2xl.value,
                letterSpacing: -1.44,
              ),
            );

      static final  displayXlRegular = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayXl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightDisplayXl.value/Typography.fontSizeDisplayXl.value,
                letterSpacing: -1.2,
              ),
            );

      static final  displayXlMedium = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayXl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMedium.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightDisplayXl.value/Typography.fontSizeDisplayXl.value,
                letterSpacing: -1.2,
              ),
            );

      static final  displayXlSemibold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayXl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemibold.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightDisplayXl.value/Typography.fontSizeDisplayXl.value,
                letterSpacing: -1.2,
              ),
            );

      static final  displayXlBold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayXl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightBold.value),
                fontWeight:FontWeight.w700,
                height: Typography.lineHeightDisplayXl.value/Typography.fontSizeDisplayXl.value,
                letterSpacing: -1.2,
              ),
            );

      static final  displayLgRegular = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayLg.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightDisplayLg.value/Typography.fontSizeDisplayLg.value,
                letterSpacing: -0.96,
              ),
            );

      static final  displayLgMedium = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayLg.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMedium.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightDisplayLg.value/Typography.fontSizeDisplayLg.value,
                letterSpacing: -0.96,
              ),
            );

      static final  displayLgSemibold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayLg.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemibold.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightDisplayLg.value/Typography.fontSizeDisplayLg.value,
                letterSpacing: -0.96,
              ),
            );

      static final  displayLgBold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayLg.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightBold.value),
                fontWeight:FontWeight.w700,
                height: Typography.lineHeightDisplayLg.value/Typography.fontSizeDisplayLg.value,
                letterSpacing: -0.96,
              ),
            );

      static final  displayMdRegular = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayMd.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightDisplayMd.value/Typography.fontSizeDisplayMd.value,
                letterSpacing: -0.72,
              ),
            );

      static final  displayMdMedium = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayMd.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMedium.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightDisplayMd.value/Typography.fontSizeDisplayMd.value,
                letterSpacing: -0.72,
              ),
            );

      static final  displayMdSemibold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayMd.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemibold.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightDisplayMd.value/Typography.fontSizeDisplayMd.value,
                letterSpacing: -0.72,
              ),
            );

      static final  displayMdBold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayMd.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightBold.value),
                fontWeight:FontWeight.w700,
                height: Typography.lineHeightDisplayMd.value/Typography.fontSizeDisplayMd.value,
                letterSpacing: -0.72,
              ),
            );

      static final  displaySmRegular = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplaySm.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightDisplaySm.value/Typography.fontSizeDisplaySm.value,
                letterSpacing: 0,
              ),
            );

      static final  displaySmMedium = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplaySm.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMedium.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightDisplaySm.value/Typography.fontSizeDisplaySm.value,
                letterSpacing: 0,
              ),
            );

      static final  displaySmSemibold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplaySm.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemibold.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightDisplaySm.value/Typography.fontSizeDisplaySm.value,
                letterSpacing: 0,
              ),
            );

      static final  displaySmBold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplaySm.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightBold.value),
                fontWeight:FontWeight.w700,
                height: Typography.lineHeightDisplaySm.value/Typography.fontSizeDisplaySm.value,
                letterSpacing: 0,
              ),
            );

      static final  displaySmMediumItalic = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplaySm.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMediumItalic.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightDisplaySm.value/Typography.fontSizeDisplaySm.value,
                letterSpacing: 0,
              ),
            );

      static final  displayXsRegular = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayXs.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightDisplayXs.value/Typography.fontSizeDisplayXs.value,
                letterSpacing: 0,
              ),
            );

      static final  displayXsMedium = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayXs.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMedium.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightDisplayXs.value/Typography.fontSizeDisplayXs.value,
                letterSpacing: 0,
              ),
            );

      static final  displayXsSemibold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayXs.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemibold.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightDisplayXs.value/Typography.fontSizeDisplayXs.value,
                letterSpacing: 0,
              ),
            );

      static final  displayXsBold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayXs.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightBold.value),
                fontWeight:FontWeight.w700,
                height: Typography.lineHeightDisplayXs.value/Typography.fontSizeDisplayXs.value,
                letterSpacing: 0,
              ),
            );

      static final  displayXsMediumItalic = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyDisplay.value,
                fontSize: Typography.fontSizeDisplayXs.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMediumItalic.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightDisplayXs.value/Typography.fontSizeDisplayXs.value,
                letterSpacing: 0,
              ),
            );

      static final  textXlRegular = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextXl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightTextXl.value/Typography.fontSizeTextXl.value,
                letterSpacing: 0,
              ),
            );

      static final  textXlMedium = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextXl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMedium.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightTextXl.value/Typography.fontSizeTextXl.value,
                letterSpacing: 0,
              ),
            );

      static final  textXlSemibold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextXl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemibold.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightTextXl.value/Typography.fontSizeTextXl.value,
                letterSpacing: 0,
              ),
            );

      static final  textXlBold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextXl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightBold.value),
                fontWeight:FontWeight.w700,
                height: Typography.lineHeightTextXl.value/Typography.fontSizeTextXl.value,
                letterSpacing: 0,
              ),
            );

      static final  textXlRegularItalic = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextXl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegularItalic.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightTextXl.value/Typography.fontSizeTextXl.value,
                letterSpacing: 0,
              ),
            );

      static final  textXlMediumItalic = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextXl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMediumItalic.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightTextXl.value/Typography.fontSizeTextXl.value,
                letterSpacing: 0,
              ),
            );

      static final  textXlSemiboldItalic = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextXl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemiboldItalic.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightTextXl.value/Typography.fontSizeTextXl.value,
                letterSpacing: 0,
              ),
            );

      static final  textXlBoldItalic = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextXl.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightBoldItalic.value),
                fontWeight:FontWeight.w700,
                height: Typography.lineHeightTextXl.value/Typography.fontSizeTextXl.value,
                letterSpacing: 0,
              ),
            );

      static final  textXlRegularUnderlined = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextXl.value,
                decoration: TextDecoration.underline,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightTextXl.value/Typography.fontSizeTextXl.value,
                letterSpacing: 0,
              ),
            );

      static final  textLgRegular = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextLg.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightTextLg.value/Typography.fontSizeTextLg.value,
                letterSpacing: 0,
              ),
            );

      static final  textLgMedium = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextLg.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMedium.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightTextLg.value/Typography.fontSizeTextLg.value,
                letterSpacing: 0,
              ),
            );

      static final  textLgSemibold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextLg.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemibold.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightTextLg.value/Typography.fontSizeTextLg.value,
                letterSpacing: 0,
              ),
            );

      static final  textLgBold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextLg.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightBold.value),
                fontWeight:FontWeight.w700,
                height: Typography.lineHeightTextLg.value/Typography.fontSizeTextLg.value,
                letterSpacing: 0,
              ),
            );

      static final  textLgRegularItalic = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextLg.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegularItalic.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightTextLg.value/Typography.fontSizeTextLg.value,
                letterSpacing: 0,
              ),
            );

      static final  textLgMediumItalic = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextLg.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMediumItalic.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightTextLg.value/Typography.fontSizeTextLg.value,
                letterSpacing: 0,
              ),
            );

      static final  textLgSemiboldItalic = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextLg.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemiboldItalic.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightTextLg.value/Typography.fontSizeTextLg.value,
                letterSpacing: 0,
              ),
            );

      static final  textLgBoldItalic = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextLg.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightBoldItalic.value),
                fontWeight:FontWeight.w700,
                height: Typography.lineHeightTextLg.value/Typography.fontSizeTextLg.value,
                letterSpacing: 0,
              ),
            );

      static final  textLgRegularUnderlined = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextLg.value,
                decoration: TextDecoration.underline,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightTextLg.value/Typography.fontSizeTextLg.value,
                letterSpacing: 0,
              ),
            );

      static final  textLgMediumUnderlined = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextLg.value,
                decoration: TextDecoration.underline,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMedium.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightTextLg.value/Typography.fontSizeTextLg.value,
                letterSpacing: 0,
              ),
            );

      static final  textLgSemiboldUnderlined = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextLg.value,
                decoration: TextDecoration.underline,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemibold.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightTextLg.value/Typography.fontSizeTextLg.value,
                letterSpacing: 0,
              ),
            );

      static final  textMdRegular = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextMd.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightTextMd.value/Typography.fontSizeTextMd.value,
                letterSpacing: 0,
              ),
            );

      static final  textMdMedium = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextMd.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMedium.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightTextMd.value/Typography.fontSizeTextMd.value,
                letterSpacing: 0,
              ),
            );

      static final  textMdSemibold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextMd.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemibold.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightTextMd.value/Typography.fontSizeTextMd.value,
                letterSpacing: 0,
              ),
            );

      static final  textMdBold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextMd.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightBold.value),
                fontWeight:FontWeight.w700,
                height: Typography.lineHeightTextMd.value/Typography.fontSizeTextMd.value,
                letterSpacing: 0,
              ),
            );

      static final  textMdRegularItalic = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextMd.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegularItalic.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightTextMd.value/Typography.fontSizeTextMd.value,
                letterSpacing: 0,
              ),
            );

      static final  textMdMediumItalic = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextMd.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMediumItalic.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightTextMd.value/Typography.fontSizeTextMd.value,
                letterSpacing: 0,
              ),
            );

      static final  textMdSemiboldItalic = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextMd.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemiboldItalic.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightTextMd.value/Typography.fontSizeTextMd.value,
                letterSpacing: 0,
              ),
            );

      static final  textMdBoldItalic = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextMd.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightBoldItalic.value),
                fontWeight:FontWeight.w700,
                height: Typography.lineHeightTextMd.value/Typography.fontSizeTextMd.value,
                letterSpacing: 0,
              ),
            );

      static final  textMdRegularUnderlined = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextMd.value,
                decoration: TextDecoration.underline,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightTextMd.value/Typography.fontSizeTextMd.value,
                letterSpacing: 0,
              ),
            );

      static final  textMdMediumUnderlined = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextMd.value,
                decoration: TextDecoration.underline,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMedium.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightTextMd.value/Typography.fontSizeTextMd.value,
                letterSpacing: 0,
              ),
            );

      static final  textMdSemiboldUnderlined = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextMd.value,
                decoration: TextDecoration.underline,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemibold.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightTextMd.value/Typography.fontSizeTextMd.value,
                letterSpacing: 0,
              ),
            );

      static final  textSmRegular = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextSm.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightTextSm.value/Typography.fontSizeTextSm.value,
                letterSpacing: 0,
              ),
            );

      static final  textSmMedium = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextSm.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMedium.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightTextSm.value/Typography.fontSizeTextSm.value,
                letterSpacing: 0,
              ),
            );

      static final  textSmSemibold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextSm.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemibold.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightTextSm.value/Typography.fontSizeTextSm.value,
                letterSpacing: 0,
              ),
            );

      static final  textSmBold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextSm.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightBold.value),
                fontWeight:FontWeight.w700,
                height: Typography.lineHeightTextSm.value/Typography.fontSizeTextSm.value,
                letterSpacing: 0,
              ),
            );

      static final  textSmRegularUnderlined = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextSm.value,
                decoration: TextDecoration.underline,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightTextSm.value/Typography.fontSizeTextSm.value,
                letterSpacing: 0,
              ),
            );

      static final  textSmMediumUnderlined = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextSm.value,
                decoration: TextDecoration.underline,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMedium.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightTextSm.value/Typography.fontSizeTextSm.value,
                letterSpacing: 0,
              ),
            );

      static final  textSmSemiboldUnderlined = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextSm.value,
                decoration: TextDecoration.underline,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemibold.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightTextSm.value/Typography.fontSizeTextSm.value,
                letterSpacing: 0,
              ),
            );

      static final  textXsRegular = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextXs.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightRegular.value),
                fontWeight:FontWeight.w400,
                height: Typography.lineHeightTextXs.value/Typography.fontSizeTextXs.value,
                letterSpacing: 0,
              ),
            );

      static final  textXsMedium = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextXs.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightMedium.value),
                fontWeight:FontWeight.w500,
                height: Typography.lineHeightTextXs.value/Typography.fontSizeTextXs.value,
                letterSpacing: 0,
              ),
            );

      static final  textXsSemibold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextXs.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightSemibold.value),
                fontWeight:FontWeight.w600,
                height: Typography.lineHeightTextXs.value/Typography.fontSizeTextXs.value,
                letterSpacing: 0,
              ),
            );

      static final  textXsBold = Style._style(
              _parent.copyWith(
                fontFamily: Typography.fontFamilyFontFamilyBody.value,
                fontSize: Typography.fontSizeTextXs.value,
                decoration: TextDecoration.none,
                fontStyle: Style._parseStringStyle(Typography.fontWeightBold.value),
                fontWeight:FontWeight.w700,
                height: Typography.lineHeightTextXs.value/Typography.fontSizeTextXs.value,
                letterSpacing: 0,
              ),
            );
}