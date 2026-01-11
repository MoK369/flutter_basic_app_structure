import 'package:fit_ui/fit_ui.dart' show DeviceScreenType, BreakpointProvider;
import 'package:flutter/material.dart' show immutable, BuildContext, MediaQuery;

@immutable
class CustomBreakpoints implements BreakpointProvider {
  // Notice sizeOf. It rebuilds only when size changes, not when keyboard opens
  DeviceScreenType of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return getScreenType(width);
  }

  @override
  DeviceScreenType getScreenType(double width) {
    switch (width) {
      case < 600:
        return DeviceScreenType.mobile;
      case < 840:
        return DeviceScreenType.tablet;
      case >= 840:
        return DeviceScreenType.desktop;
      default:
        return DeviceScreenType.mobile;
    }
  }
}
