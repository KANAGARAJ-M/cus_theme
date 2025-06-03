import 'package:flutter/material.dart';

/// A class that provides color schemes and color utilities for the app theme.
class ThemeColors {
  // Primary brand colors
  static const Color primaryPurple = Color(0xFF6200EE);
  static const Color primaryPurpleLight = Color(0xFFBB86FC);
  static const Color primaryTeal = Color(0xFF03DAC6);
  static const Color errorRed = Color(0xFFB00020);
  static const Color errorRedDark = Color(0xFFCF6679);
  
  // Neutral colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);
  
  // Background colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkElevation1 = Color(0xFF2A2A2A);
  static const Color darkElevation2 = Color(0xFF323232);
  static const Color darkElevation3 = Color(0xFF3A3A3A);
  
  // Light theme colors
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primaryPurple,
    onPrimary: white,
    primaryContainer: Color(0xFFEADDFF),
    onPrimaryContainer: Color(0xFF21005E),
    secondary: primaryTeal,
    onSecondary: black,
    secondaryContainer: Color(0xFFCEFAF8),
    onSecondaryContainer: Color(0xFF00504C),
    tertiary: Color(0xFFB15A00),
    onTertiary: white,
    tertiaryContainer: Color(0xFFFFDCC7),
    onTertiaryContainer: Color(0xFF3A1A00),
    error: errorRed,
    onError: white,
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    background: white,
    onBackground: black,
    surface: white,
    onSurface: black,
    surfaceVariant: Color(0xFFE7E0EB),
    onSurfaceVariant: Color(0xFF49454E),
    outline: Color(0xFF7A757F),
    outlineVariant: Color(0xFFCAC4CF),
    shadow: Color(0x66000000),
    scrim: Color(0x33000000),
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: primaryPurpleLight,
    surfaceTint: primaryPurple,
  );

  // Dark theme colors
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryPurpleLight,
    onPrimary: Color(0xFF381E72),
    primaryContainer: Color(0xFF4F378B),
    onPrimaryContainer: Color(0xFFEADDFF),
    secondary: primaryTeal,
    onSecondary: Color(0xFF00504C),
    secondaryContainer: Color(0xFF00726C),
    onSecondaryContainer: Color(0xFFCEFAF8),
    tertiary: Color(0xFFFFB77C),
    onTertiary: Color(0xFF5C2A00),
    tertiaryContainer: Color(0xFF833F00),
    onTertiaryContainer: Color(0xFFFFDCC7),
    error: errorRedDark,
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    background: darkBackground,
    onBackground: white,
    surface: darkBackground,
    onSurface: white,
    surfaceVariant: Color(0xFF49454E),
    onSurfaceVariant: Color(0xFFCAC4CF),
    outline: Color(0xFF948F99),
    outlineVariant: Color(0xFF49454E),
    shadow: Color(0x66000000),
    scrim: Color(0x33000000),
    inverseSurface: Color(0xFFE6E0E9),
    onInverseSurface: Color(0xFF313033),
    inversePrimary: primaryPurple,
    surfaceTint: primaryPurpleLight,
  );
  
  // Semantic/functional colors
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color warningAmber = Color(0xFFFFC107);
  static const Color infoBlue = Color(0xFF2196F3);
  
  // Surface colors with different elevations for dark theme
  static Color getSurfaceElevation(int elevation) {
    switch (elevation) {
      case 0:
        return darkBackground;
      case 1:
        return darkElevation1;
      case 2:
        return darkElevation2;
      case 3:
        return darkElevation3;
      default:
        // For higher elevations, add more white overlay
        final int overlay = (4 + elevation) * 2;
        return Color.alphaBlend(white.withOpacity(overlay / 100), darkBackground);
    }
  }
  
  // Theme color presets
  static final Map<String, ColorScheme> presetThemes = {
    'default': lightColorScheme,
    'dark': darkColorScheme,
    'purple': _getCustomColorScheme(const Color(0xFF6200EE)),
    'blue': _getCustomColorScheme(const Color(0xFF2196F3)),
    'green': _getCustomColorScheme(const Color(0xFF4CAF50)),
    'orange': _getCustomColorScheme(const Color(0xFFFF9800)),
    'red': _getCustomColorScheme(const Color(0xFFF44336)),
    'pink': _getCustomColorScheme(const Color(0xFFE91E63)),
    'teal': _getCustomColorScheme(const Color(0xFF009688)),
  };
  
  /// Creates a custom color scheme based on a primary color
  static ColorScheme _getCustomColorScheme(Color primaryColor) {
    return lightColorScheme.copyWith(
      primary: primaryColor,
      onPrimary: _getContrastingColor(primaryColor),
      primaryContainer: _lighten(primaryColor, 0.3),
      onPrimaryContainer: _darken(primaryColor, 0.5),
      secondary: _getComplementaryColor(primaryColor),
      surfaceTint: primaryColor,
    );
  }
  
  /// Gets the contrasting color (black or white) for text on a given background
  static Color _getContrastingColor(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5 ? black : white;
  }
  
  /// Lightens a color by the given amount
  static Color _lighten(Color color, double amount) {
    assert(amount >= 0 && amount <= 1);
    final HSLColor hsl = HSLColor.fromColor(color);
    return hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0)).toColor();
  }
  
  /// Darkens a color by the given amount
  static Color _darken(Color color, double amount) {
    assert(amount >= 0 && amount <= 1);
    final HSLColor hsl = HSLColor.fromColor(color);
    return hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0)).toColor();
  }
  
  /// Gets a color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
  
  /// Gets a complementary color
  static Color _getComplementaryColor(Color color) {
    final HSLColor hsl = HSLColor.fromColor(color);
    return HSLColor.fromAHSL(
      hsl.alpha,
      (hsl.hue + 180) % 360, // Complementary hue
      hsl.saturation,
      1 - hsl.lightness * 0.7, // Adjust lightness
    ).toColor();
  }
  
  /// Creates a dynamically generated color scheme based on an image
  static Future<ColorScheme> colorSchemeFromImage(ImageProvider imageProvider) async {
    // This is a placeholder for the actual implementation
    // In a real app, you would use packages like palette_generator
    // to extract colors from the image
    
    // Return the default scheme for now
    return lightColorScheme;
    
    // Example implementation with palette_generator would be:
    // final PaletteGenerator palette = await PaletteGenerator.fromImageProvider(imageProvider);
    // final Color primary = palette.dominantColor?.color ?? primaryPurple;
    // return _getCustomColorScheme(primary);
  }
  
  /// Gets a gradient based on the primary and secondary colors
  static LinearGradient getPrimaryGradient(ColorScheme colorScheme) {
    return LinearGradient(
      colors: [colorScheme.primary, colorScheme.secondary],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
  
  /// Creates a darker variant of a color scheme for status bar coloring
  static Color getStatusBarColor(ColorScheme colorScheme) {
    return colorScheme.brightness == Brightness.dark
        ? _darken(colorScheme.surface, 0.1)
        : colorScheme.surface;
  }
}