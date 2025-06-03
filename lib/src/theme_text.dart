import 'package:flutter/material.dart';
import 'theme_constants.dart';

/// A class that provides text styles and typography settings for the app theme.
class ThemeText {
  /// Primary font family used throughout the app
  static const String defaultFontFamily = 'Roboto';
  
  /// Secondary font family for accent elements (if needed)
  static const String accentFontFamily = 'Roboto';
  
  /// Default letter spacing for normal text
  static const double defaultLetterSpacing = 0.0;
  
  /// Base text theme used for both light and dark themes
  static const TextTheme textTheme = TextTheme(
    // Display styles
    displayLarge: TextStyle(
      fontSize: ThemeConstants.fontSizeHeading1,
      fontWeight: ThemeConstants.fontWeightBold,
      letterSpacing: -0.5,
      height: ThemeConstants.lineHeightTight,
    ),
    displayMedium: TextStyle(
      fontSize: ThemeConstants.fontSizeHeading2,
      fontWeight: ThemeConstants.fontWeightBold,
      letterSpacing: -0.25,
      height: ThemeConstants.lineHeightTight,
    ),
    displaySmall: TextStyle(
      fontSize: ThemeConstants.fontSizeHeading3,
      fontWeight: ThemeConstants.fontWeightBold,
      letterSpacing: 0.0,
      height: ThemeConstants.lineHeightTight,
    ),
    
    // Headline styles
    headlineLarge: TextStyle(
      fontSize: 22,
      fontWeight: ThemeConstants.fontWeightSemiBold,
      letterSpacing: 0.0,
      height: ThemeConstants.lineHeightTight,
    ),
    headlineMedium: TextStyle(
      fontSize: ThemeConstants.fontSizeXLarge,
      fontWeight: ThemeConstants.fontWeightSemiBold,
      letterSpacing: 0.15,
      height: ThemeConstants.lineHeightTight,
    ),
    headlineSmall: TextStyle(
      fontSize: ThemeConstants.fontSizeLarge,
      fontWeight: ThemeConstants.fontWeightSemiBold,
      letterSpacing: 0.15,
      height: ThemeConstants.lineHeightTight,
    ),
    
    // Title styles
    titleLarge: TextStyle(
      fontSize: ThemeConstants.fontSizeMedium,
      fontWeight: ThemeConstants.fontWeightSemiBold,
      letterSpacing: 0.15,
      height: ThemeConstants.lineHeightNormal,
    ),
    titleMedium: TextStyle(
      fontSize: ThemeConstants.fontSizeRegular,
      fontWeight: ThemeConstants.fontWeightSemiBold,
      letterSpacing: 0.1,
      height: ThemeConstants.lineHeightNormal,
    ),
    titleSmall: TextStyle(
      fontSize: ThemeConstants.fontSizeSmall,
      fontWeight: ThemeConstants.fontWeightSemiBold,
      letterSpacing: 0.1,
      height: ThemeConstants.lineHeightNormal,
    ),
    
    // Body styles
    bodyLarge: TextStyle(
      fontSize: ThemeConstants.fontSizeMedium,
      fontWeight: ThemeConstants.fontWeightRegular,
      letterSpacing: 0.15,
      height: ThemeConstants.lineHeightNormal,
    ),
    bodyMedium: TextStyle(
      fontSize: ThemeConstants.fontSizeRegular,
      fontWeight: ThemeConstants.fontWeightRegular,
      letterSpacing: 0.25,
      height: ThemeConstants.lineHeightNormal,
    ),
    bodySmall: TextStyle(
      fontSize: ThemeConstants.fontSizeSmall,
      fontWeight: ThemeConstants.fontWeightRegular,
      letterSpacing: 0.4,
      height: ThemeConstants.lineHeightNormal,
    ),
    
    // Label styles
    labelLarge: TextStyle(
      fontSize: ThemeConstants.fontSizeRegular,
      fontWeight: ThemeConstants.fontWeightMedium,
      letterSpacing: 0.1,
      height: ThemeConstants.lineHeightNormal,
    ),
    labelMedium: TextStyle(
      fontSize: ThemeConstants.fontSizeSmall,
      fontWeight: ThemeConstants.fontWeightMedium,
      letterSpacing: 0.5,
      height: ThemeConstants.lineHeightNormal,
    ),
    labelSmall: TextStyle(
      fontSize: ThemeConstants.fontSizeXSmall,
      fontWeight: ThemeConstants.fontWeightMedium,
      letterSpacing: 0.5,
      height: ThemeConstants.lineHeightNormal,
    ),
  );
  
  /// Special text styles not covered by standard TextTheme
  
  // Caption style for smaller text elements
  static const TextStyle captionText = TextStyle(
    fontSize: ThemeConstants.fontSizeXSmall,
    fontWeight: ThemeConstants.fontWeightRegular,
    letterSpacing: 0.4,
    height: ThemeConstants.lineHeightNormal,
  );
  
  // Overline style for section headers
  static const TextStyle overlineText = TextStyle(
    fontSize: ThemeConstants.fontSizeXSmall,
    fontWeight: ThemeConstants.fontWeightMedium,
    letterSpacing: 1.5,
    height: ThemeConstants.lineHeightNormal,
    textBaseline: TextBaseline.alphabetic,
  );
  
