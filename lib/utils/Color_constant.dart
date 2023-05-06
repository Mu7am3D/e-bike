import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color tealA200C4 = fromHex('#c466e0d1');

  static Color red800 = fromHex('#b93028');

  static Color gray00 = fromHex('#99EBEBF5');

  static Color graydiv = fromHex('#80868782');

  static Color black9003f = fromHex('#3f000000');

  static Color gray50 = fromHex('#fbfbfb');

  static Color gray5087 = fromHex('#87fffbfb');

  static Color gray10 = fromHex('#968686');

  static Color black90087 = fromHex('#87000000');

  static Color black90021 = fromHex('#21000000');

  static Color black90001 = fromHex('#101010');

  static Color gray508701 = fromHex('#87fcfcfc');

  static Color black900 = fromHex('#000000');

  static Color indigo5001 = fromHex('#e6ecf5');

  static Color lightBlueA700 = fromHex('#007aff');

  static Color black90028 = fromHex('#28000000');

  static Color blueGray900 = fromHex('#092242');

  static Color black90003 = fromHex('#0b0b0b');

  static Color black90002 = fromHex('#0e0e0e');

  static Color gray400 = fromHex('#b7b7b5');

  static Color gray500 = fromHex('#958585');

  static Color blue800 = fromHex('#175eb9');

  static Color indigo50 = fromHex('#ebebf5');

  static Color lime900 = fromHex('#6b3d00');

  static Color black900A9 = fromHex('#a9101010');

  static Color gray200 = fromHex('#f1eaf1');

  static Color gray100 = fromHex('#f5f4f4');

  static Color whiteA70087 = fromHex('#87ffffff');

  static Color gray6007f = fromHex('#7f868782');

  static Color black90033 = fromHex('#33000000');

  static Color bluegray400 = fromHex('#888888');

  static Color whiteA70001 = fromHex('#fefdff');

  static Color whiteA70002 = fromHex('#fefcff');

  static Color indigo900 = fromHex('#073a7c');

  static Color whiteA700 = fromHex('#ffffff');

  static Color whiteB700 = fromHex('#fffcfc');

  static Color weth = fromHex('#E6EDF5');



  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
