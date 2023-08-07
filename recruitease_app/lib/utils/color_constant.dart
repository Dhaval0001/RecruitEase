import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray500 = fromHex('#9c9c9c');

  static Color black900 = fromHex('#000000');

  static Color lightBlueA400 = fromHex('#00b0ff');

  static Color gray900 = fromHex('#1e1e1e');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
