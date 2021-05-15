import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double height;
  final double width;

  Spacing.height(this.height) : width = 0;

  Spacing.width(this.width) : height = 0;

  Spacing.tinyHeight()
      : width = 0,
        height = 4;

  Spacing.smallHeight()
      : width = 0,
        height = 6;

  Spacing.mediumHeight()
      : width = 0,
        height = 16;

  Spacing.bigHeight()
      : width = 0,
        height = 24;

  Spacing.largeHeight()
      : width = 0,
        height = 32;

  Spacing.tinyWidth()
      : height = 0,
        width = 4;

  Spacing.smallWidth()
      : height = 0,
        width = 6;

  Spacing.mediumWidth()
      : height = 0,
        width = 16;

  Spacing.bigWidth()
      : height = 0,
        width = 24;

  Spacing.largeWidth()
      : height = 0,
        width = 32;

  Spacing.empty()
      : width = 0,
        height = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
