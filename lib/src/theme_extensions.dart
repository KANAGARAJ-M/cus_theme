import 'package:flutter/material.dart';

/// Custom theme extension for app-specific values not covered by standard ThemeData
@immutable
class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  // Card and surface styling
  final Color cardColor;
  final Color cardHoverColor;
  final Color cardSelectedColor;
  final Color shadowColor;
  final BorderRadius borderRadius;
  final EdgeInsets contentPadding;
  
  // Custom colors not in standard Material palette
  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color info;
  final Color onInfo;
  
  // Custom background colors
  final Color backgroundAlt;
  final Color backgroundMuted;
  final Color backgroundFeatured;
  
  // Custom foreground colors
  final Color textMuted;
  final Color textHighlight;
  final Color linkColor;
  final Color linkVisitedColor;
  
  // Custom elements
  final Color tagBackgroundColor;
  final Color tagTextColor;
  final Color badgeBackgroundColor;
  final Color badgeTextColor;
  final Color ratingActiveColor;
  final Color ratingInactiveColor;
  
  // Custom borders and dividers
  final BorderRadius inputBorderRadius;
  final BorderRadius buttonBorderRadius;
  final BorderRadius cardBorderRadius;
  final BorderRadius chipBorderRadius;
  final Color dividerColorAlt;
  
  // Custom sizes
  final double avatarRadius;
  final double iconSizeSmall;
  final double iconSizeMedium;
  final double iconSizeLarge;
  
  // Custom gaps and spacing
  final double itemSpacingSmall;
  final double itemSpacingMedium;
  final double itemSpacingLarge;
  
  // Custom animation properties
  final Duration animationDurationShort;
  final Duration animationDurationMedium;
  final Duration animationDurationLong;
  final Curve animationCurve;
  
  // Feature flags
  final bool useGradientButtons;
  final bool useRoundedAvatars;
  final bool useShadowsOnCards;
  final bool useAnimatedTransitions;

  const CustomThemeExtension({
    // Card and surface styling
    required this.cardColor,
    required this.cardHoverColor,
    required this.cardSelectedColor,
    required this.shadowColor,
    required this.borderRadius,
    required this.contentPadding,
    
    // Custom colors
    required this.success,
    required this.onSuccess,
    required this.warning, 
    required this.onWarning,
    required this.info,
    required this.onInfo,
    
    // Custom background colors
    required this.backgroundAlt,
    required this.backgroundMuted,
    required this.backgroundFeatured,
    
    // Custom foreground colors
    required this.textMuted,
    required this.textHighlight,
    required this.linkColor,
    required this.linkVisitedColor,
    
    // Custom elements
    required this.tagBackgroundColor,
    required this.tagTextColor,
    required this.badgeBackgroundColor,
    required this.badgeTextColor,
    required this.ratingActiveColor,
    required this.ratingInactiveColor,
    
    // Custom borders and dividers
    required this.inputBorderRadius,
    required this.buttonBorderRadius,
    required this.cardBorderRadius,
    required this.chipBorderRadius,
    required this.dividerColorAlt,
    
    // Custom sizes
    required this.avatarRadius,
    required this.iconSizeSmall,
    required this.iconSizeMedium,
    required this.iconSizeLarge,
    
    // Custom gaps and spacing
    required this.itemSpacingSmall,
    required this.itemSpacingMedium,
    required this.itemSpacingLarge,
    
    // Custom animation properties
    required this.animationDurationShort,
    required this.animationDurationMedium,
    required this.animationDurationLong,
    required this.animationCurve,
    
    // Feature flags
    required this.useGradientButtons,
    required this.useRoundedAvatars,
    required this.useShadowsOnCards,
    required this.useAnimatedTransitions,
  });

  // Light theme values
  static const light = CustomThemeExtension(
    // Card and surface styling
    cardColor: Colors.white,
    cardHoverColor: Color(0xFFF5F5F5),
    cardSelectedColor: Color(0xFFE3F2FD),
    shadowColor: Color(0x1A000000), // 10% black shadow
    borderRadius: BorderRadius.all(Radius.circular(8)),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    
    // Custom colors
    success: Color(0xFF4CAF50),
    onSuccess: Colors.white,
    warning: Color(0xFFFF9800),
    onWarning: Colors.black,
    info: Color(0xFF2196F3),
    onInfo: Colors.white,
    
    // Custom background colors
    backgroundAlt: Color(0xFFF5F7FA),
    backgroundMuted: Color(0xFFEEEEEE),
    backgroundFeatured: Color(0xFFE8F5E9),
    
    // Custom foreground colors
    textMuted: Color(0xFF757575),
    textHighlight: Color(0xFF6200EE),
    linkColor: Color(0xFF2196F3),
    linkVisitedColor: Color(0xFF9C27B0),
    
    // Custom elements
    tagBackgroundColor: Color(0xFFEEEEEE),
    tagTextColor: Color(0xFF616161),
    badgeBackgroundColor: Color(0xFFF44336),
    badgeTextColor: Colors.white,
    ratingActiveColor: Color(0xFFFFB400),
    ratingInactiveColor: Color(0xFFDDDDDD),
    
    // Custom borders and dividers
    inputBorderRadius: BorderRadius.all(Radius.circular(4)),
    buttonBorderRadius: BorderRadius.all(Radius.circular(8)),
    cardBorderRadius: BorderRadius.all(Radius.circular(8)),
    chipBorderRadius: BorderRadius.all(Radius.circular(16)),
    dividerColorAlt: Color(0xFFDDDDDD),
    
    // Custom sizes
    avatarRadius: 20.0,
    iconSizeSmall: 16.0,
    iconSizeMedium: 24.0,
    iconSizeLarge: 32.0,
    
    // Custom gaps and spacing
    itemSpacingSmall: 8.0,
    itemSpacingMedium: 16.0,
    itemSpacingLarge: 24.0,
    
    // Custom animation properties
    animationDurationShort: Duration(milliseconds: 200),
    animationDurationMedium: Duration(milliseconds: 300),
    animationDurationLong: Duration(milliseconds: 500),
    animationCurve: Curves.easeInOut,
    
    // Feature flags
    useGradientButtons: false,
    useRoundedAvatars: true,
    useShadowsOnCards: true,
    useAnimatedTransitions: true,
  );

  // Dark theme values
  static const dark = CustomThemeExtension(
    // Card and surface styling
    cardColor: Color(0xFF222222),
    cardHoverColor: Color(0xFF2C2C2C),
    cardSelectedColor: Color(0xFF0D47A1),
    shadowColor: Color(0x1AFFFFFF), // 10% white shadow
    borderRadius: BorderRadius.all(Radius.circular(8)),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    
    // Custom colors
    success: Color(0xFF66BB6A),
    onSuccess: Colors.black,
    warning: Color(0xFFFFB74D),
    onWarning: Colors.black,
    info: Color(0xFF64B5F6),
    onInfo: Colors.black,
    
    // Custom background colors
    backgroundAlt: Color(0xFF1E1E1E),
    backgroundMuted: Color(0xFF2A2A2A),
    backgroundFeatured: Color(0xFF1B5E20),
    
    // Custom foreground colors
    textMuted: Color(0xFFBDBDBD),
    textHighlight: Color(0xFFBB86FC),
    linkColor: Color(0xFF90CAF9),
    linkVisitedColor: Color(0xFFCE93D8),
    
    // Custom elements
    tagBackgroundColor: Color(0xFF333333),
    tagTextColor: Color(0xFFE0E0E0),
    badgeBackgroundColor: Color(0xFFE57373),
    badgeTextColor: Colors.black,
    ratingActiveColor: Color(0xFFFFD54F),
    ratingInactiveColor: Color(0xFF555555),
    
    // Custom borders and dividers
    inputBorderRadius: BorderRadius.all(Radius.circular(4)),
    buttonBorderRadius: BorderRadius.all(Radius.circular(8)),
    cardBorderRadius: BorderRadius.all(Radius.circular(8)),
    chipBorderRadius: BorderRadius.all(Radius.circular(16)),
    dividerColorAlt: Color(0xFF444444),
    
    // Custom sizes
    avatarRadius: 20.0,
    iconSizeSmall: 16.0,
    iconSizeMedium: 24.0,
    iconSizeLarge: 32.0,
    
    // Custom gaps and spacing
    itemSpacingSmall: 8.0,
    itemSpacingMedium: 16.0,
    itemSpacingLarge: 24.0,
    
    // Custom animation properties
    animationDurationShort: Duration(milliseconds: 200),
    animationDurationMedium: Duration(milliseconds: 300),
    animationDurationLong: Duration(milliseconds: 500),
    animationCurve: Curves.easeInOut,
    
    // Feature flags
    useGradientButtons: false,
    useRoundedAvatars: true,
    useShadowsOnCards: true,
    useAnimatedTransitions: true,
  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? cardColor,
    Color? cardHoverColor,
    Color? cardSelectedColor,
    Color? shadowColor,
    BorderRadius? borderRadius,
    EdgeInsets? contentPadding,
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? info,
    Color? onInfo,
    Color? backgroundAlt,
    Color? backgroundMuted,
    Color? backgroundFeatured,
    Color? textMuted,
    Color? textHighlight,
    Color? linkColor,
    Color? linkVisitedColor,
    Color? tagBackgroundColor,
    Color? tagTextColor,
    Color? badgeBackgroundColor,
    Color? badgeTextColor,
    Color? ratingActiveColor,
    Color? ratingInactiveColor,
    BorderRadius? inputBorderRadius,
    BorderRadius? buttonBorderRadius,
    BorderRadius? cardBorderRadius,
    BorderRadius? chipBorderRadius,
    Color? dividerColorAlt,
    double? avatarRadius,
    double? iconSizeSmall,
    double? iconSizeMedium,
    double? iconSizeLarge,
    double? itemSpacingSmall,
    double? itemSpacingMedium,
    double? itemSpacingLarge,
    Duration? animationDurationShort,
    Duration? animationDurationMedium,
    Duration? animationDurationLong,
    Curve? animationCurve,
    bool? useGradientButtons,
    bool? useRoundedAvatars,
    bool? useShadowsOnCards,
    bool? useAnimatedTransitions,
  }) {
    return CustomThemeExtension(
      cardColor: cardColor ?? this.cardColor,
      cardHoverColor: cardHoverColor ?? this.cardHoverColor,
      cardSelectedColor: cardSelectedColor ?? this.cardSelectedColor,
      shadowColor: shadowColor ?? this.shadowColor,
      borderRadius: borderRadius ?? this.borderRadius,
      contentPadding: contentPadding ?? this.contentPadding,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      backgroundAlt: backgroundAlt ?? this.backgroundAlt,
      backgroundMuted: backgroundMuted ?? this.backgroundMuted,
      backgroundFeatured: backgroundFeatured ?? this.backgroundFeatured,
      textMuted: textMuted ?? this.textMuted,
      textHighlight: textHighlight ?? this.textHighlight,
      linkColor: linkColor ?? this.linkColor,
      linkVisitedColor: linkVisitedColor ?? this.linkVisitedColor,
      tagBackgroundColor: tagBackgroundColor ?? this.tagBackgroundColor,
      tagTextColor: tagTextColor ?? this.tagTextColor,
      badgeBackgroundColor: badgeBackgroundColor ?? this.badgeBackgroundColor,
      badgeTextColor: badgeTextColor ?? this.badgeTextColor,
      ratingActiveColor: ratingActiveColor ?? this.ratingActiveColor,
      ratingInactiveColor: ratingInactiveColor ?? this.ratingInactiveColor,
      inputBorderRadius: inputBorderRadius ?? this.inputBorderRadius,
      buttonBorderRadius: buttonBorderRadius ?? this.buttonBorderRadius,
      cardBorderRadius: cardBorderRadius ?? this.cardBorderRadius,
      chipBorderRadius: chipBorderRadius ?? this.chipBorderRadius,
      dividerColorAlt: dividerColorAlt ?? this.dividerColorAlt,
      avatarRadius: avatarRadius ?? this.avatarRadius,
      iconSizeSmall: iconSizeSmall ?? this.iconSizeSmall,
      iconSizeMedium: iconSizeMedium ?? this.iconSizeMedium,
      iconSizeLarge: iconSizeLarge ?? this.iconSizeLarge,
      itemSpacingSmall: itemSpacingSmall ?? this.itemSpacingSmall,
      itemSpacingMedium: itemSpacingMedium ?? this.itemSpacingMedium,
      itemSpacingLarge: itemSpacingLarge ?? this.itemSpacingLarge,
      animationDurationShort: animationDurationShort ?? this.animationDurationShort,
      animationDurationMedium: animationDurationMedium ?? this.animationDurationMedium,
      animationDurationLong: animationDurationLong ?? this.animationDurationLong,
      animationCurve: animationCurve ?? this.animationCurve,
      useGradientButtons: useGradientButtons ?? this.useGradientButtons,
      useRoundedAvatars: useRoundedAvatars ?? this.useRoundedAvatars,
      useShadowsOnCards: useShadowsOnCards ?? this.useShadowsOnCards,
      useAnimatedTransitions: useAnimatedTransitions ?? this.useAnimatedTransitions,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
    covariant ThemeExtension<CustomThemeExtension>? other,
    double t,
  ) {
    if (other is! CustomThemeExtension) {
      return this;
    }
    return CustomThemeExtension(
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      cardHoverColor: Color.lerp(cardHoverColor, other.cardHoverColor, t)!,
      cardSelectedColor: Color.lerp(cardSelectedColor, other.cardSelectedColor, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
      contentPadding: EdgeInsets.lerp(contentPadding, other.contentPadding, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      backgroundAlt: Color.lerp(backgroundAlt, other.backgroundAlt, t)!,
      backgroundMuted: Color.lerp(backgroundMuted, other.backgroundMuted, t)!,
      backgroundFeatured: Color.lerp(backgroundFeatured, other.backgroundFeatured, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      textHighlight: Color.lerp(textHighlight, other.textHighlight, t)!,
      linkColor: Color.lerp(linkColor, other.linkColor, t)!,
      linkVisitedColor: Color.lerp(linkVisitedColor, other.linkVisitedColor, t)!,
      tagBackgroundColor: Color.lerp(tagBackgroundColor, other.tagBackgroundColor, t)!,
      tagTextColor: Color.lerp(tagTextColor, other.tagTextColor, t)!,
      badgeBackgroundColor: Color.lerp(badgeBackgroundColor, other.badgeBackgroundColor, t)!,
      badgeTextColor: Color.lerp(badgeTextColor, other.badgeTextColor, t)!,
      ratingActiveColor: Color.lerp(ratingActiveColor, other.ratingActiveColor, t)!,
      ratingInactiveColor: Color.lerp(ratingInactiveColor, other.ratingInactiveColor, t)!,
      inputBorderRadius: BorderRadius.lerp(inputBorderRadius, other.inputBorderRadius, t)!,
      buttonBorderRadius: BorderRadius.lerp(buttonBorderRadius, other.buttonBorderRadius, t)!,
      cardBorderRadius: BorderRadius.lerp(cardBorderRadius, other.cardBorderRadius, t)!,
      chipBorderRadius: BorderRadius.lerp(chipBorderRadius, other.chipBorderRadius, t)!,
      dividerColorAlt: Color.lerp(dividerColorAlt, other.dividerColorAlt, t)!,
      avatarRadius: lerpDouble(avatarRadius, other.avatarRadius, t),
      iconSizeSmall: lerpDouble(iconSizeSmall, other.iconSizeSmall, t),
      iconSizeMedium: lerpDouble(iconSizeMedium, other.iconSizeMedium, t),
      iconSizeLarge: lerpDouble(iconSizeLarge, other.iconSizeLarge, t),
      itemSpacingSmall: lerpDouble(itemSpacingSmall, other.itemSpacingSmall, t),
      itemSpacingMedium: lerpDouble(itemSpacingMedium, other.itemSpacingMedium, t),
      itemSpacingLarge: lerpDouble(itemSpacingLarge, other.itemSpacingLarge, t),
      // Animation durations and curves do not need to be lerped
      animationDurationShort: t < 0.5 ? animationDurationShort : other.animationDurationShort,
      animationDurationMedium: t < 0.5 ? animationDurationMedium : other.animationDurationMedium,
      animationDurationLong: t < 0.5 ? animationDurationLong : other.animationDurationLong,
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      // Feature flags don't need to be lerped, just choose one based on t
      useGradientButtons: t < 0.5 ? useGradientButtons : other.useGradientButtons,
      useRoundedAvatars: t < 0.5 ? useRoundedAvatars : other.useRoundedAvatars,
      useShadowsOnCards: t < 0.5 ? useShadowsOnCards : other.useShadowsOnCards,
      useAnimatedTransitions: t < 0.5 ? useAnimatedTransitions : other.useAnimatedTransitions,
    );
  }
  
  // Helper method to get a custom shadow based on elevation
  List<BoxShadow> getShadows(double elevation) {
    if (!useShadowsOnCards || elevation <= 0) {
      return [];
    }
    
    final double opacity = 0.1 + (elevation * 0.03).clamp(0.0, 0.3);
    return [
      BoxShadow(
        color: shadowColor.withOpacity(opacity),
        blurRadius: elevation * 2,
        spreadRadius: elevation * 0.2,
        offset: Offset(0, elevation),
      ),
    ];
  }
  
  // Helper method to get different card styles
  BoxDecoration getCardDecoration({
    double elevation = 1.0, 
    bool isHovered = false, 
    bool isSelected = false,
    BorderRadius? customBorderRadius,
  }) {
    Color bgColor = cardColor;
    if (isSelected) {
      bgColor = cardSelectedColor;
    } else if (isHovered) {
      bgColor = cardHoverColor;
    }
    
    return BoxDecoration(
      color: bgColor,
      borderRadius: customBorderRadius ?? cardBorderRadius,
      boxShadow: getShadows(elevation),
    );
  }
  
  // Helper method to get gradient for buttons if enabled
  Gradient? getButtonGradient() {
    if (!useGradientButtons) return null;
    
    // This is just a sample gradient - you can customize this
    return LinearGradient(
      colors: [success, success.withBlue((success.blue + 40).clamp(0, 255))],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
  
  // Convenient way to apply spacing
  EdgeInsets getSpacing(String size) {
    switch (size) {
      case 'small':
        return EdgeInsets.all(itemSpacingSmall);
      case 'medium':
        return EdgeInsets.all(itemSpacingMedium);
      case 'large':
        return EdgeInsets.all(itemSpacingLarge);
      default:
        return EdgeInsets.all(itemSpacingMedium);
    }
  }
  
  // Helper to get the appropriate icon size
  double getIconSize(String size) {
    switch (size) {
      case 'small':
        return iconSizeSmall;
      case 'medium':
        return iconSizeMedium;
      case 'large':
        return iconSizeLarge;
      default:
        return iconSizeMedium;
    }
  }
  
  // Helper method to access this extension from a BuildContext
  static CustomThemeExtension of(BuildContext context) {
    return Theme.of(context).extension<CustomThemeExtension>()!;
  }
  
  // Static helper to apply custom theming to widget by wrapping it
  static Widget withTheme({
    required Widget child,
    required BuildContext context,
    bool useAnimation = true,
  }) {
    final CustomThemeExtension theme = of(context);
    
    if (useAnimation && theme.useAnimatedTransitions) {
      return AnimatedTheme(
        data: Theme.of(context),
        duration: theme.animationDurationMedium,
        curve: theme.animationCurve,
        child: child,
      );
    }
    
    return child;
  }
  
  // Static helper to create common widgets with consistent theming
  static Widget createTag(BuildContext context, String text) {
    final theme = of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.tagBackgroundColor,
        borderRadius: theme.chipBorderRadius,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: theme.tagTextColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
  
  static Widget createBadge(BuildContext context, String text) {
    final theme = of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: theme.badgeBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: theme.badgeTextColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  
  // Static helper for a simple rating display
  static Widget createRating(BuildContext context, double rating, {int maxRating = 5}) {
    final theme = of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        final bool isActive = index < rating;
        return Icon(
          Icons.star,
          size: 16,
          color: isActive ? theme.ratingActiveColor : theme.ratingInactiveColor,
        );
      }),
    );
  }
}

// Helper function for lerp of double values
double lerpDouble(double a, double b, double t) {
  return a + (b - a) * t;
}