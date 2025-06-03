import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'package:cus_theme/cus_theme.dart';

void main() {
  group('AppTheme Tests', () {
    test('AppTheme creates light theme by default', () {
      final appTheme = AppTheme();
      final theme = appTheme.themeData;
      
      expect(theme.brightness, equals(Brightness.light));
      expect(theme.colorScheme.primary, equals(const Color(0xFF6200EE)));
    });
    
    test('AppTheme creates dark theme when specified', () {
      final appTheme = AppTheme(isDarkMode: true);
      final theme = appTheme.themeData;
      
      expect(theme.brightness, equals(Brightness.dark));
      expect(theme.colorScheme.primary, equals(const Color(0xFFBB86FC)));
    });
    
    test('AppTheme uses custom primary color when provided', () {
      final customColor = Colors.orange;
      final appTheme = AppTheme(primaryColor: customColor);
      final theme = appTheme.themeData;
      
      expect(theme.colorScheme.primary, equals(customColor));
    });
    
    test('AppTheme uses custom secondary color when provided', () {
      final customColor = Colors.pink;
      final appTheme = AppTheme(secondaryColor: customColor);
      final theme = appTheme.themeData;
      
      expect(theme.colorScheme.secondary, equals(customColor));
    });
    
    test('AppTheme respects font scaling factor', () {
      const scaleFactor = 1.2;
      final appTheme = AppTheme(fontScaleFactor: scaleFactor);
      final theme = appTheme.themeData;
      
      // The base size of bodyLarge is fontSizeMedium (16)
      final expectedSize = ThemeConstants.fontSizeMedium * scaleFactor;
      expect(theme.textTheme.bodyLarge?.fontSize, closeTo(expectedSize, 0.1));
    });
    
    test('AppTheme copyWith method works correctly', () {
      final originalTheme = AppTheme(isDarkMode: false);
      final copiedTheme = originalTheme.copyWith(isDarkMode: true);
      
      expect(originalTheme.isDarkMode, isFalse);
      expect(copiedTheme.isDarkMode, isTrue);
    });
  });
  
  group('ThemeColors Tests', () {
    test('Light color scheme has correct properties', () {
      final colorScheme = ThemeColors.lightColorScheme;
      
      expect(colorScheme.brightness, equals(Brightness.light));
      expect(colorScheme.primary, equals(ThemeColors.primaryPurple));
      expect(colorScheme.background, equals(ThemeColors.white));
    });
    
    test('Dark color scheme has correct properties', () {
      final colorScheme = ThemeColors.darkColorScheme;
      
      expect(colorScheme.brightness, equals(Brightness.dark));
      expect(colorScheme.primary, equals(ThemeColors.primaryPurpleLight));
      expect(colorScheme.background, equals(ThemeColors.darkBackground));
    });
    
    test('Preset themes contain expected themes', () {
      expect(ThemeColors.presetThemes.containsKey('default'), isTrue);
      expect(ThemeColors.presetThemes.containsKey('dark'), isTrue);
      expect(ThemeColors.presetThemes.containsKey('blue'), isTrue);
    });
    
    test('Surface elevation function returns appropriate colors', () {
      final elevation0 = ThemeColors.getSurfaceElevation(0);
      final elevation1 = ThemeColors.getSurfaceElevation(1);
      
      expect(elevation0, equals(ThemeColors.darkBackground));
      expect(elevation1, equals(ThemeColors.darkElevation1));
    });
  });
  
  group('ThemeText Tests', () {
    test('Text theme contains all necessary styles', () {
      final textTheme = ThemeText.textTheme;
      
      expect(textTheme.displayLarge, isNotNull);
      expect(textTheme.bodyMedium, isNotNull);
      expect(textTheme.labelSmall, isNotNull);
    });
    
    test('Text styles have correct sizes', () {
      final textTheme = ThemeText.textTheme;
      
      expect(textTheme.displayLarge?.fontSize, equals(ThemeConstants.fontSizeHeading1));
      expect(textTheme.bodyMedium?.fontSize, equals(ThemeConstants.fontSizeRegular));
    });
    
    test('Helper methods work correctly', () {
      final baseStyle = ThemeText.textTheme.bodyMedium!;
      
      final boldStyle = ThemeText.bold(baseStyle);
      expect(boldStyle.fontWeight, equals(ThemeConstants.fontWeightBold));
      
      final coloredStyle = ThemeText.withColor(baseStyle, Colors.red);
      expect(coloredStyle.color, equals(Colors.red));
    });
    
    test('Themed text theme applies colors correctly', () {
      final baseTheme = ThemeText.textTheme;
      final themedLight = ThemeText.getThemedTextTheme(baseTheme, false);
      
      expect(themedLight.bodyLarge?.color, equals(ThemeText.lightThemeHighEmphasisColor));
    });
  });
  
  group('CustomThemeExtension Tests', () {
    test('Light theme extension has correct values', () {
      final extension = CustomThemeExtension.light;
      
      expect(extension.cardColor, equals(Colors.white));
      expect(extension.success, equals(const Color(0xFF4CAF50)));
    });
    
    test('Dark theme extension has correct values', () {
      final extension = CustomThemeExtension.dark;
      
      expect(extension.cardColor, equals(const Color(0xFF222222)));
      expect(extension.success, equals(const Color(0xFF66BB6A)));
    });
    
    test('Extension lerp function works correctly', () {
      final extension1 = CustomThemeExtension.light;
      final extension2 = CustomThemeExtension.dark;
      
      final lerpResult = extension1.lerp(extension2, 0.5) as CustomThemeExtension;
      
      // Check if color is between light and dark values
      final expectedColor = Color.lerp(extension1.cardColor, extension2.cardColor, 0.5);
      expect(lerpResult.cardColor, equals(expectedColor));
    });
    
    test('Helper methods return expected values', () {
      final extension = CustomThemeExtension.light;
      
      final shadows = extension.getShadows(2.0);
      expect(shadows.length, equals(1));
      
      final cardDecoration = extension.getCardDecoration(isHovered: true);
      expect(cardDecoration.color, equals(extension.cardHoverColor));
    });
  });
  
  group('ThemeConstants Tests', () {
    test('Spacing constants are defined correctly', () {
      expect(ThemeConstants.spacing8, equals(8.0));
      expect(ThemeConstants.spacing16, equals(16.0));
    });
    
    test('Radius constants are defined correctly', () {
      expect(ThemeConstants.radiusSmall, equals(4.0));
      expect(ThemeConstants.radiusMedium, equals(8.0));
    });
    
    test('Padding constants create correct EdgeInsets', () {
      expect(ThemeConstants.paddingMedium, equals(const EdgeInsets.all(16.0)));
      expect(ThemeConstants.paddingHorizontalMedium, 
          equals(const EdgeInsets.symmetric(horizontal: 16.0)));
    });
    
    test('Font size constants are defined correctly', () {
      expect(ThemeConstants.fontSizeRegular, equals(14.0));
      expect(ThemeConstants.fontSizeMedium, equals(16.0));
    });
    
    test('Font weight constants are defined correctly', () {
      expect(ThemeConstants.fontWeightRegular, equals(FontWeight.w400));
      expect(ThemeConstants.fontWeightBold, equals(FontWeight.w700));
    });
  });
  
  group('ThemeProvider Tests', () {
    late ThemeProvider provider;
    
    setUp(() {
      SharedPreferences.setMockInitialValues({});
      provider = ThemeProvider();
    });
    
    test('ThemeProvider initializes with default values', () {
      expect(provider.isDarkMode, isFalse);
      expect(provider.primaryColor, isNull);
      expect(provider.fontScaleFactor, equals(1.0));
    });
    
    test('ThemeProvider toggle theme works', () {
      expect(provider.isDarkMode, isFalse);
      provider.toggleTheme();
      expect(provider.isDarkMode, isTrue);
    });
    
    test('ThemeProvider set primary color works', () {
      expect(provider.primaryColor, isNull);
      provider.setPrimaryColor(Colors.red);
      expect(provider.primaryColor, equals(Colors.red));
      expect(provider.currentThemePreset, equals('custom'));
    });
    
    test('ThemeProvider theme preset application works', () {
      provider.applyThemePreset('blue');
      expect(provider.currentThemePreset, equals('blue'));
      expect(provider.primaryColor, isNotNull);
    });
    
    test('ThemeProvider reset to defaults works', () {
      provider.setPrimaryColor(Colors.red);
      provider.setDarkMode(true);
      
      provider.resetToDefaults();
      
      expect(provider.isDarkMode, isFalse);
      expect(provider.primaryColor, isNull);
      expect(provider.currentThemePreset, equals('default'));
    });
  });
  
  group('Widget Integration Tests', () {
    testWidgets('ThemeBuilder provides correct theme to widgets', 
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().themeData,
          home: Builder(
            builder: (context) => themeBuilder(
              context: context,
              builder: (theme, customTheme) => Text(
                'Test',
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
        ),
      );
      
      final textFinder = find.text('Test');
      expect(textFinder, findsOneWidget);
    });
    
    testWidgets('wrapWithThemeProvider works correctly', 
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      
      // Add a key to uniquely identify our Builder
      const builderKey = Key('test_builder');
      
      await tester.pumpWidget(
        wrapWithThemeProvider(
          initialDarkMode: true,
          child: Builder(
            key: builderKey,
            builder: (context) => MaterialApp(
              theme: Provider.of<ThemeProvider>(context).themeData,
              home: const Scaffold(body: Text('Test')),
            ),
          ),
        ),
      );
      
      // Allow initialization to complete
      await tester.pumpAndSettle();
      
      // Check if the provider has dark mode set using the specific key
      final provider = tester.element(find.byKey(builderKey)).read<ThemeProvider>();
      expect(provider.isDarkMode, isTrue);
      
      // Check if the theme has dark brightness
      final scaffoldContext = tester.element(find.byType(Scaffold));
      final theme = Theme.of(scaffoldContext);
      expect(theme.brightness, equals(Brightness.dark));
    });
    
    testWidgets('Context extensions work correctly', 
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      
      late BuildContext savedContext;
      
      await tester.pumpWidget(
        wrapWithThemeProvider(
          child: Builder(
            builder: (context) {
              savedContext = context;
              return MaterialApp(
                theme: Provider.of<ThemeProvider>(context).themeData,
                home: const Scaffold(body: Text('Test')),
              );
            },
          ),
        ),
      );
      
      // Allow initialization to complete
      await tester.pumpAndSettle();
      
      // Get the provider directly
      final provider = Provider.of<ThemeProvider>(savedContext, listen: false);
      expect(provider.isDarkMode, isFalse);
      
      // Test toggling the theme
      savedContext.toggleTheme();
      
      // Check provider state directly - this should change immediately
      expect(provider.isDarkMode, isTrue);
      
      // Rebuild the widget tree to reflect changes
      await tester.pumpAndSettle();
      
      // Now the context isDarkMode should reflect the change
      expect(savedContext.isDarkMode, isTrue);
    });
  });
}
