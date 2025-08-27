import 'package:flutter/material.dart';
import 'package:knowva/core/enums/device_type.dart';

DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  double width = 0;
  final oriantation = mediaQueryData.orientation;
  if (oriantation == Orientation.landscape) {
    width = mediaQueryData.size.height;
  } else {
    width = mediaQueryData.size.width;
  }
  if (width < 600) {
    return DeviceType.mobile;
  } else if (width < 1024) {
    return DeviceType.tablet;
  } else {
    return DeviceType.desktop;
  }
}
