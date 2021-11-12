import 'package:flutter/material.dart';

Widget backgroundColor(
        {@required Widget child, @required List<Color> colors}) =>
    ShaderMask(
      child: child,
      shaderCallback: (bounds) =>
          LinearGradient(colors: colors).createShader(bounds),
    );
