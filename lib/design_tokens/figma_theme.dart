// ignore_for_file: non_constant_identifier_names, deprecated_member_use
part of 'figma.dart';

    AnimationController? _animationControllerPrimitivesDefault;
AnimationController? _animationControllerColorModesDefault;
AnimationController? _animationControllerContainersDefault;
AnimationController? _animationControllerWidthsDefault;
AnimationController? _animationControllerSpacingDefault;
AnimationController? _animationControllerRadiusDefault;
AnimationController? _animationControllerTypographyDefault;
    class FigmaTheme extends StatefulWidget {
        final Widget child;
        final Duration duration;
        const FigmaTheme({
          super.key,
          required this.child,
          this.duration = const Duration(milliseconds: 300),
        });
  
static PrimitivesTypes primitivestypes = PrimitivesTypes.style;
static void modifyPrimitives(PrimitivesTypes type){
   primitivestypes = type;
   _PrimitivesLast = _Primitives.value;
   _Primitives.value =  switch(type){
     PrimitivesTypes.style => _PrimitivesStyle._(),
   };
}
static ColorModesTypes colormodestypes = ColorModesTypes.lightMode;
static void modifyColorModes(ColorModesTypes type){
   colormodestypes = type;
   _ColorModesLast = _ColorModes.value;
   _ColorModes.value =  switch(type){
     ColorModesTypes.lightMode => _ColorModesLightMode._(),
ColorModesTypes.darkMode => _ColorModesDarkMode._(),
   };
}
static ContainersTypes containerstypes = ContainersTypes.value;
static void modifyContainers(ContainersTypes type){
   containerstypes = type;
   _ContainersLast = _Containers.value;
   _Containers.value =  switch(type){
     ContainersTypes.value => _ContainersValue._(),
   };
}
static WidthsTypes widthstypes = WidthsTypes.mode1;
static void modifyWidths(WidthsTypes type){
   widthstypes = type;
   _WidthsLast = _Widths.value;
   _Widths.value =  switch(type){
     WidthsTypes.mode1 => _WidthsMode1._(),
   };
}
static SpacingTypes spacingtypes = SpacingTypes.mode1;
static void modifySpacing(SpacingTypes type){
   spacingtypes = type;
   _SpacingLast = _Spacing.value;
   _Spacing.value =  switch(type){
     SpacingTypes.mode1 => _SpacingMode1._(),
   };
}
static RadiusTypes radiustypes = RadiusTypes.mode1;
static void modifyRadius(RadiusTypes type){
   radiustypes = type;
   _RadiusLast = _Radius.value;
   _Radius.value =  switch(type){
     RadiusTypes.mode1 => _RadiusMode1._(),
   };
}
static TypographyTypes typographytypes = TypographyTypes.value;
static void modifyTypography(TypographyTypes type){
   typographytypes = type;
   _TypographyLast = _Typography.value;
   _Typography.value =  switch(type){
     TypographyTypes.value => _TypographyValue._(),
   };
}
@override
      State<FigmaTheme> createState() => _FigmaThemeState();
    }
class _FigmaThemeState extends State<FigmaTheme>  with TickerProviderStateMixin{
  
  void _rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
 @override
      void initState() {
        super.initState();
         _animationControllerPrimitivesDefault = AnimationController(
          vsync: this,
          duration: widget.duration,
        );
 _animationControllerColorModesDefault = AnimationController(
          vsync: this,
          duration: widget.duration,
        );
 _animationControllerContainersDefault = AnimationController(
          vsync: this,
          duration: widget.duration,
        );
 _animationControllerWidthsDefault = AnimationController(
          vsync: this,
          duration: widget.duration,
        );
 _animationControllerSpacingDefault = AnimationController(
          vsync: this,
          duration: widget.duration,
        );
 _animationControllerRadiusDefault = AnimationController(
          vsync: this,
          duration: widget.duration,
        );
 _animationControllerTypographyDefault = AnimationController(
          vsync: this,
          duration: widget.duration,
        );
_Primitives.addListener((){
   _animationControllerPrimitivesDefault?.forward(from: 0);
});
_ColorModes.addListener((){
   _animationControllerColorModesDefault?.forward(from: 0);
});
_Containers.addListener((){
   _animationControllerContainersDefault?.forward(from: 0);
});
_Widths.addListener((){
   _animationControllerWidthsDefault?.forward(from: 0);
});
_Spacing.addListener((){
   _animationControllerSpacingDefault?.forward(from: 0);
});
_Radius.addListener((){
   _animationControllerRadiusDefault?.forward(from: 0);
});
_Typography.addListener((){
   _animationControllerTypographyDefault?.forward(from: 0);
});

  }
    
    @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        _animationControllerPrimitivesDefault,
_animationControllerColorModesDefault,
_animationControllerContainersDefault,
_animationControllerWidthsDefault,
_animationControllerSpacingDefault,
_animationControllerRadiusDefault,
_animationControllerTypographyDefault,
      ]),
      builder: (context, _) {
        _rebuildAllChildren(context);
        return widget.child;
      },
    );
  }
}