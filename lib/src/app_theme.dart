import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme_colors.dart';
import 'theme_text.dart';
import 'theme_extensions.dart';
import 'theme_constants.dart';

/// A comprehensive theme manager that provides customizable theming capabilities.
class AppTheme {
  /// Whether to use dark mode theming
  final bool isDarkMode;
  
  /// Optional custom primary color that overrides the default color scheme
  final Color? primaryColor;
  
  /// Optional custom secondary color that overrides the default color scheme
  final Color? secondaryColor;
  
  /// Whether to enable font size scaling based on device settings
  final bool useTextScaling;
  
  /// Font scale factor (1.0 is default scale)
  final double fontScaleFactor;

  /// Creates an AppTheme instance
  /// 
  /// [isDarkMode] determines whether to use dark or light theming
  /// [primaryColor] optionally overrides the default primary color
  /// [secondaryColor] optionally overrides the default secondary color
  /// [useTextScaling] determines whether to use device text scaling
  /// [fontScaleFactor] allows manual control of text scaling
  AppTheme({
    this.isDarkMode = false,
    this.primaryColor,
    this.secondaryColor,
    this.useTextScaling = true,
    this.fontScaleFactor = 1.0,
  });

  /// Gets the appropriate theme based on current settings
  ThemeData get themeData {
    return isDarkMode ? _darkTheme : _lightTheme;
  }

  /// Creates a copy of this AppTheme with the given fields replaced
  AppTheme copyWith({
    bool? isDarkMode,
    Color? primaryColor,
    Color? secondaryColor,
    bool? useTextScaling,
    double? fontScaleFactor,
  }) {
    return AppTheme(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      useTextScaling: useTextScaling ?? this.useTextScaling,
      fontScaleFactor: fontScaleFactor ?? this.fontScaleFactor,
    );
  }

  /// Light theme configuration
  ThemeData get _lightTheme {
    final ColorScheme colorScheme = _getColorScheme(ThemeColors.lightColorScheme);
    final TextTheme scaledTextTheme = _getScaledTextTheme(ThemeText.textTheme);
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      textTheme: scaledTextTheme,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.background,
      
      // AppBar theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
      ),
      
