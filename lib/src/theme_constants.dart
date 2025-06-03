import 'package:flutter/material.dart';

/// Constants for spacing, sizing, and timing
class ThemeConstants {
  // Spacing
  static const double spacing0 = 0;
  static const double spacing2 = 2;
  static const double spacing4 = 4;
  static const double spacing8 = 8;
  static const double spacing12 = 12;
  static const double spacing16 = 16;
  static const double spacing20 = 20;
  static const double spacing24 = 24;
  static const double spacing32 = 32;
  static const double spacing40 = 40;
  static const double spacing48 = 48;
  static const double spacing56 = 56;
  static const double spacing64 = 64;

  // Border radius
  static const double radiusSmall = 4;
  static const double radiusMedium = 8;
  static const double radiusLarge = 16;
  static const double radiusExtraLarge = 24;
  static const double radiusCircular = 999;

  // Animation durations
  static const Duration durationFast = Duration(milliseconds: 200);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);

  // Elevation
  static const double elevationNone = 0;
  static const double elevationSmall = 2;
  static const double elevationMedium = 4;
  static const double elevationLarge = 8;

  // Common padding
  static const EdgeInsets paddingSmall = EdgeInsets.all(spacing8);
  static const EdgeInsets paddingMedium = EdgeInsets.all(spacing16);
  static const EdgeInsets paddingLarge = EdgeInsets.all(spacing24);
  
  // Common horizontal padding
  static const EdgeInsets paddingHorizontalSmall = EdgeInsets.symmetric(horizontal: spacing8);
  static const EdgeInsets paddingHorizontalMedium = EdgeInsets.symmetric(horizontal: spacing16);
  static const EdgeInsets paddingHorizontalLarge = EdgeInsets.symmetric(horizontal: spacing24);
  
  // Common vertical padding
  static const EdgeInsets paddingVerticalSmall = EdgeInsets.symmetric(vertical: spacing8);
  static const EdgeInsets paddingVerticalMedium = EdgeInsets.symmetric(vertical: spacing16);
  static const EdgeInsets paddingVerticalLarge = EdgeInsets.symmetric(vertical: spacing24);
  
  // Typography - Font sizes
  static const double fontSizeXSmall = 10;
  static const double fontSizeSmall = 12;
  static const double fontSizeRegular = 14;
  static const double fontSizeMedium = 16;
  static const double fontSizeLarge = 18;
  static const double fontSizeXLarge = 20;
  static const double fontSizeXXLarge = 24;
  static const double fontSizeHeading1 = 32;
  static const double fontSizeHeading2 = 28;
  static const double fontSizeHeading3 = 24;
  
  // Line heights
  static const double lineHeightTight = 1.2;
  static const double lineHeightNormal = 1.5;
  static const double lineHeightRelaxed = 1.8;
  
  // Font weights
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;
  
  // Icon sizes
  static const double iconSizeXSmall = 16;
  static const double iconSizeSmall = 20;
  static const double iconSizeMedium = 24;
  static const double iconSizeLarge = 32;
  static const double iconSizeXLarge = 48;
  
  // Opacity values
  static const double opacityDisabled = 0.38;
  static const double opacityHint = 0.6;
  static const double opacityLight = 0.1;
  static const double opacityMedium = 0.5;
  static const double opacityHeavy = 0.8;
  
  // Avatar/Image sizes
  static const double avatarSizeSmall = 32;
  static const double avatarSizeMedium = 48;
  static const double avatarSizeLarge = 64;
  static const double avatarSizeXLarge = 96;
  
  // Button sizes
  static const double buttonHeightSmall = 32;
  static const double buttonHeightMedium = 40;
  static const double buttonHeightLarge = 48;
  static const Size buttonMinimumSize = Size(88, 36);
  
  // Common screen margins
  static const EdgeInsets screenMarginSmall = EdgeInsets.all(spacing16);
  static const EdgeInsets screenMarginMedium = EdgeInsets.all(spacing24);
  static const EdgeInsets screenMarginLarge = EdgeInsets.all(spacing32);
  
  // Divider
  static const double dividerThin = 0.5;
  static const double dividerRegular = 1.0;
  static const double dividerThick = 2.0;
  
  // Responsive breakpoints
  static const double breakpointMobile = 600;
  static const double breakpointTablet = 900;
  static const double breakpointDesktop = 1200;
  static const double breakpointLargeDesktop = 1800;
  
  // Card dimensions
  static const double cardBorderWidth = 1.0;
  static const double cardHeaderHeight = 64;
  static const double cardFooterHeight = 48;
  
  // Appbar heights
  static const double appBarHeightNormal = 56;
  static const double appBarHeightLarge = 64;
  static const double appBarHeightExpanded = 128;
  
  // Shadows
  static const List<BoxShadow> shadowSmall = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];
  
  static const List<BoxShadow> shadowMedium = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ];
  
  static const List<BoxShadow> shadowLarge = [
    BoxShadow(
      color: Color(0x1F000000),
      blurRadius: 12,
      offset: Offset(0, 6),
    ),
  ];
  
  // Input fields
  static const double inputFieldHeight = 56;
  static const double inputFieldMinWidth = 120;
  
  // Tooltip
  static const double tooltipHeight = 32;
  static const EdgeInsets tooltipPadding = EdgeInsets.symmetric(
    horizontal: spacing12,
    vertical: spacing8,
  );
  
  // Snackbar
  static const double snackbarMinWidth = 288;
  static const double snackbarMaxWidth = 568;
  
  // BottomNavigation
  static const double bottomNavHeight = 56;
  static const double bottomNavItemSize = 24;
  
  // Drawer
  static const double drawerWidth = 304;
  static const double drawerModalWidth = 360;
  
  // Checkbox and Radio
  static const double checkboxSize = 20;
  static const double radioSize = 20;
  
  // Progress indicators
  static const double progressIndicatorSizeSmall = 16;
  static const double progressIndicatorSizeMedium = 24;
  static const double progressIndicatorSizeLarge = 48;
  
  // Floating Action Button
  static const double fabSizeSmall = 40;
  static const double fabSizeNormal = 56;
  static const double fabSizeLarge = 96;
}