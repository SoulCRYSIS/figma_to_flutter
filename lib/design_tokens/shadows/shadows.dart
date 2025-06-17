// ignore_for_file: non_constant_identifier_names, deprecated_member_use
part of '../figma.dart';
class Shadow extends BoxShadow {
    const Shadow._({
      super.color,
      super.offset,
      super.blurRadius,
      super.spreadRadius = 0.0,
      super.blurStyle,
    });
  }
class Shadows {
      const Shadows._();
  
static final List<Shadow> shadowsShadowXs = [
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowXs,
offset: Offset(0, 1),
blurRadius: 2,
spreadRadius: 0,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> shadowsShadowXsSkeuomorphic = [
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowXs,
offset: Offset(0, 1),
blurRadius: 2,
spreadRadius: 0,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowSkeumorphicInner,
offset: Offset(0, -2),
blurRadius: 0,
spreadRadius: 0,
blurStyle: BlurStyle.inner,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowSkeumorphicInnerBorder,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 1,
blurStyle: BlurStyle.inner,
),
];

static final List<Shadow> shadowsShadowSm = [
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowSm02,
offset: Offset(0, 1),
blurRadius: 2,
spreadRadius: -1,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowSm01,
offset: Offset(0, 1),
blurRadius: 3,
spreadRadius: 0,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> shadowsShadowMd = [
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowMd02,
offset: Offset(0, 2),
blurRadius: 4,
spreadRadius: -2,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowMd01,
offset: Offset(0, 4),
blurRadius: 6,
spreadRadius: -1,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> shadowsShadowLg = [
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowLg03,
offset: Offset(0, 2),
blurRadius: 2,
spreadRadius: -1,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowLg02,
offset: Offset(0, 4),
blurRadius: 6,
spreadRadius: -2,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowLg01,
offset: Offset(0, 12),
blurRadius: 16,
spreadRadius: -4,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> shadowsShadowXl = [
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowXl03,
offset: Offset(0, 3),
blurRadius: 3,
spreadRadius: -1.5,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowXl02,
offset: Offset(0, 8),
blurRadius: 8,
spreadRadius: -4,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowXl01,
offset: Offset(0, 20),
blurRadius: 24,
spreadRadius: -4,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> shadowsShadow2xl = [
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadow2xl02,
offset: Offset(0, 4),
blurRadius: 4,
spreadRadius: -2,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadow2xl01,
offset: Offset(0, 24),
blurRadius: 48,
spreadRadius: -12,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> shadowsShadow3xl = [
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadow3xl02,
offset: Offset(0, 5),
blurRadius: 5,
spreadRadius: -2.5,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadow3xl01,
offset: Offset(0, 32),
blurRadius: 64,
spreadRadius: -12,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> shadowsPortfolioMockupsShadowMainCentreMd = [
  Shadow._(
color: ColorModes.colorsEffectsPortfolioMockupsShadowMainCentreMd,
offset: Offset(0, 75),
blurRadius: 150,
spreadRadius: 0,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> shadowsPortfolioMockupsShadowMainCentreLg = [
  Shadow._(
color: ColorModes.colorsEffectsPortfolioMockupsShadowMainCentreLg,
offset: Offset(0, 100),
blurRadius: 200,
spreadRadius: 0,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> shadowsPortfolioMockupsShadowOverlayRightLg = [
  Shadow._(
color: ColorModes.colorsEffectsPortfolioMockupsShadowOverlayLg,
offset: Offset(-40, 40),
blurRadius: 72,
spreadRadius: 0,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> shadowsPortfolioMockupsShadowOverlayLeftLg = [
  Shadow._(
color: ColorModes.colorsEffectsPortfolioMockupsShadowOverlayLg,
offset: Offset(100, 100),
blurRadius: 150,
spreadRadius: 0,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> shadowsPortfolioMockupsShadowGridMd = [
  Shadow._(
color: ColorModes.colorsEffectsPortfolioMockupsShadowGridMd,
offset: Offset(32, 32),
blurRadius: 64,
spreadRadius: 0,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> focusRingsFocusRing = [
  Shadow._(
color: ColorModes.colorsEffectsFocusRingsFocusRing,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 4,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsBackgroundBgPrimary,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 2,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> focusRingsFocusRingShadowXs = [
  Shadow._(
color: ColorModes.colorsEffectsFocusRingsFocusRing,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 4,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsBackgroundBgPrimary,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 2,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowXs,
offset: Offset(0, 1),
blurRadius: 2,
spreadRadius: 0,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> focusRingsFocusRingShadowXsSkeuomorphic = [
  Shadow._(
color: ColorModes.colorsEffectsFocusRingsFocusRing,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 4,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsBackgroundBgPrimary,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 2,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowXs,
offset: Offset(0, 1),
blurRadius: 2,
spreadRadius: 0,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowSkeumorphicInner,
offset: Offset(0, -2),
blurRadius: 0,
spreadRadius: 0,
blurStyle: BlurStyle.inner,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowSkeumorphicInnerBorder,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 1,
blurStyle: BlurStyle.inner,
),
];

static final List<Shadow> focusRingsFocusRingShadowSm = [
  Shadow._(
color: ColorModes.colorsEffectsFocusRingsFocusRing,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 4,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsBackgroundBgPrimary,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 2,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowSm02,
offset: Offset(0, 1),
blurRadius: 2,
spreadRadius: 0,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowSm01,
offset: Offset(0, 1),
blurRadius: 3,
spreadRadius: 0,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> focusRingsFocusRingError = [
  Shadow._(
color: Color.fromRGBO(240, 56, 68, 1),
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 4,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsBackgroundBgPrimary,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 2,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> focusRingsFocusRingErrorShadowXs = [
  Shadow._(
color: ColorModes.colorsEffectsFocusRingsFocusRingError,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 4,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsBackgroundBgPrimary,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 2,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowXs,
offset: Offset(0, 1),
blurRadius: 2,
spreadRadius: 0,
blurStyle: BlurStyle.normal,
),
];

static final List<Shadow> focusRingsFocusRingErrorShadowXsSkeuomorphic = [
  Shadow._(
color: ColorModes.colorsEffectsFocusRingsFocusRingError,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 4,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsBackgroundBgPrimary,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 2,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowXs,
offset: Offset(0, 1),
blurRadius: 2,
spreadRadius: 0,
blurStyle: BlurStyle.normal,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowSkeumorphicInner,
offset: Offset(0, -2),
blurRadius: 0,
spreadRadius: 0,
blurStyle: BlurStyle.inner,
),
  Shadow._(
color: ColorModes.colorsEffectsShadowsShadowSkeumorphicInnerBorder,
offset: Offset(0, 0),
blurRadius: 0,
spreadRadius: 1,
blurStyle: BlurStyle.inner,
),
];

static final List<Shadow> backdropBlursBackdropBlurSm = [
//TODO: Ops, has some effect not support in this effect verify in figma, only support DROP_SHADOW and INNER_SHADOW
];

static final List<Shadow> backdropBlursBackdropBlurMd = [
//TODO: Ops, has some effect not support in this effect verify in figma, only support DROP_SHADOW and INNER_SHADOW
];

static final List<Shadow> backdropBlursBackdropBlurLg = [
//TODO: Ops, has some effect not support in this effect verify in figma, only support DROP_SHADOW and INNER_SHADOW
];

static final List<Shadow> backdropBlursBackdropBlurXl = [
//TODO: Ops, has some effect not support in this effect verify in figma, only support DROP_SHADOW and INNER_SHADOW
];

}
