/// Custom Theme Package
///
/// A Flutter package that provides a customizable theme system for your applications.
/// Features include pre-configured light and dark themes, custom color schemes,
/// consistent text styles, and easy theme switching capabilities.
library cus_theme;

// Core theme components
export 'src/app_theme.dart';
export 'src/theme_colors.dart';
export 'src/theme_text.dart';
export 'src/theme_extensions.dart';
export 'src/theme_constants.dart';
export 'src/theme_provider.dart';

import 'package:flutter/material.dart';
import 'src/app_theme.dart';
import 'src/theme_provider.dart';
import 'src/theme_extensions.dart';
import 'package:provider/provider.dart';

/// Convenience methods for working with cus_theme package

/// Returns the active [AppTheme] from the provided BuildContext
AppTheme getAppTheme(BuildContext context) {
  return Provider.of<ThemeProvider>(context, listen: false)
      .isDarkMode ? AppTheme(isDarkMode: true) : AppTheme();
}

/// Returns the current [ThemeData] from the provided BuildContext
ThemeData getCurrentTheme(BuildContext context) {
  return Theme.of(context);
}

/// Returns the custom theme extension from the provided BuildContext
CustomThemeExtension getCustomTheme(BuildContext context) {
  return CustomThemeExtension.of(context);
}

/// Creates a ThemeProvider and wraps your app with it
Widget wrapWithThemeProvider({
  required Widget child,
  bool initialDarkMode = false,
  Color? initialPrimaryColor,
  Color? initialSecondaryColor,
}) {
  return FutureBuilder(
    future: () async {
      final provider = ThemeProvider();
      await provider.initialize();
      // Apply the initial settings after initialization
      if (initialDarkMode != provider.isDarkMode) {
        provider.setDarkMode(initialDarkMode);
      }
      if (initialPrimaryColor != null) {
        provider.setPrimaryColor(initialPrimaryColor);
      }
      if (initialSecondaryColor != null) {
        provider.setSecondaryColor(initialSecondaryColor);
      }
      return provider;
    }(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
        return ChangeNotifierProvider<ThemeProvider>.value(
          value: snapshot.data as ThemeProvider,
          child: child,
        );
      }
      return MaterialApp(
        theme: AppTheme(
          isDarkMode: initialDarkMode,
          primaryColor: initialPrimaryColor,
          secondaryColor: initialSecondaryColor,
        ).themeData,
        home: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    },
  );
}

/// Builder that rebuilds when theme changes
Widget themeBuilder({
  required BuildContext context,
  required Widget Function(ThemeData theme, CustomThemeExtension customTheme) builder,
}) {
  final theme = Theme.of(context);
  final customTheme = CustomThemeExtension.of(context);
  
  return builder(theme, customTheme);
}

/// Toggle theme extension methods
extension ThemeContextExtension on BuildContext {
  /// Toggle between light and dark mode
  void toggleTheme() {
    Provider.of<ThemeProvider>(this, listen: false).toggleTheme();
  }
  
  /// Set dark mode explicitly
  void setDarkMode(bool isDark) {
    Provider.of<ThemeProvider>(this, listen: false).setDarkMode(isDark);
  }
  
  /// Set custom primary color
  void setPrimaryColor(Color? color) {
    Provider.of<ThemeProvider>(this, listen: false).setPrimaryColor(color);
  }
  
  /// Set custom secondary color
  void setSecondaryColor(Color? color) {
    Provider.of<ThemeProvider>(this, listen: false).setSecondaryColor(color);
  }
  
  /// Apply a predefined theme preset
  void applyThemePreset(String presetName) {
    Provider.of<ThemeProvider>(this, listen: false).applyThemePreset(presetName);
  }
  
  /// Get the ThemeProvider
  ThemeProvider get themeProvider => Provider.of<ThemeProvider>(this, listen: false);
  
  /// Get current theme data
  ThemeData get theme => Theme.of(this);
  
  /// Get custom theme extension
  CustomThemeExtension get customTheme => CustomThemeExtension.of(this);
  
  /// Check if theme is dark mode
  bool get isDarkMode => Provider.of<ThemeProvider>(this, listen: false).isDarkMode;
}