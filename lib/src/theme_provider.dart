import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_theme.dart';
import 'theme_colors.dart';

/// A provider class that manages theme settings and notifies listeners of changes.
class ThemeProvider extends ChangeNotifier {
  // Theme state
  bool _isDarkMode = false;
  Color? _primaryColor;
  Color? _secondaryColor;
  bool _useTextScaling = true;
  double _fontScaleFactor = 1.0;
  String _currentThemePreset = 'default';
  
  // Constants for storage keys
  static const String _darkModeKey = 'theme_dark_mode';
  static const String _primaryColorKey = 'theme_primary_color';
  static const String _secondaryColorKey = 'theme_secondary_color';
  static const String _useTextScalingKey = 'theme_use_text_scaling';
  static const String _fontScaleFactorKey = 'theme_font_scale_factor';
  static const String _themePresetKey = 'theme_preset';
  
  // Getters
  bool get isDarkMode => _isDarkMode;
  Color? get primaryColor => _primaryColor;
  Color? get secondaryColor => _secondaryColor;
  bool get useTextScaling => _useTextScaling;
  double get fontScaleFactor => _fontScaleFactor;
  String get currentThemePreset => _currentThemePreset;
  
  /// Get the current theme data based on settings
  ThemeData get themeData => AppTheme(
    isDarkMode: _isDarkMode,
    primaryColor: _primaryColor,
    secondaryColor: _secondaryColor,
    useTextScaling: _useTextScaling,
    fontScaleFactor: _fontScaleFactor,
  ).themeData;
  
  /// Initialize the provider and load saved preferences
  Future<void> initialize() async {
    await loadPreferences();
  }
  
  /// Load saved theme preferences from local storage
  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    
    _isDarkMode = prefs.getBool(_darkModeKey) ?? false;
    
    final primaryColorValue = prefs.getInt(_primaryColorKey);
    _primaryColor = primaryColorValue != null ? Color(primaryColorValue) : null;
    
    final secondaryColorValue = prefs.getInt(_secondaryColorKey);
    _secondaryColor = secondaryColorValue != null ? Color(secondaryColorValue) : null;
    
    _useTextScaling = prefs.getBool(_useTextScalingKey) ?? true;
    _fontScaleFactor = prefs.getDouble(_fontScaleFactorKey) ?? 1.0;
    _currentThemePreset = prefs.getString(_themePresetKey) ?? 'default';
    
    notifyListeners();
  }
  
  /// Save current theme preferences to local storage
  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    
    await prefs.setBool(_darkModeKey, _isDarkMode);
    
    if (_primaryColor != null) {
      await prefs.setInt(_primaryColorKey, _primaryColor!.value);
    } else {
      await prefs.remove(_primaryColorKey);
    }
    
    if (_secondaryColor != null) {
      await prefs.setInt(_secondaryColorKey, _secondaryColor!.value);
    } else {
      await prefs.remove(_secondaryColorKey);
    }
    
    await prefs.setBool(_useTextScalingKey, _useTextScaling);
    await prefs.setDouble(_fontScaleFactorKey, _fontScaleFactor);
    await prefs.setString(_themePresetKey, _currentThemePreset);
  }
  
  /// Toggle between light and dark mode
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _savePreferences();
    notifyListeners();
  }
  
  /// Set dark mode explicitly
  void setDarkMode(bool value) {
    if (_isDarkMode != value) {
      _isDarkMode = value;
      _savePreferences();
      notifyListeners();
    }
  }
  
  /// Set a custom primary color
  void setPrimaryColor(Color? color) {
    if (_primaryColor != color) {
      _primaryColor = color;
      _currentThemePreset = 'custom';
      _savePreferences();
      notifyListeners();
    }
  }
  
  /// Set a custom secondary color
  void setSecondaryColor(Color? color) {
    if (_secondaryColor != color) {
      _secondaryColor = color;
      _currentThemePreset = 'custom';
      _savePreferences();
      notifyListeners();
    }
  }
  
  /// Set text scaling preference
  void setUseTextScaling(bool value) {
    if (_useTextScaling != value) {
      _useTextScaling = value;
      _savePreferences();
      notifyListeners();
    }
  }
  
  /// Set font scale factor
  void setFontScaleFactor(double value) {
    if (_fontScaleFactor != value) {
      _fontScaleFactor = value.clamp(0.8, 1.4); // Reasonable limits
      _savePreferences();
      notifyListeners();
    }
  }
  
  /// Apply a predefined theme preset
  void applyThemePreset(String presetName) {
    if (!ThemeColors.presetThemes.containsKey(presetName) && presetName != 'custom') {
      return; // Invalid preset name
    }
    
    _currentThemePreset = presetName;
    
    if (presetName == 'custom') {
      // Keep current custom colors
    } else if (presetName == 'default') {
      // Use default theme colors
      _primaryColor = null;
      _secondaryColor = null;
    } else {
      // Apply preset colors
      final colorScheme = ThemeColors.presetThemes[presetName]!
;      _primaryColor = colorScheme.primary;
      _secondaryColor = colorScheme.secondary;
    }
    
    _savePreferences();
    notifyListeners();
  }
  
  /// Reset all theme settings to defaults
  void resetToDefaults() {
    _isDarkMode = false;
    _primaryColor = null;
    _secondaryColor = null;
    _useTextScaling = true;
    _fontScaleFactor = 1.0;
    _currentThemePreset = 'default';
    
    _savePreferences();
    notifyListeners();
  }
  
  /// Get a list of all available theme presets
  List<String> get availableThemePresets => [
    'default',
    ...ThemeColors.presetThemes.keys.where((key) => key != 'default' && key != 'dark'),
    'custom',
  ];
  
  /// Check if current theme matches a specific preset
  bool isUsingPreset(String presetName) {
    return _currentThemePreset == presetName;
  }
  
  /// Create a theme based on an image
  Future<void> createThemeFromImage(ImageProvider imageProvider) async {
    final colorScheme = await ThemeColors.colorSchemeFromImage(imageProvider);
    
    _primaryColor = colorScheme.primary;
    _secondaryColor = colorScheme.secondary;
    _currentThemePreset = 'custom';
    
    _savePreferences();
    notifyListeners();
  }
  
  /// Get a theme data with temporary changes without affecting the stored settings
  ThemeData getThemeWithOverrides({
    bool? isDarkMode,
    Color? primaryColor,
    Color? secondaryColor,
    bool? useTextScaling,
    double? fontScaleFactor,
  }) {
    return AppTheme(
      isDarkMode: isDarkMode ?? _isDarkMode,
      primaryColor: primaryColor ?? _primaryColor,
      secondaryColor: secondaryColor ?? _secondaryColor,
      useTextScaling: useTextScaling ?? _useTextScaling,
      fontScaleFactor: fontScaleFactor ?? _fontScaleFactor,
    ).themeData;
  }
}