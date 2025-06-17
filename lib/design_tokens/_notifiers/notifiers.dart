// ignore_for_file: non_constant_identifier_names, deprecated_member_use
part of '../figma.dart';
ValueNotifier<PrimitivesDefault> _Primitives = ValueNotifier(_PrimitivesStyle._());
PrimitivesDefault _PrimitivesLast = _PrimitivesStyle._();
enum PrimitivesTypes {style}
PrimitivesDefault get Primitives {
      // TODO: You need to change this method if you want to change the behavior.
        if( _animationControllerPrimitivesDefault?.isAnimating??false){
         return PrimitivesDefault._lerpResolve(_Primitives.value, _PrimitivesLast, _animationControllerPrimitivesDefault?.value??1,);
       }
         return _Primitives.value;
      }

ValueNotifier<ColorModesDefault> _ColorModes = ValueNotifier(_ColorModesLightMode._());
ColorModesDefault _ColorModesLast = _ColorModesLightMode._();
enum ColorModesTypes {lightMode, darkMode}
ColorModesDefault get ColorModes {
      // TODO: You need to change this method if you want to change the behavior.
        if( _animationControllerColorModesDefault?.isAnimating??false){
         return ColorModesDefault._lerpResolve(_ColorModes.value, _ColorModesLast, _animationControllerColorModesDefault?.value??1,);
       }
         return _ColorModes.value;
      }

ValueNotifier<ContainersDefault> _Containers = ValueNotifier(_ContainersValue._());
ContainersDefault _ContainersLast = _ContainersValue._();
enum ContainersTypes {value}
ContainersDefault get Containers {
      // TODO: You need to change this method if you want to change the behavior.
        if( _animationControllerContainersDefault?.isAnimating??false){
         return ContainersDefault._lerpResolve(_Containers.value, _ContainersLast, _animationControllerContainersDefault?.value??1,);
       }
         return _Containers.value;
      }

ValueNotifier<WidthsDefault> _Widths = ValueNotifier(_WidthsMode1._());
WidthsDefault _WidthsLast = _WidthsMode1._();
enum WidthsTypes {mode1}
WidthsDefault get Widths {
      // TODO: You need to change this method if you want to change the behavior.
        if( _animationControllerWidthsDefault?.isAnimating??false){
         return WidthsDefault._lerpResolve(_Widths.value, _WidthsLast, _animationControllerWidthsDefault?.value??1,);
       }
         return _Widths.value;
      }

ValueNotifier<SpacingDefault> _Spacing = ValueNotifier(_SpacingMode1._());
SpacingDefault _SpacingLast = _SpacingMode1._();
enum SpacingTypes {mode1}
SpacingDefault get Spacing {
      // TODO: You need to change this method if you want to change the behavior.
        if( _animationControllerSpacingDefault?.isAnimating??false){
         return SpacingDefault._lerpResolve(_Spacing.value, _SpacingLast, _animationControllerSpacingDefault?.value??1,);
       }
         return _Spacing.value;
      }

ValueNotifier<RadiusDefault> _Radius = ValueNotifier(_RadiusMode1._());
RadiusDefault _RadiusLast = _RadiusMode1._();
enum RadiusTypes {mode1}
RadiusDefault get Radius {
      // TODO: You need to change this method if you want to change the behavior.
        if( _animationControllerRadiusDefault?.isAnimating??false){
         return RadiusDefault._lerpResolve(_Radius.value, _RadiusLast, _animationControllerRadiusDefault?.value??1,);
       }
         return _Radius.value;
      }

ValueNotifier<TypographyDefault> _Typography = ValueNotifier(_TypographyValue._());
TypographyDefault _TypographyLast = _TypographyValue._();
enum TypographyTypes {value}
TypographyDefault get Typography {
      // TODO: You need to change this method if you want to change the behavior.
        if( _animationControllerTypographyDefault?.isAnimating??false){
         return TypographyDefault._lerpResolve(_Typography.value, _TypographyLast, _animationControllerTypographyDefault?.value??1,);
       }
         return _Typography.value;
      }
