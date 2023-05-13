import 'package:flutter/material.dart';

class Pallette extends ThemeExtension<Pallette> {
  final Color normalText;
  final Color disabledText;
  final Color primary;
  final Color primaryGradientColor1;
  final Color primaryGradientColor2;
  final Color accent;
  final Color error;
  final Color tertiary1;
  final Color tertiary2;
  final Color tertiary3;
  final Color tertiary4;
  final Color tertiary5;

  Pallette({
    required this.normalText,
    required this.disabledText,
    required this.primary,
    required this.primaryGradientColor1,
    required this.primaryGradientColor2,
    required this.accent,
    required this.error,
    required this.tertiary1,
    required this.tertiary2,
    required this.tertiary3,
    required this.tertiary4,
    required this.tertiary5,
  });

  @override
  Pallette copyWith(
      {Color? normalText,
      Color? disabledText,
      Color? primary,
      Color? primaryGradientColor1,
      Color? primaryGradientColor2,
      Color? accent,
      Color? error,
      Color? tertiary1,
      Color? tertiary2,
      Color? tertiary3,
      Color? tertiary4,
      Color? tertiary5}) {
    return Pallette(
      normalText: normalText ?? this.normalText,
      disabledText: disabledText ?? this.disabledText,
      primary: primary ?? this.primary,
      primaryGradientColor1:
          primaryGradientColor1 ?? this.primaryGradientColor1,
      primaryGradientColor2:
          primaryGradientColor2 ?? this.primaryGradientColor2,
      accent: accent ?? this.accent,
      error: error ?? this.error,
      tertiary1: tertiary1 ?? this.tertiary1,
      tertiary2: tertiary2 ?? this.tertiary2,
      tertiary3: tertiary3 ?? this.tertiary3,
      tertiary4: tertiary4 ?? this.tertiary4,
      tertiary5: tertiary5 ?? this.tertiary5,
    );
  }

  @override
  Pallette lerp(Pallette? other, double t) {
    if (other is! Pallette) {
      return this;
    }
    return Pallette(
      normalText: Color.lerp(normalText, other.normalText, t)!,
      disabledText: Color.lerp(disabledText, other.disabledText, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryGradientColor1:
          Color.lerp(primaryGradientColor1, other.primaryGradientColor1, t)!,
      primaryGradientColor2:
          Color.lerp(primaryGradientColor2, other.primaryGradientColor2, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      error: Color.lerp(error, other.error, t)!,
      tertiary1: Color.lerp(tertiary1, other.tertiary1, t)!,
      tertiary2: Color.lerp(tertiary2, other.tertiary2, t)!,
      tertiary3: Color.lerp(tertiary3, other.tertiary3, t)!,
      tertiary4: Color.lerp(tertiary4, other.tertiary4, t)!,
      tertiary5: Color.lerp(tertiary5, other.tertiary5, t)!,
    );
  }
}
