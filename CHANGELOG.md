## 1.8.1

* Upgraded to support Flutter 3.32.0
* Fixed deprecated API usage:
  * Replaced MaterialState with WidgetState
  * Replaced MaterialStateProperty with WidgetStateProperty
  * Replaced Color.withOpacity with Color.withAlpha for better precision
  * Replaced background/onBackground with surface/onSurface
  * Replaced surfaceVariant with surfaceContainerHighest
* Improved documentation for public API elements
* Enhanced example app with more comprehensive theme demonstrations
* Fixed various linting issues for better code quality

## 1.7.0

* Added custom theme presets system
* Implemented SharedPreferences for persistent theme settings
* Added extension methods for easier BuildContext-based theme access
* Improved theme switching animations

## 1.5.0

* Enhanced dark mode support with better contrast
* Added more semantic color options
* Improved Typography system with emphasis levels
* Added support for font scaling

## 1.2.0

* Introduced CustomThemeExtension for additional theme properties
* Added helper components like tags, badges, and ratings
* Improved card decoration system with hover/selected states
* Added support for gradients and animations

## 1.0.0

* First stable release
* Complete theme system with light and dark modes
* Comprehensive color schemes
* Typography system with text styles
* Spacing and sizing constants
* Theme provider for state management

## 0.0.1

* Initial release with:
  * Light and dark theme support
  * Custom color schemes
  * Text styling
  * Theme extensions for custom properties
  * Theme provider for state management
  * Spacing and sizing constants
