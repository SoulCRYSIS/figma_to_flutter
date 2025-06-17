
// ignore_for_file: overridden_fields, unused_element, non_constant_identifier_names

/// The all getter and classes with variables and functions statics: 
/// [Styles], [Shadows], [ColorStyle], [FigmaTheme], [Primitives], [ColorModes], [Containers], [Widths], [Spacing], [Radius], [Typography]
///
///
/// Text Style Documents:
/// * [TextStyle] are represented in an class called [Style].
/// * To access all [Style] statically, you can just access them using the [Styles] class.
/// * To color a [Style], just use the .tint([IColor]) function.
/// * [Style] may or may not have figma variables depending on the design in figma
/// * The attributes exported from figma are [fontFamily], [fontSize], [decoration], [fontStyle], [fontWeight], [height], [letterSpacing]
/// 
/// Shadow Documents:
/// * ONLY support DROP_SHADOW and INNER_SHADOW.
/// * [BoxShadow] are represented in an class called [Shadow].
/// * To access all [Shadow] statically, you can just access them using the [Shadows}] class.
/// * Shadows may or may not have figma variables depending on the design in figma
/// * The attributes exported from figma are [color], [offset], [blurRadius], [spreadRadius], [blurStyle]
/// 
/// Color Styles Documents:
/// * Support SOLID COLOR and GRADIENT LINEAR and GRADIENT RADIAL.
/// * To access all [IColor] statically, you can just access them using the [ColorStyle}] class.
/// * Colors may or may not have figma variables depending on the design in figma
/// 
/// *IMPORTANT*: You need a [FigmaTheme] on top of your Material so that colors, sizes, strings, booleans are rebuilt when changed.
///
/// ```dart
///  class MyApp extends StatelessWidget {
///    const MyApp({super.key});
///
///    @override
///    Widget build(BuildContext context) {
///      return const FigmaTheme(
///        child: MaterialApp(
///          title: 'Figma Demo',
///          home: MyHomePage(title: 'Figma Demo Home Page'),
///        ),
///      );
///    }
///  }
/// ```
///
///
/// The variable [Primitives] is a getter that fetches the style[PrimitivesDefault] based on the set `MODE`[PrimitivesTypes]
/// To change the MODE of [Primitives] just use the function [FigmaTheme.PrimitivesDefault] passing the enum [PrimitivesTypes]
///
/// [PrimitivesDefault] is a sealed class that contains all the variables of the collection _Primitives
/// [_PrimitivesStyle] is a class that contains all the variables of the collection _Primitives in the mode Style
///
///
/// The variable [ColorModes] is a getter that fetches the style[ColorModesDefault] based on the set `MODE`[ColorModesTypes]
/// To change the MODE of [ColorModes] just use the function [FigmaTheme.ColorModesDefault] passing the enum [ColorModesTypes]
///
/// [ColorModesDefault] is a sealed class that contains all the variables of the collection Color modes
/// [_ColorModesLightMode] is a class that contains all the variables of the collection Color modes in the mode Light mode
/// [_ColorModesDarkMode] is a class that contains all the variables of the collection Color modes in the mode Dark mode
///
///
/// The variable [Containers] is a getter that fetches the style[ContainersDefault] based on the set `MODE`[ContainersTypes]
/// To change the MODE of [Containers] just use the function [FigmaTheme.ContainersDefault] passing the enum [ContainersTypes]
///
/// [ContainersDefault] is a sealed class that contains all the variables of the collection Containers
/// [_ContainersValue] is a class that contains all the variables of the collection Containers in the mode Value
///
///
/// The variable [Widths] is a getter that fetches the style[WidthsDefault] based on the set `MODE`[WidthsTypes]
/// To change the MODE of [Widths] just use the function [FigmaTheme.WidthsDefault] passing the enum [WidthsTypes]
///
/// [WidthsDefault] is a sealed class that contains all the variables of the collection Widths
/// [_WidthsMode1] is a class that contains all the variables of the collection Widths in the mode Mode 1
///
///
/// The variable [Spacing] is a getter that fetches the style[SpacingDefault] based on the set `MODE`[SpacingTypes]
/// To change the MODE of [Spacing] just use the function [FigmaTheme.SpacingDefault] passing the enum [SpacingTypes]
///
/// [SpacingDefault] is a sealed class that contains all the variables of the collection Spacing
/// [_SpacingMode1] is a class that contains all the variables of the collection Spacing in the mode Mode 1
///
///
/// The variable [Radius] is a getter that fetches the style[RadiusDefault] based on the set `MODE`[RadiusTypes]
/// To change the MODE of [Radius] just use the function [FigmaTheme.RadiusDefault] passing the enum [RadiusTypes]
///
/// [RadiusDefault] is a sealed class that contains all the variables of the collection Radius
/// [_RadiusMode1] is a class that contains all the variables of the collection Radius in the mode Mode 1
///
///
/// The variable [Typography] is a getter that fetches the style[TypographyDefault] based on the set `MODE`[TypographyTypes]
/// To change the MODE of [Typography] just use the function [FigmaTheme.TypographyDefault] passing the enum [TypographyTypes]
///
/// [TypographyDefault] is a sealed class that contains all the variables of the collection Typography
/// [_TypographyValue] is a class that contains all the variables of the collection Typography in the mode Value
///
///
library figma_theme;
// ignore_for_file: non_constant_identifier_names, deprecated_member_use
import 'dart:ui';
import 'package:flutter/material.dart';
part './colors/variables.dart';
part './colors/color_style.dart';
part './shadows/shadows.dart';
part './styles/styles.dart';
part '_notifiers/notifiers.dart';
part 'figma_theme.dart';

  class IColor extends Color {
    const IColor._(int value) : super(value);
    const IColor._fromARGB(int a, int r, int g, int b)
      : super.fromARGB(a, r, g, b);
  }


  class INumber {
    final double value;
    const INumber._(this.value);
  }


  class IString {
    final String value;
    const IString._(this.value);
  }


  class IBool {
    final bool value;
    const IBool._(this.value);
  }


extension _LerpDouble on double {
  double _lerp(double b, double t) {
    return lerpDouble(this, b, t) ?? this;
  }
}

extension _LerpColor on Color {
  Color _lerp(Color b, double t) {
    return Color.lerp(this, b, t) ?? this;
  }
}

extension _LerpString on String {
  String _lerp(String b, double t) {
    return t < 0.5 ? b : this;
  }
}

extension _LerpBoolean on bool {
  bool _lerp(bool b, double t) {
    return t < 0.5 ? b : this;
  }
}
final class Figma{

  static PrimitivesDefault get primitives => Primitives;
  static ColorModesDefault get colorModes => ColorModes;
  static ContainersDefault get containers => Containers;
  static WidthsDefault get widths => Widths;
  static SpacingDefault get spacing => Spacing;
  static RadiusDefault get radius => Radius;
  static TypographyDefault get typography => Typography;
}