import 'package:flutter/material.dart';
import 'package:cus_theme/cus_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return wrapWithThemeProvider(
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Custom Theme Demo',
            theme: themeProvider.themeData,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key}); // Change {Key? key} to {super.key}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Demo'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ThemeConstants.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theme info section
            Text(
              'Current Theme',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: ThemeConstants.paddingMedium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mode: ${context.isDarkMode ? "Dark" : "Light"}'),
                    const SizedBox(height: 8),
                    Text('Primary color: ${context.theme.colorScheme.primary}'),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => context.toggleTheme(),
                          child: const Text('Toggle Theme'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Theme presets section
            Text(
              'Theme Presets',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final preset in context.themeProvider.availableThemePresets)
                  ElevatedButton(
                    onPressed: () => context.applyThemePreset(preset),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.themeProvider.isUsingPreset(preset) 
                          ? context.theme.colorScheme.primary 
                          : null,
                    ),
                    child: Text(preset),
                  ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Typography showcase
            Text(
              'Typography',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: ThemeConstants.paddingMedium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Display Large', style: Theme.of(context).textTheme.displayLarge),
                    Text('Display Medium', style: Theme.of(context).textTheme.displayMedium),
                    Text('Display Small', style: Theme.of(context).textTheme.displaySmall),
                    const Divider(),
                    Text('Headline Large', style: Theme.of(context).textTheme.headlineLarge),
                    Text('Headline Medium', style: Theme.of(context).textTheme.headlineMedium),
                    Text('Headline Small', style: Theme.of(context).textTheme.headlineSmall),
                    const Divider(),
                    Text('Title Large', style: Theme.of(context).textTheme.titleLarge),
                    Text('Title Medium', style: Theme.of(context).textTheme.titleMedium),
                    Text('Title Small', style: Theme.of(context).textTheme.titleSmall),
                    const Divider(),
                    Text('Body Large', style: Theme.of(context).textTheme.bodyLarge),
                    Text('Body Medium', style: Theme.of(context).textTheme.bodyMedium),
                    Text('Body Small', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Custom theme extensions
            Text(
              'Custom Extensions',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: ThemeConstants.paddingMedium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Custom colors and components:'),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        CustomThemeExtension.createTag(context, 'Tag'),
                        const SizedBox(width: 8),
                        CustomThemeExtension.createBadge(context, '5'),
                        const SizedBox(width: 16),
                        CustomThemeExtension.createRating(context, 4.5),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: context.customTheme.success,
                      child: Text(
                        'Success',
                        style: TextStyle(color: context.customTheme.onSuccess),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: context.customTheme.warning,
                      child: Text(
                        'Warning',
                        style: TextStyle(color: context.customTheme.onWarning),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: context.customTheme.info,
                      child: Text(
                        'Info',
                        style: TextStyle(color: context.customTheme.onInfo),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