      // Card theme
      cardTheme: CardThemeData(
        elevation: ThemeConstants.elevationSmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
        ),
        margin: ThemeConstants.paddingSmall,
        clipBehavior: Clip.antiAlias,
      ),
      
      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: ThemeConstants.spacing16, 
            horizontal: ThemeConstants.spacing24,
          ),
          minimumSize: const Size(88, 48),
        ),
      ),
      
      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: ThemeConstants.spacing8, 
            horizontal: ThemeConstants.spacing16,
          ),
        ),
      ),
      
      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: ThemeConstants.spacing16, 
            horizontal: ThemeConstants.spacing24,
          ),
        ),
      ),
      
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        contentPadding: ThemeConstants.paddingMedium,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        errorStyle: scaledTextTheme.bodySmall?.copyWith(color: colorScheme.error),
        labelStyle: scaledTextTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant),
        hintStyle: scaledTextTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant.withOpacity(0.7)),
      ),
      
      // Checkbox theme
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusSmall),
        ),
      ),
      
      // Radio theme
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
      ),
      
      // Switch theme
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary.withOpacity(0.5);
          }
          return null;
        }),
      ),
      
      // Dialog theme
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        elevation: ThemeConstants.elevationMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusLarge),
        ),
      ),
      
      // Bottom sheet theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        elevation: ThemeConstants.elevationMedium,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(ThemeConstants.radiusLarge),
          ),
        ),
        modalElevation: ThemeConstants.elevationLarge,
        modalBackgroundColor: colorScheme.surface,
      ),
      
      // Snackbar theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: scaledTextTheme.bodyMedium?.copyWith(
          color: colorScheme.onInverseSurface,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
        ),
        actionTextColor: colorScheme.inversePrimary,
      ),
      
      // Tab bar theme
      tabBarTheme: TabBarThemeData(
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 2.0,
            color: colorScheme.primary,
          ),
        ),
      ),
      
      // Divider theme
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: ThemeConstants.spacing16,
      ),
      
      // List tile theme
      listTileTheme: ListTileThemeData(
        contentPadding: ThemeConstants.paddingHorizontalMedium,
        horizontalTitleGap: ThemeConstants.spacing16,
        minLeadingWidth: 24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
        ),
      ),
      
      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusCircular),
        ),
      ),
      
      // Navigation bar theme
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.primary.withOpacity(0.2),
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return scaledTextTheme.labelMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
            );
          }
          return scaledTextTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          );
        }),
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return IconThemeData(color: colorScheme.primary);
          }
          return IconThemeData(color: colorScheme.onSurfaceVariant);
        }),
      ),
      
      // Slider theme
      sliderTheme: SliderThemeData(
        activeTrackColor: colorScheme.primary,
        inactiveTrackColor: colorScheme.primary.withOpacity(0.3),
        thumbColor: colorScheme.primary,
        overlayColor: colorScheme.primary.withOpacity(0.2),
        tickMarkShape: const RoundSliderTickMarkShape(),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
        trackHeight: 4,
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorColor: colorScheme.primary,
        valueIndicatorTextStyle: scaledTextTheme.bodySmall?.copyWith(
          color: colorScheme.onPrimary,
        ),
      ),
      
      // Popup menu theme
      popupMenuTheme: PopupMenuThemeData(
        color: colorScheme.surface,
        elevation: ThemeConstants.elevationMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
        ),
        textStyle: scaledTextTheme.bodyMedium,
      ),
      
      // Custom theme extensions
      extensions: <ThemeExtension<dynamic>>[
        CustomThemeExtension.light,
      ],
    );
  }

  /// Dark theme configuration
  ThemeData get _darkTheme {
    final ColorScheme colorScheme = _getColorScheme(ThemeColors.darkColorScheme);
    final TextTheme scaledTextTheme = _getScaledTextTheme(ThemeText.textTheme);
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      textTheme: scaledTextTheme,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.background,
      
      // AppBar theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
      ),
      
      // Card theme
      cardTheme: CardThemeData(
        elevation: ThemeConstants.elevationSmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
        ),
        margin: ThemeConstants.paddingSmall,
        clipBehavior: Clip.antiAlias,
      ),
      
      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: ThemeConstants.spacing16, 
            horizontal: ThemeConstants.spacing24,
          ),
          minimumSize: const Size(88, 48),
        ),
      ),
      
      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: ThemeConstants.spacing8, 
            horizontal: ThemeConstants.spacing16,
          ),
        ),
      ),
      
      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: ThemeConstants.spacing16, 
            horizontal: ThemeConstants.spacing24,
          ),
        ),
      ),
      
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceVariant.withOpacity(0.5),
        contentPadding: ThemeConstants.paddingMedium,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        errorStyle: scaledTextTheme.bodySmall?.copyWith(color: colorScheme.error),
        labelStyle: scaledTextTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant),
        hintStyle: scaledTextTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant.withOpacity(0.7)),
      ),
      
      // Checkbox theme
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusSmall),
        ),
      ),
      
      // Radio theme
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
      ),
      
      // Switch theme
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary.withOpacity(0.5);
          }
          return null;
        }),
      ),
      
      // Dialog theme
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        elevation: ThemeConstants.elevationMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusLarge),
        ),
      ),
      
      // Bottom sheet theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        elevation: ThemeConstants.elevationMedium,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(ThemeConstants.radiusLarge),
          ),
        ),
        modalElevation: ThemeConstants.elevationLarge,
        modalBackgroundColor: colorScheme.surface,
      ),
      
      // Snackbar theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: scaledTextTheme.bodyMedium?.copyWith(
          color: colorScheme.onInverseSurface,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
        ),
        actionTextColor: colorScheme.inversePrimary,
      ),
      
      // Tab bar theme
      tabBarTheme: TabBarThemeData(
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 2.0,
            color: colorScheme.primary,
          ),
        ),
      ),
      
      // Divider theme
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: ThemeConstants.spacing16,
      ),
      
      // List tile theme
      listTileTheme: ListTileThemeData(
        contentPadding: ThemeConstants.paddingHorizontalMedium,
        horizontalTitleGap: ThemeConstants.spacing16,
        minLeadingWidth: 24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
        ),
      ),
      
      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusCircular),
        ),
      ),
      
      // Navigation bar theme
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.primary.withOpacity(0.2),
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return scaledTextTheme.labelMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
            );
          }
          return scaledTextTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          );
        }),
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return IconThemeData(color: colorScheme.primary);
          }
          return IconThemeData(color: colorScheme.onSurfaceVariant);
        }),
      ),
      
      // Slider theme
      sliderTheme: SliderThemeData(
        activeTrackColor: colorScheme.primary,
        inactiveTrackColor: colorScheme.primary.withOpacity(0.3),
        thumbColor: colorScheme.primary,
        overlayColor: colorScheme.primary.withOpacity(0.2),
        tickMarkShape: const RoundSliderTickMarkShape(),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
        trackHeight: 4,
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorColor: colorScheme.primary,
        valueIndicatorTextStyle: scaledTextTheme.bodySmall?.copyWith(
          color: colorScheme.onPrimary,
        ),
      ),
      
      // Popup menu theme
      popupMenuTheme: PopupMenuThemeData(
        color: colorScheme.surface,
        elevation: ThemeConstants.elevationMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.radiusMedium),
        ),
        textStyle: scaledTextTheme.bodyMedium,
      ),
      
      // Custom theme extensions
      extensions: <ThemeExtension<dynamic>>[
        CustomThemeExtension.dark,
      ],
    );
  }

  /// Applies custom colors to the color scheme if specified
  ColorScheme _getColorScheme(ColorScheme baseScheme) {
    if (primaryColor == null && secondaryColor == null) {
      return baseScheme;
    }
    
    return baseScheme.copyWith(
      primary: primaryColor ?? baseScheme.primary,
      secondary: secondaryColor ?? baseScheme.secondary,
    );
  }

  /// Applies text scaling to the text theme
  TextTheme _getScaledTextTheme(TextTheme baseTheme) {
    if (!useTextScaling || fontScaleFactor == 1.0) {
      return baseTheme;
    }
    
    return baseTheme.apply(
      fontSizeFactor: fontScaleFactor,
    );
  }
  
  /// Extension method to get CustomThemeExtension from BuildContext
  static CustomThemeExtension? customExtensionOf(BuildContext context) {
    return Theme.of(context).extension<CustomThemeExtension>();
  }
  
  /// Creates a ThemeData with a specific primary color but keeps all other settings
  static ThemeData withPrimaryColor(ThemeData base, Color primaryColor) {
    final ColorScheme updatedColorScheme = base.colorScheme.copyWith(
      primary: primaryColor,
      onPrimary: _contrastingColor(primaryColor),
    );
    
    return base.copyWith(
      colorScheme: updatedColorScheme,
      primaryColor: primaryColor,
    );
  }
  
  /// Determines a contrasting color for text visibility
  static Color _contrastingColor(Color backgroundColor) {
    // Calculate relative luminance
    final double luminance = backgroundColor.computeLuminance();
    // Return white for dark backgrounds, black for light backgrounds
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}