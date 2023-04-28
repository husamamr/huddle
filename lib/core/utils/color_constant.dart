import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray90002 = fromHex('#2f1616');

  static Color black90001 = fromHex('#020202');

  static Color gray500 = fromHex('#aea07c');

  static Color gray1001e = fromHex('#1ef5f5f5');

  static Color black900 = fromHex('#000000');

  static Color blueGray400 = fromHex('#888888');

  static Color gray90000 = fromHex('#00222222');

  static Color gray900 = fromHex('#301616');

  static Color gray90001 = fromHex('#222222');

  static Color gray400Cc = fromHex('#ccb5b5b5');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray300 = fromHex('#e6e6e6');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