  // Button text style
  static const TextStyle buttonText = TextStyle(
    fontSize: ThemeConstants.fontSizeRegular,
    fontWeight: ThemeConstants.fontWeightMedium,
    letterSpacing: 0.5,
    height: ThemeConstants.lineHeightNormal,
  );
  
  // Link text style
  static TextStyle linkText(Color color) => TextStyle(
    fontSize: ThemeConstants.fontSizeRegular,
    fontWeight: ThemeConstants.fontWeightRegular,
    letterSpacing: 0.25,
    height: ThemeConstants.lineHeightNormal,
    color: color,
    decoration: TextDecoration.underline,
  );
  
  // Error text style
  static TextStyle errorText(Color color) => TextStyle(
    fontSize: ThemeConstants.fontSizeSmall,
    fontWeight: ThemeConstants.fontWeightRegular,
    letterSpacing: 0.25,
    height: ThemeConstants.lineHeightNormal,
    color: color,
  );
  
  /// Helper methods for common text style operations
  
  // Apply font family to all text styles in a theme
  static TextTheme applyFontFamily(TextTheme textTheme, String fontFamily) {
    return textTheme.apply(
      fontFamily: fontFamily,
    );
  }
  
  // Apply font scaling to accommodate device settings
  static TextTheme applyFontScaling(TextTheme textTheme, double scaleFactor) {
    return textTheme.apply(
      fontSizeFactor: scaleFactor,
    );
  }
  
  // Get text style with custom color
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }
  
  // Get text style with custom weight
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }
  
  // Get text style with custom size
  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }
  
  // Get a text style with a decorative line-through
  static TextStyle withStrikethrough(TextStyle style, Color color) {
    return style.copyWith(
      decoration: TextDecoration.lineThrough,
      decorationColor: color,
      decorationThickness: 1.5,
    );
  }
  
  // Get a bold version of a text style
  static TextStyle bold(TextStyle style) {
    return style.copyWith(fontWeight: ThemeConstants.fontWeightBold);
  }
  
  // Get an italic version of a text style
  static TextStyle italic(TextStyle style) {
    return style.copyWith(fontStyle: FontStyle.italic);
  }
  
  /// High-emphasis text for light theme (black with 87% opacity)
  static Color get lightThemeHighEmphasisColor => Colors.black.withOpacity(0.87);
  
  /// Medium-emphasis text for light theme (black with 60% opacity)
  static Color get lightThemeMediumEmphasisColor => Colors.black.withOpacity(0.60);
  
  /// Low-emphasis text for light theme (black with 38% opacity)
  static Color get lightThemeLowEmphasisColor => Colors.black.withOpacity(0.38);
  
  /// High-emphasis text for dark theme (white with 100% opacity)
  static Color get darkThemeHighEmphasisColor => Colors.white;
  
  /// Medium-emphasis text for dark theme (white with 70% opacity)
  static Color get darkThemeMediumEmphasisColor => Colors.white.withOpacity(0.70);
  
  /// Low-emphasis text for dark theme (white with 50% opacity)
  static Color get darkThemeLowEmphasisColor => Colors.white.withOpacity(0.50);
  
  /// Get a text theme with colors applied for light/dark mode
  static TextTheme getThemedTextTheme(TextTheme baseTheme, bool isDarkMode) {
    final highEmphasisColor = isDarkMode 
        ? darkThemeHighEmphasisColor 
        : lightThemeHighEmphasisColor;
    
    final mediumEmphasisColor = isDarkMode
        ? darkThemeMediumEmphasisColor
        : lightThemeMediumEmphasisColor;
    
    final lowEmphasisColor = isDarkMode
        ? darkThemeLowEmphasisColor
        : lightThemeLowEmphasisColor;
    
    return baseTheme.copyWith(
      displayLarge: baseTheme.displayLarge?.copyWith(color: highEmphasisColor),
      displayMedium: baseTheme.displayMedium?.copyWith(color: highEmphasisColor),
      displaySmall: baseTheme.displaySmall?.copyWith(color: highEmphasisColor),
      
      headlineLarge: baseTheme.headlineLarge?.copyWith(color: highEmphasisColor),
      headlineMedium: baseTheme.headlineMedium?.copyWith(color: highEmphasisColor),
      headlineSmall: baseTheme.headlineSmall?.copyWith(color: highEmphasisColor),
      
      titleLarge: baseTheme.titleLarge?.copyWith(color: highEmphasisColor),
      titleMedium: baseTheme.titleMedium?.copyWith(color: highEmphasisColor),
      titleSmall: baseTheme.titleSmall?.copyWith(color: highEmphasisColor),
      
      bodyLarge: baseTheme.bodyLarge?.copyWith(color: highEmphasisColor),
      bodyMedium: baseTheme.bodyMedium?.copyWith(color: highEmphasisColor),
      bodySmall: baseTheme.bodySmall?.copyWith(color: mediumEmphasisColor),
      
      labelLarge: baseTheme.labelLarge?.copyWith(color: highEmphasisColor),
      labelMedium: baseTheme.labelMedium?.copyWith(color: mediumEmphasisColor),
      labelSmall: baseTheme.labelSmall?.copyWith(color: lowEmphasisColor),
    );
  }
}