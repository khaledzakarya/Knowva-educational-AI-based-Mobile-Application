import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  final Size size = mediaQueryData.size;
  final double width = size.width;
  final double height = size.height;

  // Phones: typically <600px width
  if (width < 600 && height < 1000) {
    return DeviceType.phone;
  }

  // Small tablets (portrait): width between 600–904
  if (width >= 600 && width < 905 && height >= 960) {
    return DeviceType.tablet;
  }

  // Large tablets (landscape): width between 905–1239
  if (width >= 905 && width < 1240 && height >= 600) {
    return DeviceType.tablet;
  }

  // Small desktop / laptops
  if (width >= 1240 && width < 1440) {
    return DeviceType.desktop;
  }

  // Large desktops
  if (width >= 1440) {
    return DeviceType.desktop;
  }

  // Fallback
  return DeviceType.phone;
}
